use cirru_edn::{Edn, EdnListView};
use std::collections::HashMap;
use std::io::{BufRead, BufReader, Read};
use std::panic::{AssertUnwindSafe, catch_unwind};
use std::process::{Child, Command, Stdio};
use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
use std::sync::{Arc, Mutex, OnceLock, mpsc};
use std::thread;
use std::time::Duration;

use crate::ffi::{
  CalcitFfiAsyncHostV1, CalcitFfiAsyncTaskV1, FFI_STATUS_HANDLE_CLOSING, FFI_STATUS_HANDLE_FINISHED, FFI_STATUS_INTERNAL_ERROR,
  FFI_STATUS_INVALID_PAYLOAD, FFI_STATUS_OK, FFI_TASK_SERIAL_EVENTS, FFI_TASK_STREAM, configure_task, prepare_async_call,
  publish_complete, publish_emit, publish_failure,
};

fn parse_command(args: &[Edn], method: &str) -> Result<(String, String, Vec<String>), String> {
  let [Edn::Str(dir), Edn::List(EdnListView(parts))] = args else {
    return Err(format!("{method} expected working directory and command list: {args:?}"));
  };
  let mut command = parts.iter();
  let Some(Edn::Str(program)) = command.next() else {
    return Err(format!("{method} expected a non-empty string command: {args:?}"));
  };
  let extra_args = command
    .map(|part| match part {
      Edn::Str(value) => Ok(value.to_string()),
      _ => Err(format!("{method} expected string arguments: {args:?}")),
    })
    .collect::<Result<Vec<_>, _>>()?;
  Ok((dir.to_string(), program.to_string(), extra_args))
}

#[unsafe(no_mangle)]
pub fn execute_command(args: Vec<Edn>) -> Result<Edn, String> {
  let (dir, program, extra_args) = parse_command(&args, "execute-command")?;
  let output = Command::new(program)
    .current_dir(dir)
    .args(extra_args)
    .output()
    .map_err(|error| format!("failed to execute command: {error}"))?;
  let stdout = String::from_utf8(output.stdout).map_err(|error| format!("command stdout is not UTF-8: {error}"))?;
  let stderr = String::from_utf8(output.stderr).map_err(|error| format!("command stderr is not UTF-8: {error}"))?;
  Ok(Edn::List(EdnListView(vec![Edn::Str(stdout.into()), Edn::Str(stderr.into())])))
}

enum PipeEvent {
  Line(&'static str, String),
  Error(&'static str, String),
}

fn forward_lines<R: Read + Send + 'static>(pipe: R, name: &'static str, tx: mpsc::Sender<PipeEvent>) {
  thread::spawn(move || {
    for line in BufReader::new(pipe).lines() {
      match line {
        Ok(content) => {
          if tx.send(PipeEvent::Line(name, content + "\n")).is_err() {
            return;
          }
        }
        Err(error) => {
          let _ = tx.send(PipeEvent::Error(name, error.to_string()));
          return;
        }
      }
    }
  });
}

struct ProcessControl {
  cancelled: AtomicBool,
  child: Mutex<Option<Child>>,
  host: CalcitFfiAsyncHostV1,
  task: CalcitFfiAsyncTaskV1,
}

static PROCESS_CONTROLS: OnceLock<Mutex<HashMap<u64, Arc<ProcessControl>>>> = OnceLock::new();
static NEXT_PROCESS_CONTEXT: AtomicU64 = AtomicU64::new(1);

fn process_controls() -> &'static Mutex<HashMap<u64, Arc<ProcessControl>>> {
  PROCESS_CONTROLS.get_or_init(|| Mutex::new(HashMap::new()))
}

fn next_process_context() -> u64 {
  loop {
    let id = NEXT_PROCESS_CONTEXT.fetch_add(1, Ordering::Relaxed);
    if id != 0 {
      return id;
    }
  }
}

unsafe extern "C" fn cancel_process(task_context: u64, _task_handle: u64, reason_ptr: *const u8, reason_len: usize) -> i32 {
  if reason_ptr.is_null() && reason_len != 0 {
    return FFI_STATUS_INVALID_PAYLOAD;
  }
  let control = process_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .get(&task_context)
    .cloned();
  let Some(control) = control else {
    return FFI_STATUS_HANDLE_FINISHED;
  };
  control.cancelled.store(true, Ordering::Release);
  if let Some(child) = control.child.lock().unwrap_or_else(|poisoned| poisoned.into_inner()).as_mut() {
    let _ = child.kill();
  }
  FFI_STATUS_OK
}

