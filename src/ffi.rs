use cirru_edn::{Edn, EdnListView};
use std::mem::size_of;
use std::panic::{AssertUnwindSafe, catch_unwind};
use std::{ptr, slice};

pub const FFI_PROTOCOL_VERSION: u32 = 1;
pub const FFI_STATUS_OK: i32 = 0;
pub const FFI_STATUS_INVALID_PAYLOAD: i32 = 8;
pub const FFI_STATUS_INTERNAL_ERROR: i32 = 9;
pub const FFI_STATUS_CALLBACK_ERROR: i32 = 10;
const MAX_BUFFER_BYTES: usize = 256 * 1024 * 1024;

#[repr(C)]
#[derive(Clone, Copy)]
pub struct CalcitFfiBuffer {
  pub ptr: *mut u8,
  pub len: usize,
  pub cap: usize,
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct CalcitFfiAsyncTaskV1 {
  pub protocol_version: u32,
  pub struct_size: u32,
  pub handle: u64,
  pub kind: u32,
  pub flags: u32,
}

pub type BlockingHostInvoke = unsafe extern "C" fn(u64, u64, *const u8, usize, *mut CalcitFfiBuffer) -> i32;
pub type BlockingHostFinish = unsafe extern "C" fn(u64, u64) -> i32;
pub type BlockingHostFreeBuffer = unsafe extern "C" fn(u64, u64, CalcitFfiBuffer) -> i32;

#[repr(C)]
#[derive(Clone, Copy)]
pub struct CalcitFfiBlockingHostV1 {
  pub protocol_version: u32,
  pub struct_size: u32,
  pub context: u64,
  pub invoke: Option<BlockingHostInvoke>,
  pub finish: Option<BlockingHostFinish>,
  pub free_buffer: Option<BlockingHostFreeBuffer>,
}

unsafe fn read_abi_header<T>(value: *const T) -> Result<(u32, u32), i32> {
  if value.is_null() {
    return Err(FFI_STATUS_INVALID_PAYLOAD);
  }
  let bytes = value.cast::<u8>();
  // SAFETY: every versioned descriptor begins with two readable u32 fields.
  let protocol_version = unsafe { ptr::read_unaligned(bytes.cast::<u32>()) };
  // SAFETY: the second header field begins four bytes after the first.
  let struct_size = unsafe { ptr::read_unaligned(bytes.add(size_of::<u32>()).cast::<u32>()) };
  Ok((protocol_version, struct_size))
}

unsafe fn copy_task_descriptor(value: *const CalcitFfiAsyncTaskV1) -> Result<CalcitFfiAsyncTaskV1, i32> {
  // SAFETY: forwarded from the versioned blocking ABI contract.
  let (version, size) = unsafe { read_abi_header(value) }?;
  if version != FFI_PROTOCOL_VERSION || size < size_of::<CalcitFfiAsyncTaskV1>() as u32 {
    return Err(FFI_STATUS_INVALID_PAYLOAD);
  }
  // SAFETY: the validated size covers every v1 field.
  Ok(unsafe { ptr::read_unaligned(value) })
}

unsafe fn copy_blocking_host(value: *const CalcitFfiBlockingHostV1) -> Result<CalcitFfiBlockingHostV1, i32> {
  // SAFETY: forwarded from the versioned blocking ABI contract.
  let (version, size) = unsafe { read_abi_header(value) }?;
  if version != FFI_PROTOCOL_VERSION || size < size_of::<CalcitFfiBlockingHostV1>() as u32 {
    return Err(FFI_STATUS_INVALID_PAYLOAD);
  }
  // SAFETY: the validated size covers every v1 field.
  Ok(unsafe { ptr::read_unaligned(value) })
}

#[unsafe(no_mangle)]
pub extern "C" fn calcit_ffi_buffer_version() -> u32 {
  FFI_PROTOCOL_VERSION
}

#[unsafe(no_mangle)]
pub extern "C" fn calcit_ffi_async_version() -> u32 {
  FFI_PROTOCOL_VERSION
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn calcit_ffi_buffer_free(buffer: CalcitFfiBuffer) {
  if buffer.ptr.is_null() {
    return;
  }
  // SAFETY: Calcit returns exactly the metadata produced by `write_output`.
  drop(unsafe { Vec::from_raw_parts(buffer.ptr, buffer.len, buffer.cap) });
}

pub unsafe fn decode_request(request_ptr: *const u8, request_len: usize) -> Result<Vec<Edn>, String> {
  if request_ptr.is_null() && request_len != 0 {
    return Err("FFI request pointer is null".to_owned());
  }
  if request_len > MAX_BUFFER_BYTES {
    return Err(format!("FFI request exceeds {MAX_BUFFER_BYTES} bytes"));
  }
  let bytes = if request_len == 0 {
    &[]
  } else {
    // SAFETY: the host keeps request bytes readable for this call.
    unsafe { slice::from_raw_parts(request_ptr, request_len) }
  };
  let source = std::str::from_utf8(bytes).map_err(|error| format!("FFI request is not UTF-8: {error}"))?;
  let data = cirru_edn::parse(source).map_err(|error| format!("FFI request is not valid Cirru EDN: {error}"))?;
  let Edn::List(EdnListView(args)) = data else {
    return Err("FFI request must be a Cirru EDN list".to_owned());
  };
  Ok(args)
}

pub fn encode_edn(value: &Edn) -> Result<Vec<u8>, String> {
  cirru_edn::format(value, true)
    .map(String::into_bytes)
    .map_err(|error| format!("failed to encode Cirru EDN: {error}"))
}

unsafe fn write_output(output: *mut CalcitFfiBuffer, bytes: Vec<u8>) -> i32 {
  if output.is_null() {
    return FFI_STATUS_INVALID_PAYLOAD;
  }
  let mut bytes = std::mem::ManuallyDrop::new(bytes);
  let buffer = CalcitFfiBuffer {
    ptr: bytes.as_mut_ptr(),
    len: bytes.len(),
    cap: bytes.capacity(),
  };
  // SAFETY: the caller supplied a writable output slot for this call.
  unsafe { output.write(buffer) };
  FFI_STATUS_OK
}

pub unsafe fn run_buffer_adapter(
  request_ptr: *const u8,
  request_len: usize,
  output: *mut CalcitFfiBuffer,
  method: fn(Vec<Edn>) -> Result<Edn, String>,
) -> i32 {
  match catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: forwarded from the exported buffer ABI contract.
    let args = unsafe { decode_request(request_ptr, request_len) }?;
    method(args).and_then(|value| encode_edn(&value))
  })) {
    Ok(Ok(bytes)) => unsafe { write_output(output, bytes) },
    Ok(Err(error)) => {
      let _ = unsafe { write_output(output, error.into_bytes()) };
      1
    }
    Err(_) => {
      let _ = unsafe { write_output(output, b"calcit.std buffer adapter panicked".to_vec()) };
      FFI_STATUS_INTERNAL_ERROR
    }
  }
}

