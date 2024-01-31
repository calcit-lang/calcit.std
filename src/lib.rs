#[macro_use]
extern crate nanoid;

mod date;
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
pub use time::{set_interval, set_timeout};

#[no_mangle]
pub fn abi_version() -> String {
  String::from("0.0.7")
}
