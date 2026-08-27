use cirru_edn::Edn;
use std::collections::HashMap;
use std::panic::{AssertUnwindSafe, catch_unwind};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, Condvar, Mutex, OnceLock};
use std::thread::spawn;
use std::time::Duration;

use crate::ffi::{
  CalcitFfiAsyncHostV1, CalcitFfiAsyncTaskV1, FFI_STATUS_HANDLE_FINISHED, FFI_STATUS_INTERNAL_ERROR, FFI_STATUS_INVALID_PAYLOAD,
  FFI_STATUS_OK, FFI_TASK_COALESCE_ALLOWED, FFI_TASK_ONE_SHOT, FFI_TASK_SERIAL_EVENTS, FFI_TASK_STREAM, configure_task,
  prepare_async_call, publish_complete, publish_emit, publish_failure,
};

struct TimerControl {
  cancelled: Mutex<bool>,
  wake: Condvar,
  host: CalcitFfiAsyncHostV1,
  task: CalcitFfiAsyncTaskV1,
}

static TIMER_CONTROLS: OnceLock<Mutex<HashMap<u64, Arc<TimerControl>>>> = OnceLock::new();
static NEXT_TIMER_CONTEXT: AtomicU64 = AtomicU64::new(1);

fn timer_controls() -> &'static Mutex<HashMap<u64, Arc<TimerControl>>> {
  TIMER_CONTROLS.get_or_init(|| Mutex::new(HashMap::new()))
}

fn next_timer_context() -> u64 {
  loop {
    let id = NEXT_TIMER_CONTEXT.fetch_add(1, Ordering::Relaxed);
    if id != 0 {
      return id;
    }
  }
}

fn parse_duration(args: &[Edn], method: &str) -> Result<Duration, String> {
  let [Edn::Number(milliseconds)] = args else {
    return Err(format!("{method} expected one duration in milliseconds: {args:?}"));
  };
  if !milliseconds.is_finite() || *milliseconds < 0.0 || *milliseconds > u64::MAX as f64 {
    return Err(format!("{method} expected a finite non-negative duration, got {milliseconds}"));
  }
  Ok(Duration::from_millis(*milliseconds as u64))
}

fn wait_until(control: &TimerControl, duration: Duration) -> bool {
  let cancelled = control.cancelled.lock().unwrap_or_else(|poisoned| poisoned.into_inner());
  if *cancelled {
    return true;
  }
  let (cancelled, _) = control
    .wake
    .wait_timeout_while(cancelled, duration, |cancelled| !*cancelled)
    .unwrap_or_else(|poisoned| poisoned.into_inner());
  *cancelled
}

fn finish_timer(context: u64, control: &TimerControl) {
  let status = publish_complete(control.host, control.task);
  if status != FFI_STATUS_OK {
    eprintln!("timer task {} failed to complete with status {status}", control.task.handle);
  }
  timer_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .remove(&context);
}

unsafe extern "C" fn cancel_timer(task_context: u64, _task_handle: u64, reason_ptr: *const u8, reason_len: usize) -> i32 {
  if reason_ptr.is_null() && reason_len != 0 {
    return FFI_STATUS_INVALID_PAYLOAD;
  }
  let control = timer_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .get(&task_context)
    .cloned();
  let Some(control) = control else {
    return FFI_STATUS_HANDLE_FINISHED;
  };
  *control.cancelled.lock().unwrap_or_else(|poisoned| poisoned.into_inner()) = true;
  control.wake.notify_all();
  FFI_STATUS_OK
}

unsafe fn start_timer_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
  repeating: bool,
) -> i32 {
  // SAFETY: forwarded from the exported async ABI contract.
  let (args, task, host) = match unsafe { prepare_async_call(request_ptr, request_len, task, host) } {
    Ok(values) => values,
    Err(status) => return status,
  };
  let duration = match parse_duration(&args, if repeating { "set-interval" } else { "set-timeout" }) {
    Ok(duration) => duration,
    Err(_) => return FFI_STATUS_INVALID_PAYLOAD,
  };
  if repeating && duration.is_zero() {
    return FFI_STATUS_INVALID_PAYLOAD;
  }
  let context = next_timer_context();
  let control = Arc::new(TimerControl {
    cancelled: Mutex::new(false),
    wake: Condvar::new(),
    host,
    task,
  });
  timer_controls()
    .lock()
    .unwrap_or_else(|poisoned| poisoned.into_inner())
    .insert(context, Arc::clone(&control));
  let flags = FFI_TASK_SERIAL_EVENTS | if repeating { FFI_TASK_COALESCE_ALLOWED } else { 0 };
  let kind = if repeating { FFI_TASK_STREAM } else { FFI_TASK_ONE_SHOT };
  let status = configure_task(host, task, kind, flags, context, cancel_timer);
  if status != FFI_STATUS_OK {
    timer_controls()
      .lock()
      .unwrap_or_else(|poisoned| poisoned.into_inner())
      .remove(&context);
    return status;
  }
  spawn(move || {
    let outcome = catch_unwind(AssertUnwindSafe(|| {
      if repeating {
        loop {
          if wait_until(&control, duration) {
            break;
          }
          let status = publish_emit(control.host, control.task, vec![]);
          if status != FFI_STATUS_OK {
            break;
          }
        }
      } else if !wait_until(&control, duration) {
        let _ = publish_emit(control.host, control.task, vec![]);
      }
    }));
    if outcome.is_err() {
      let _ = publish_failure(control.host, control.task, "timer worker panicked");
      timer_controls()
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner())
        .remove(&context);
    } else {
      finish_timer(context, &control);
    }
  });
  FFI_STATUS_OK
}