fn copy_host_buffer(buffer: CalcitFfiBuffer) -> Result<Vec<u8>, String> {
  if buffer.len > buffer.cap || buffer.len > MAX_BUFFER_BYTES || (buffer.ptr.is_null() && buffer.len != 0) {
    return Err("Calcit callback returned invalid buffer metadata".to_owned());
  }
  if buffer.len == 0 {
    Ok(vec![])
  } else {
    // SAFETY: metadata has been validated and the blocking host keeps the allocation alive until `free_buffer`.
    Ok(unsafe { slice::from_raw_parts(buffer.ptr, buffer.len) }.to_vec())
  }
}

pub fn invoke_blocking_callback(host: CalcitFfiBlockingHostV1, task: CalcitFfiAsyncTaskV1, args: Vec<Edn>) -> Result<Edn, String> {
  let invoke = host.invoke.ok_or_else(|| "blocking host is missing invoke".to_owned())?;
  let free_buffer = host.free_buffer.ok_or_else(|| "blocking host is missing free_buffer".to_owned())?;
  let payload = encode_edn(&Edn::List(EdnListView(args)))?;
  let mut output = CalcitFfiBuffer {
    ptr: ptr::null_mut(),
    len: 0,
    cap: 0,
  };
  let status = unsafe { invoke(host.context, task.handle, payload.as_ptr(), payload.len(), &mut output) };
  let has_output = !output.ptr.is_null() || output.len != 0 || output.cap != 0;
  if !has_output {
    return if matches!(status, FFI_STATUS_OK | FFI_STATUS_CALLBACK_ERROR) {
      Err("Calcit callback returned no output buffer".to_owned())
    } else {
      Err(format!("Calcit host rejected blocking callback with status {status}"))
    };
  }
  let copied = copy_host_buffer(output);
  let free_status = unsafe { free_buffer(host.context, task.handle, output) };
  if free_status != FFI_STATUS_OK {
    return Err(format!("Calcit host rejected callback buffer release with status {free_status}"));
  }
  let bytes = copied?;
  if status == FFI_STATUS_OK {
    let source = std::str::from_utf8(&bytes).map_err(|error| format!("Calcit callback result is not UTF-8: {error}"))?;
    cirru_edn::parse(source).map_err(|error| format!("Calcit callback result is not valid Cirru EDN: {error}"))
  } else if status == FFI_STATUS_CALLBACK_ERROR {
    Err(String::from_utf8_lossy(&bytes).into_owned())
  } else {
    Err(format!("Calcit host rejected blocking callback with status {status}"))
  }
}

