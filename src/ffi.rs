use cirru_edn::Edn;
use std::time::Duration;

pub use calcit_native_ffi::{
  CalcitFfiAsyncHostV1, CalcitFfiAsyncTaskV1, CalcitFfiBlockingHostV1, CalcitFfiBuffer, configure_task, invoke_blocking_callback,
  run_blocking_adapter, run_buffer_adapter,
};

#[cfg(test)]
pub use calcit_native_ffi::{AsyncTaskCancel, encode_callback_args};

pub const FFI_STATUS_OK: i32 = calcit_native_ffi::status::OK;
pub const FFI_STATUS_INVALID_PAYLOAD: i32 = calcit_native_ffi::status::INVALID_PAYLOAD;
pub const FFI_STATUS_INTERNAL_ERROR: i32 = calcit_native_ffi::status::INTERNAL_ERROR;
pub const FFI_STATUS_HANDLE_CLOSING: i32 = calcit_native_ffi::status::HANDLE_CLOSING;
pub const FFI_STATUS_HANDLE_FINISHED: i32 = calcit_native_ffi::status::HANDLE_FINISHED;
pub const FFI_TASK_ONE_SHOT: u32 = calcit_native_ffi::task_kind::ONE_SHOT;
pub const FFI_TASK_STREAM: u32 = calcit_native_ffi::task_kind::STREAM;
pub const FFI_TASK_SERIAL_EVENTS: u32 = calcit_native_ffi::task_flags::SERIAL_EVENTS;
pub const FFI_TASK_COALESCE_ALLOWED: u32 = calcit_native_ffi::task_flags::COALESCE_ALLOWED;
#[cfg(test)]
pub const FFI_EVENT_EMIT: u32 = calcit_native_ffi::event_kind::EMIT;
#[cfg(test)]
pub const FFI_EVENT_COMPLETE: u32 = calcit_native_ffi::event_kind::COMPLETE;

fn default_backpressure() -> calcit_native_ffi::BackpressurePolicy {
  calcit_native_ffi::BackpressurePolicy::unbounded(Duration::from_millis(1))
}

pub unsafe fn prepare_async_call(
  request_ptr: *const u8,
  request_len: usize,
  task: *const CalcitFfiAsyncTaskV1,
  host: *const CalcitFfiAsyncHostV1,
) -> Result<(Vec<Edn>, CalcitFfiAsyncTaskV1, CalcitFfiAsyncHostV1), i32> {
  // SAFETY: forwarded from the exported versioned task descriptor contract.
  let task = unsafe { calcit_native_ffi::copy_task_descriptor(task) }.map_err(|_| FFI_STATUS_INVALID_PAYLOAD)?;
  // SAFETY: forwarded from the exported versioned host descriptor contract.
  let host = unsafe { calcit_native_ffi::copy_async_host(host) }.map_err(|_| FFI_STATUS_INVALID_PAYLOAD)?;
  if host.enqueue.is_none() || host.configure_task.is_none() {
    return Err(FFI_STATUS_INVALID_PAYLOAD);
  }
  // SAFETY: request bytes are call-scoped and copied by the shared decoder.
  let args = unsafe { calcit_native_ffi::decode_request(request_ptr, request_len) }.map_err(|_| FFI_STATUS_INVALID_PAYLOAD)?;
  Ok((args, task, host))
}

pub fn publish_emit(host: CalcitFfiAsyncHostV1, task: CalcitFfiAsyncTaskV1, args: Vec<Edn>) -> i32 {
  calcit_native_ffi::publish_emit(host, task, args, default_backpressure())
}

pub fn publish_complete(host: CalcitFfiAsyncHostV1, task: CalcitFfiAsyncTaskV1) -> i32 {
  calcit_native_ffi::publish_complete(host, task, default_backpressure())
}

pub fn publish_failure(host: CalcitFfiAsyncHostV1, task: CalcitFfiAsyncTaskV1, message: impl Into<String>) -> i32 {
  calcit_native_ffi::publish_failure(host, task, message, default_backpressure())
}