/// Start a cancellable one-shot timer through async protocol v1.
///
/// # Safety
///
/// Request bytes and both descriptors must remain readable for this call.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn set_timeout_calcit_ffi_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> i32 {
  catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: forwarded from the exported C contract above.
    unsafe { start_timer_async_v1(request_ptr, request_len, task, host, false) }
  }))
  .unwrap_or(FFI_STATUS_INTERNAL_ERROR)
}

/// Start a cancellable repeating timer through async protocol v1.
///
/// # Safety
///
/// Request bytes and both descriptors must remain readable for this call.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn set_interval_calcit_ffi_async_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> i32 {
  catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: forwarded from the exported C contract above.
    unsafe { start_timer_async_v1(request_ptr, request_len, task, host, true) }
  }))
  .unwrap_or(FFI_STATUS_INTERNAL_ERROR)
}

#[cfg(test)]
mod tests {
  use super::*;
  use crate::ffi::{AsyncTaskCancel, CalcitFfiAsyncHostV1, FFI_EVENT_COMPLETE, FFI_EVENT_EMIT, encode_callback_args};
  use std::ptr;
  use std::sync::OnceLock;
  use std::thread::sleep;
  use std::time::Instant;

  type Config = (u32, u32, u64, AsyncTaskCancel);
  static EVENTS: OnceLock<Mutex<Vec<u32>>> = OnceLock::new();
  static CONFIG: OnceLock<Mutex<Option<Config>>> = OnceLock::new();

  unsafe extern "C" fn enqueue(
    _context: u64,
    _task_handle: u64,
    kind: u32,
    _response_handle: u64,
    _payload_ptr: *const u8,
    _payload_len: usize,
  ) -> i32 {
    EVENTS.get_or_init(|| Mutex::new(vec![])).lock().expect("events").push(kind);
    FFI_STATUS_OK
  }

  unsafe extern "C" fn configure(
    _context: u64,
    _task_handle: u64,
    kind: u32,
    flags: u32,
    task_context: u64,
    cancel: Option<AsyncTaskCancel>,
  ) -> i32 {
    *CONFIG.get_or_init(|| Mutex::new(None)).lock().expect("config") = cancel.map(|cancel| (kind, flags, task_context, cancel));
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

  fn wait_for(kind: u32) {
    let deadline = Instant::now() + Duration::from_secs(1);
    while Instant::now() < deadline {
      if EVENTS.get_or_init(|| Mutex::new(vec![])).lock().expect("events").contains(&kind) {
        return;
      }
      sleep(Duration::from_millis(2));
    }
    panic!("timed out waiting for event {kind}");
  }

  #[test]
  fn interval_is_coalescible_and_acknowledges_cancellation() {
    EVENTS.get_or_init(|| Mutex::new(vec![])).lock().expect("events").clear();
    *CONFIG.get_or_init(|| Mutex::new(None)).lock().expect("config") = None;
    let request = encode_callback_args(vec![Edn::Number(5.0)]).expect("request");
    let (task, host) = descriptors(101);
    assert_eq!(
      unsafe { set_interval_calcit_ffi_async_v1(request.as_ptr(), request.len(), &task, &host) },
      FFI_STATUS_OK
    );
    wait_for(FFI_EVENT_EMIT);
    let (kind, flags, context, cancel) = CONFIG.get().expect("config").lock().expect("config lock").expect("configured");
    assert_eq!(kind, FFI_TASK_STREAM);
    assert_eq!(flags, FFI_TASK_SERIAL_EVENTS | FFI_TASK_COALESCE_ALLOWED);
    assert_eq!(unsafe { cancel(context, task.handle, ptr::null(), 0) }, FFI_STATUS_OK);
    wait_for(FFI_EVENT_COMPLETE);
  }

  #[test]
  fn timers_reject_invalid_durations() {
    let (task, host) = descriptors(102);
    for duration in [Edn::Number(-1.0), Edn::Number(f64::NAN), Edn::str("soon")] {
      let request = encode_callback_args(vec![duration]).expect("request");
      assert_eq!(
        unsafe { set_timeout_calcit_ffi_async_v1(request.as_ptr(), request.len(), &task, &host) },
        FFI_STATUS_INVALID_PAYLOAD
      );
    }
    let zero = encode_callback_args(vec![Edn::Number(0.0)]).expect("request");
    assert_eq!(
      unsafe { set_interval_calcit_ffi_async_v1(zero.as_ptr(), zero.len(), &task, &host) },
      FFI_STATUS_INVALID_PAYLOAD
    );
  }
}