fn wait_for_child(control: &ProcessControl) {
  loop {
    let done = {
      let mut child = control.child.lock().unwrap_or_else(|poisoned| poisoned.into_inner());
      match child.as_mut().and_then(|child| child.try_wait().ok()).flatten() {
        Some(_) => true,
        None => {
          if control.cancelled.load(Ordering::Acquire)
            && let Some(child) = child.as_mut()
          {
            let _ = child.kill();
          }
          false
        }
      }
    };
    if done {
      return;
    }
    thread::sleep(Duration::from_millis(5));
  }
}

fn run_process_stream(
  context: u64,
  control: Arc<ProcessControl>,
  stdout: impl Read + Send + 'static,
  stderr: impl Read + Send + 'static,
) {
  let (tx, rx) = mpsc::channel();
  forward_lines(stdout, "stdout", tx.clone());
  forward_lines(stderr, "stderr", tx.clone());
  drop(tx);
  let mut failure = None;
  for event in rx {
    if control.cancelled.load(Ordering::Acquire) {
      break;
    }
    match event {
      PipeEvent::Line(name, content) => {
        let event = Edn::typed_enum("ProcessOutput", name, vec![Edn::Str(content.into())]);
        let status = publish_emit(control.host, control.task, vec![event]);
        if status != FFI_STATUS_OK {
          if !matches!(status, FFI_STATUS_HANDLE_CLOSING | FFI_STATUS_HANDLE_FINISHED) {
            failure = Some(format!("host rejected process output with status {status}"));
          }
          break;
        }
      }
      PipeEvent::Error(name, error) => {
        failure = Some(format!("failed to read process {name}: {error}"));
        break;
      }
    }
  }
  if failure.is_some() {
    control.cancelled.store(true, Ordering::Release);
    if let Some(child) = control.child.lock().unwrap_or_else(|poisoned| poisoned.into_inner()).as_mut() {
      let _ = child.kill();
    }
  }
  wait_for_child(&control);
  let status = match failure {
    Some(error) => publish_failure(control.host, control.task, error),
    None => publish_complete(control.host, control.task),
  };
  if status != FFI_STATUS_OK {
    eprintln!(
      "process stream task {} failed to terminate with status {status}",
      control.task.handle
    );
  }
  process_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .remove(&context);
}

unsafe fn start_stream_command_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> i32 {
  // SAFETY: forwarded from the exported async ABI contract.
  let (args, task, host) = match unsafe { prepare_async_call(request_ptr, request_len, task, host) } {
    Ok(values) => values,
    Err(status) => return status,
  };
  let (dir, program, extra_args) = match parse_command(&args, "stream-command") {
    Ok(command) => command,
    Err(_) => return FFI_STATUS_INVALID_PAYLOAD,
  };
  let mut child = match Command::new(program)
    .current_dir(dir)
    .args(extra_args)
    .stdout(Stdio::piped())
    .stderr(Stdio::piped())
    .spawn()
  {
    Ok(child) => child,
    Err(_) => return FFI_STATUS_INVALID_PAYLOAD,
  };
  let Some(stdout) = child.stdout.take() else {
    let _ = child.kill();
    return FFI_STATUS_INTERNAL_ERROR;
  };
  let Some(stderr) = child.stderr.take() else {
    let _ = child.kill();
    return FFI_STATUS_INTERNAL_ERROR;
  };
  let context = next_process_context();
  let control = Arc::new(ProcessControl {
    cancelled: AtomicBool::new(false),
    child: Mutex::new(Some(child)),
    host,
    task,
  });
  process_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .insert(context, Arc::clone(&control));
  let status = configure_task(host, task, FFI_TASK_STREAM, FFI_TASK_SERIAL_EVENTS, context, cancel_process);
  if status != FFI_STATUS_OK {
    if let Some(child) = control.child.lock().unwrap_or_else(|poisoned| poisoned.into_inner()).as_mut() {
      let _ = child.kill();
    }
    process_controls()
      .lock()
      .unwrap_or_else(|poisoned| poisoned.into_inner())
      .remove(&context);
    return status;
  }
  thread::spawn(move || {
    if catch_unwind(AssertUnwindSafe(|| {
      run_process_stream(context, Arc::clone(&control), stdout, stderr)
    }))
    .is_err()
    {
      let _ = publish_failure(control.host, control.task, "process stream worker panicked");
      process_controls()
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner())
        .remove(&context);
    }
  });
  FFI_STATUS_OK
}

