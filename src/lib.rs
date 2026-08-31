#[macro_use]
extern crate nanoid;

mod date;
mod ffi;

calcit_native_ffi::export_async_abi_v1!();
mod fs;
mod hash;
mod json;
mod path;
mod process;
mod random;
mod time;

include!("../generated/ffi/rust/bindings.rs");

struct CalcitStdGeneratedFfi;

impl CalcitStdFfi for CalcitStdGeneratedFfi {
  fn calcit_std_hash_md5(&self, arg0: String) -> Result<String, String> {
    Ok(hash::md5(&arg0))
  }
}

static CALCIT_STD_GENERATED_FFI: CalcitStdGeneratedFfi = CalcitStdGeneratedFfi;
export_calcit_std_ffi!(CALCIT_STD_GENERATED_FFI);

pub use date::{add_duration, format_time, now_bang, parse_time};
pub use fs::{append_file, glob_call, path_exists, read_dir, read_file, walk_dir, write_file};
pub use json::{parse_json, stringify_json};
pub use path::join_path;
pub use process::execute_command;
pub use random::{call_nanoid, rand, rand_hex_color, rand_int};

calcit_native_ffi::export_edn_buffer_method_v1!(parse_time_calcit_ffi_v1, date::parse_time);
calcit_native_ffi::export_edn_buffer_method_v1!(now_bang_calcit_ffi_v1, date::now_bang);
calcit_native_ffi::export_edn_buffer_method_v1!(get_timestamp_calcit_ffi_v1, date::get_timestamp);
calcit_native_ffi::export_edn_buffer_method_v1!(format_time_calcit_ffi_v1, date::format_time);
calcit_native_ffi::export_edn_buffer_method_v1!(extract_time_calcit_ffi_v1, date::extract_time);
calcit_native_ffi::export_edn_buffer_method_v1!(from_ymd_calcit_ffi_v1, date::from_ymd);
calcit_native_ffi::export_edn_buffer_method_v1!(from_ywd_calcit_ffi_v1, date::from_ywd);
calcit_native_ffi::export_edn_buffer_method_v1!(add_duration_calcit_ffi_v1, date::add_duration);
calcit_native_ffi::export_edn_buffer_method_v1!(read_file_calcit_ffi_v1, fs::read_file);
calcit_native_ffi::export_edn_buffer_method_v1!(write_file_calcit_ffi_v1, fs::write_file);
calcit_native_ffi::export_edn_buffer_method_v1!(append_file_calcit_ffi_v1, fs::append_file);
calcit_native_ffi::export_edn_buffer_method_v1!(path_exists_calcit_ffi_v1, fs::path_exists);
calcit_native_ffi::export_edn_buffer_method_v1!(read_dir_calcit_ffi_v1, fs::read_dir);
calcit_native_ffi::export_edn_buffer_method_v1!(create_dir_calcit_ffi_v1, fs::create_dir);
calcit_native_ffi::export_edn_buffer_method_v1!(create_dir_all_calcit_ffi_v1, fs::create_dir_all);
calcit_native_ffi::export_edn_buffer_method_v1!(rename_path_calcit_ffi_v1, fs::rename_path);
calcit_native_ffi::export_edn_buffer_method_v1!(check_write_file_calcit_ffi_v1, fs::check_write_file);
calcit_native_ffi::export_edn_buffer_method_v1!(walk_dir_calcit_ffi_v1, fs::walk_dir);
calcit_native_ffi::export_edn_buffer_method_v1!(glob_call_calcit_ffi_v1, fs::glob_call);
calcit_native_ffi::export_edn_buffer_method_v1!(parse_json_calcit_ffi_v1, json::parse_json);
calcit_native_ffi::export_edn_buffer_method_v1!(stringify_json_calcit_ffi_v1, json::stringify_json);
calcit_native_ffi::export_edn_buffer_method_v1!(join_path_calcit_ffi_v1, path::join_path);
calcit_native_ffi::export_edn_buffer_method_v1!(path_dirname_calcit_ffi_v1, path::path_dirname);
calcit_native_ffi::export_edn_buffer_method_v1!(path_basename_calcit_ffi_v1, path::path_basename);
calcit_native_ffi::export_edn_buffer_method_v1!(execute_command_calcit_ffi_v1, process::execute_command);
calcit_native_ffi::export_edn_buffer_method_v1!(rand_calcit_ffi_v1, random::rand);
calcit_native_ffi::export_edn_buffer_method_v1!(rand_int_calcit_ffi_v1, random::rand_int);
calcit_native_ffi::export_edn_buffer_method_v1!(call_nanoid_calcit_ffi_v1, random::call_nanoid);
calcit_native_ffi::export_edn_buffer_method_v1!(rand_hex_color_calcit_ffi_v1, random::rand_hex_color);