pub unsafe fn run_blocking_adapter(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiBlockingHostV1,
  output: *mut CalcitFfiBuffer,
  method: impl FnOnce(Vec<Edn>, CalcitFfiAsyncTaskV1, CalcitFfiBlockingHostV1) -> Result<Edn, String>,
) -> i32 {
  match catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: descriptors and request bytes follow the exported blocking ABI contract.
    let task = unsafe { copy_task_descriptor(task) }.map_err(|status| format!("invalid blocking task descriptor: {status}"))?;
    // SAFETY: descriptor validation copies only after checking the versioned header.
    let host = unsafe { copy_blocking_host(host) }.map_err(|status| format!("invalid blocking host descriptor: {status}"))?;
    if host.invoke.is_none() || host.free_buffer.is_none() {
      return Err("blocking host is missing required operations".to_owned());
    }
    // SAFETY: request memory is call-scoped and copied before the method runs.
    let args = unsafe { decode_request(request_ptr, request_len) }?;
    method(args, task, host).and_then(|value| encode_edn(&value))
  })) {
    Ok(Ok(bytes)) => unsafe { write_output(output, bytes) },
    Ok(Err(error)) => {
      let _ = unsafe { write_output(output, error.into_bytes()) };
      1
    }
    Err(_) => {
      let _ = unsafe { write_output(output, b"calcit.std blocking adapter panicked".to_vec()) };
      FFI_STATUS_INTERNAL_ERROR
    }
  }
}

#[cfg(test)]
mod tests {
  use super::*;

  fn first_arg(args: Vec<Edn>) -> Result<Edn, String> {
    args.into_iter().next().ok_or_else(|| "missing argument".to_owned())
  }

  unsafe extern "C" fn echo_invoke(
    _context: u64,
    _task_handle: u64,
    payload_ptr: *const u8,
    payload_len: usize,
    output: *mut CalcitFfiBuffer,
  ) -> i32 {
    // SAFETY: the test calls with a readable encoded payload.
    let args = match unsafe { decode_request(payload_ptr, payload_len) } {
      Ok(args) => args,
      Err(_) => return FFI_STATUS_INVALID_PAYLOAD,
    };
    let bytes = match encode_edn(&Edn::List(EdnListView(args))) {
      Ok(bytes) => bytes,
      Err(_) => return FFI_STATUS_INTERNAL_ERROR,
    };
    // SAFETY: the test supplies a writable output descriptor.
    unsafe { write_output(output, bytes) }
  }

  unsafe extern "C" fn echo_free(_context: u64, _task_handle: u64, buffer: CalcitFfiBuffer) -> i32 {
    // SAFETY: the echo host returns exactly the allocation produced above.
    unsafe { calcit_ffi_buffer_free(buffer) };
    FFI_STATUS_OK
  }

  #[test]
  fn ffi_layouts_and_versions_are_stable() {
    assert_eq!(calcit_ffi_buffer_version(), 1);
    assert_eq!(calcit_ffi_async_version(), 1);
    assert_eq!(size_of::<CalcitFfiBuffer>(), size_of::<usize>() * 3);
    assert_eq!(size_of::<CalcitFfiAsyncTaskV1>(), 24);
    assert_eq!(size_of::<CalcitFfiBlockingHostV1>(), 40);
  }

  #[test]
  fn buffer_adapter_round_trips_edn_and_contains_input_errors() {
    let request = encode_edn(&Edn::List(EdnListView(vec![Edn::str("ok")]))).expect("encode request");
    let mut output = CalcitFfiBuffer {
      ptr: ptr::null_mut(),
      len: 0,
      cap: 0,
    };
    assert_eq!(
      unsafe { run_buffer_adapter(request.as_ptr(), request.len(), &mut output, first_arg) },
      0
    );
    let output_bytes = copy_host_buffer(output).expect("copy output");
    assert_eq!(
      cirru_edn::parse(std::str::from_utf8(&output_bytes).expect("UTF-8 output")).expect("EDN output"),
      Edn::str("ok")
    );
    unsafe { calcit_ffi_buffer_free(output) };

    let malformed = b"not-edn (";
    let mut error_output = CalcitFfiBuffer {
      ptr: ptr::null_mut(),
      len: 0,
      cap: 0,
    };
    assert_ne!(
      unsafe { run_buffer_adapter(malformed.as_ptr(), malformed.len(), &mut error_output, first_arg) },
      0
    );
    assert!(!copy_host_buffer(error_output).expect("copy error").is_empty());
    unsafe { calcit_ffi_buffer_free(error_output) };
  }

  #[test]
  fn blocking_callback_round_trips_through_host_owned_buffer() {
    let task = CalcitFfiAsyncTaskV1 {
      protocol_version: FFI_PROTOCOL_VERSION,
      struct_size: size_of::<CalcitFfiAsyncTaskV1>() as u32,
      handle: 7,
      kind: 1,
      flags: 1,
    };
    let host = CalcitFfiBlockingHostV1 {
      protocol_version: FFI_PROTOCOL_VERSION,
      struct_size: size_of::<CalcitFfiBlockingHostV1>() as u32,
      context: 9,
      invoke: Some(echo_invoke),
      finish: None,
      free_buffer: Some(echo_free),
    };
    let result = invoke_blocking_callback(host, task, vec![Edn::Number(3.0)]).expect("invoke callback");
    assert_eq!(result, Edn::List(EdnListView(vec![Edn::Number(3.0)])));
  }
}