/// Start a cancellable process-output stream through async protocol v1.
///
/// # Safety
///
/// Request bytes and both descriptors must remain readable for this call.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn stream_command_calcit_ffi_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> i32 {
  catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: forwarded from the exported C contract above.
    unsafe { start_stream_command_async_v1(request_ptr, request_len, task, host) }
  }))
  .unwrap_or(FFI_STATUS_INTERNAL_ERROR)
}

struct SignalControl {
  finished: AtomicBool,
  host: CalcitFfiAsyncHostV1,
  task: CalcitFfiAsyncTaskV1,
}

static SIGNAL_CONTROLS: OnceLock<Mutex<HashMap<u64, Arc<SignalControl>>>> = OnceLock::new();
static NEXT_SIGNAL_CONTEXT: AtomicU64 = AtomicU64::new(1);
static CTRL_C_INIT: OnceLock<Result<(), String>> = OnceLock::new();

fn signal_controls() -> &'static Mutex<HashMap<u64, Arc<SignalControl>>> {
  SIGNAL_CONTROLS.get_or_init(|| Mutex::new(HashMap::new()))
}

fn next_signal_context() -> u64 {
  loop {
    let id = NEXT_SIGNAL_CONTEXT.fetch_add(1, Ordering::Relaxed);
    if id != 0 {
      return id;
    }
  }
}

fn dispatch_ctrl_c() {
  let controls = signal_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .iter()
    .map(|(context, control)| (*context, Arc::clone(control)))
    .collect::<Vec<_>>();
  let mut finished = vec![];
  for (context, control) in controls {
    if !control.finished.load(Ordering::Acquire) {
      let status = publish_emit(control.host, control.task, vec![]);
      if matches!(status, FFI_STATUS_HANDLE_CLOSING | FFI_STATUS_HANDLE_FINISHED) {
        control.finished.store(true, Ordering::Release);
        finished.push(context);
      } else if status != FFI_STATUS_OK {
        eprintln!("Ctrl+C task {} rejected signal with status {status}", control.task.handle);
      }
    }
  }
  if !finished.is_empty() {
    let mut controls = signal_controls().lock().unwrap_or_else(|poisoned| poisoned.into_inner());
    for context in finished {
      controls.remove(&context);
    }
  }
}

fn ensure_ctrl_c_dispatcher() -> Result<(), String> {
  CTRL_C_INIT
    .get_or_init(|| {
      let (tx, rx) = mpsc::sync_channel(1);
      ctrlc::set_handler(move || {
        let _ = tx.try_send(());
      })
      .map_err(|error| format!("failed to install Ctrl+C handler: {error}"))?;
      thread::spawn(move || {
        while rx.recv().is_ok() {
          dispatch_ctrl_c();
        }
      });
      Ok(())
    })
    .clone()
}

unsafe extern "C" fn cancel_signal(task_context: u64, _task_handle: u64, reason_ptr: *const u8, reason_len: usize) -> i32 {
  if reason_ptr.is_null() && reason_len != 0 {
    return FFI_STATUS_INVALID_PAYLOAD;
  }
  let control = signal_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .remove(&task_context);
  let Some(control) = control else {
    return FFI_STATUS_HANDLE_FINISHED;
  };
  if !control.finished.swap(true, Ordering::AcqRel) {
    let status = publish_complete(control.host, control.task);
    if status != FFI_STATUS_OK {
      return status;
    }
  }
  FFI_STATUS_OK
}

