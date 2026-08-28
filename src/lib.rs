#[macro_use]
extern crate nanoid;

mod date;
mod ffi;

calcit_native_ffi::export_buffer_abi_v1!();
calcit_native_ffi::export_async_abi_v1!();
mod fs;
mod hash;
mod json;
mod path;
mod process;
mod random;
mod time;

pub use date::{add_duration, format_time, now_bang, parse_time};
pub use fs::{append_file, glob_call, path_exists, read_dir, read_file, walk_dir, write_file};
pub use json::{parse_json, stringify_json};
pub use path::join_path;
pub use process::execute_command;
pub use random::{call_nanoid, rand, rand_hex_color, rand_int};

use ffi::CalcitFfiBuffer;

macro_rules! export_buffer_method {
  ($export:ident, $method:path) => {
    /// Invoke this method through C-safe buffer protocol v1.
    ///
    /// # Safety
    ///
    /// Request bytes must remain readable and `output` writable for this call.
    #[unsafe(no_mangle)]
    pub unsafe extern "C" fn $export(request_ptr: *const u8, request_len: usize, output: *mut CalcitFfiBuffer) -> i32 {
      // SAFETY: the shared adapter validates, copies, and contains all inputs.
      unsafe { ffi::run_buffer_adapter(request_ptr, request_len, output, $method) }
    }
  };
}

export_buffer_method!(parse_time_calcit_ffi_v1, date::parse_time);
export_buffer_method!(now_bang_calcit_ffi_v1, date::now_bang);
export_buffer_method!(get_timestamp_calcit_ffi_v1, date::get_timestamp);
export_buffer_method!(format_time_calcit_ffi_v1, date::format_time);
export_buffer_method!(extract_time_calcit_ffi_v1, date::extract_time);
export_buffer_method!(from_ymd_calcit_ffi_v1, date::from_ymd);
export_buffer_method!(from_ywd_calcit_ffi_v1, date::from_ywd);
export_buffer_method!(add_duration_calcit_ffi_v1, date::add_duration);
export_buffer_method!(read_file_calcit_ffi_v1, fs::read_file);
export_buffer_method!(write_file_calcit_ffi_v1, fs::write_file);
export_buffer_method!(append_file_calcit_ffi_v1, fs::append_file);
export_buffer_method!(path_exists_calcit_ffi_v1, fs::path_exists);
export_buffer_method!(read_dir_calcit_ffi_v1, fs::read_dir);
export_buffer_method!(create_dir_calcit_ffi_v1, fs::create_dir);
export_buffer_method!(create_dir_all_calcit_ffi_v1, fs::create_dir_all);
export_buffer_method!(rename_path_calcit_ffi_v1, fs::rename_path);
export_buffer_method!(check_write_file_calcit_ffi_v1, fs::check_write_file);
export_buffer_method!(walk_dir_calcit_ffi_v1, fs::walk_dir);
export_buffer_method!(glob_call_calcit_ffi_v1, fs::glob_call);
export_buffer_method!(md5_calcit_ffi_v1, hash::md5);
export_buffer_method!(parse_json_calcit_ffi_v1, json::parse_json);
export_buffer_method!(stringify_json_calcit_ffi_v1, json::stringify_json);
export_buffer_method!(join_path_calcit_ffi_v1, path::join_path);
export_buffer_method!(path_dirname_calcit_ffi_v1, path::path_dirname);
export_buffer_method!(path_basename_calcit_ffi_v1, path::path_basename);
export_buffer_method!(execute_command_calcit_ffi_v1, process::execute_command);
export_buffer_method!(rand_calcit_ffi_v1, random::rand);
export_buffer_method!(rand_int_calcit_ffi_v1, random::rand_int);
export_buffer_method!(call_nanoid_calcit_ffi_v1, random::call_nanoid);
export_buffer_method!(rand_hex_color_calcit_ffi_v1, random::rand_hex_color);