unsafe fn start_on_ctrl_c_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> i32 {
  // SAFETY: forwarded from the exported async ABI contract.
  let (args, task, host) = match unsafe { prepare_async_call(request_ptr, request_len, task, host) } {
    Ok(values) => values,
    Err(status) => return status,
  };
  if !args.is_empty() || ensure_ctrl_c_dispatcher().is_err() {
    return FFI_STATUS_INVALID_PAYLOAD;
  }
  let context = next_signal_context();
  let control = Arc::new(SignalControl {
    finished: AtomicBool::new(false),
    host,
    task,
  });
  signal_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .insert(context, control);
  let status = configure_task(host, task, FFI_TASK_STREAM, FFI_TASK_SERIAL_EVENTS, context, cancel_signal);
  if status != FFI_STATUS_OK {
    signal_controls()
      .lock()
      .unwrap_or_else(|poisoned| poisoned.into_inner())
      .remove(&context);
  }
  status
}

/// Register a cancellable Ctrl+C event stream through async protocol v1.
///
/// # Safety
///
/// Request bytes and both descriptors must remain readable for this call.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn on_ctrl_c_calcit_ffi_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> i32 {
  catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: forwarded from the exported C contract above.
    unsafe { start_on_ctrl_c_async_v1(request_ptr, request_len, task, host) }
  }))
  .unwrap_or(FFI_STATUS_INTERNAL_ERROR)
}

#[unsafe(no_mangle)]
pub fn stream_command(
  args: Vec<Edn>,
  handler: Arc<dyn Fn(Vec<Edn>) -> Result<Edn, String> + Send + Sync + 'static>,
  finish: Box<dyn FnOnce() + Send + Sync + 'static>,
) -> Result<Edn, String> {
  let (dir, program, extra_args) = parse_command(&args, "stream-command")?;
  let mut child = Command::new(program)
    .current_dir(dir)
    .args(extra_args)
    .stdout(Stdio::piped())
    .stderr(Stdio::piped())
    .spawn()
    .map_err(|error| format!("failed to spawn command: {error}"))?;
  let stdout = child.stdout.take().ok_or("failed to capture stdout")?;
  let stderr = child.stderr.take().ok_or("failed to capture stderr")?;
  let (tx, rx) = mpsc::channel();
  forward_lines(stdout, "stdout", tx.clone());
  forward_lines(stderr, "stderr", tx.clone());
  drop(tx);
  thread::spawn(move || {
    for event in rx {
      match event {
        PipeEvent::Line(name, content) => {
          let event = Edn::typed_enum("ProcessOutput", name, vec![Edn::Str(content.into())]);
          if let Err(error) = handler(vec![event]) {
            eprintln!("stream callback failed: {error}");
            break;
          }
        }
        PipeEvent::Error(name, error) => {
          eprintln!("failed to read process {name}: {error}");
          break;
        }
      }
    }
    let _ = child.wait();
    finish();
  });
  Ok(Edn::Nil)
}

#[cfg(test)]
mod tests {
  use super::*;
  use crate::ffi::{AsyncTaskCancel, CalcitFfiAsyncHostV1, FFI_EVENT_COMPLETE, FFI_EVENT_EMIT, encode_callback_args};
  use std::ptr;
  use std::time::Instant;

  type Config = (u64, AsyncTaskCancel);
  type EventLog = Vec<(u32, Vec<u8>)>;
  static EVENTS: OnceLock<Mutex<EventLog>> = OnceLock::new();
  static CONFIG: OnceLock<Mutex<Option<Config>>> = OnceLock::new();
  static TEST_LOCK: OnceLock<Mutex<()>> = OnceLock::new();

  unsafe extern "C" fn enqueue(
    _context: u64,
    _task_handle: u64,
    kind: u32,
    _response_handle: u64,
    payload_ptr: *const u8,
    payload_len: usize,
  ) -> i32 {
    let payload = if payload_len == 0 {
      vec![]
    } else {
      // SAFETY: the module keeps event payloads readable for this host call.
      unsafe { std::slice::from_raw_parts(payload_ptr, payload_len) }.to_vec()
    };
    EVENTS
      .get_or_init(|| Mutex::new(vec![]))
      .lock()
      .expect("events")
      .push((kind, payload));
    FFI_STATUS_OK
  }

  unsafe extern "C" fn configure(
    _context: u64,
    _task_handle: u64,
    _kind: u32,
    _flags: u32,
    task_context: u64,
    cancel: Option<AsyncTaskCancel>,
  ) -> i32 {
    *CONFIG.get_or_init(|| Mutex::new(None)).lock().expect("config") = cancel.map(|cancel| (task_context, cancel));
    FFI_STATUS_OK
  }

  fn descriptors(handle: u64) -> (CalcitFfiAsyncTaskV1, CalcitFfiAsyncHostV1) {
    (
      CalcitFfiAsyncTaskV1 {
        protocol_version: 1,
        struct_size: std::mem::size_of::<CalcitFfiAsyncTaskV1>() as u32,
        handle,
        kind: FFI_TASK_STREAM,
        flags: FFI_TASK_SERIAL_EVENTS,
      },
      CalcitFfiAsyncHostV1 {
        protocol_version: 1,
        struct_size: std::mem::size_of::<CalcitFfiAsyncHostV1>() as u32,
        context: 1,
        enqueue: Some(enqueue),
        configure_task: Some(configure),
        open_response: None,
      },
    )
  }

  fn wait_for_event_count(kind: u32, count: usize) {
    let deadline = Instant::now() + Duration::from_secs(2);
    while Instant::now() < deadline {
      let found = EVENTS
        .get_or_init(|| Mutex::new(vec![]))
        .lock()
        .expect("events")
        .iter()
        .filter(|(event_kind, _)| *event_kind == kind)
        .count();
      if found >= count {
        return;
      }
      thread::sleep(Duration::from_millis(2));
    }
    panic!("timed out waiting for {count} event(s) of kind {kind}");
  }

  fn command_request(script: &str) -> Vec<u8> {
    let dir = std::env::current_dir().expect("cwd").to_string_lossy().into_owned();
    encode_callback_args(vec![
      Edn::str(dir),
      Edn::List(EdnListView(vec![Edn::str("sh"), Edn::str("-c"), Edn::str(script)])),
    ])
    .expect("request")
  }

  #[test]
  fn process_streams_output_and_acknowledges_cancellation() {
    let _guard = TEST_LOCK.get_or_init(|| Mutex::new(())).lock().expect("test lock");
    EVENTS.get_or_init(|| Mutex::new(vec![])).lock().expect("events").clear();
    let (task, host) = descriptors(201);
    let request = command_request("printf 'hello\\n'");
    assert_eq!(
      unsafe { stream_command_calcit_ffi_async_v1(request.as_ptr(), request.len(), &task, &host) },
      FFI_STATUS_OK
    );
    wait_for_event_count(FFI_EVENT_EMIT, 1);
    wait_for_event_count(FFI_EVENT_COMPLETE, 1);
    let payload = EVENTS
      .get()
      .expect("events")
      .lock()
      .expect("events")
      .iter()
      .find(|(kind, _)| *kind == FFI_EVENT_EMIT)
      .expect("emit")
      .1
      .clone();
    let decoded = cirru_edn::parse(std::str::from_utf8(&payload).expect("UTF-8 event")).expect("event EDN");
    assert!(format!("{decoded}").contains("hello"));

    let request = command_request("exec sleep 5");
    let (task, host) = descriptors(202);
    assert_eq!(
      unsafe { stream_command_calcit_ffi_async_v1(request.as_ptr(), request.len(), &task, &host) },
      FFI_STATUS_OK
    );
    let (context, cancel) = CONFIG.get().expect("config").lock().expect("config").expect("configured");
    assert_eq!(unsafe { cancel(context, task.handle, ptr::null(), 0) }, FFI_STATUS_OK);
    wait_for_event_count(FFI_EVENT_COMPLETE, 2);
  }

  #[test]
  fn ctrl_c_subscription_is_cancellable() {
    let _guard = TEST_LOCK.get_or_init(|| Mutex::new(())).lock().expect("test lock");
    let complete_before = EVENTS
      .get_or_init(|| Mutex::new(vec![]))
      .lock()
      .expect("events")
      .iter()
      .filter(|(kind, _)| *kind == FFI_EVENT_COMPLETE)
      .count();
    let request = encode_callback_args(vec![]).expect("request");
    let (task, host) = descriptors(203);
    assert_eq!(
      unsafe { on_ctrl_c_calcit_ffi_async_v1(request.as_ptr(), request.len(), &task, &host) },
      FFI_STATUS_OK
    );
    let (context, cancel) = CONFIG.get().expect("config").lock().expect("config").expect("configured");
    assert_eq!(unsafe { cancel(context, task.handle, ptr::null(), 0) }, FFI_STATUS_OK);
    wait_for_event_count(FFI_EVENT_COMPLETE, complete_before + 1);
  }
}
