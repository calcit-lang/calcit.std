#[macro_use]
extern crate nanoid;

mod date;
mod fs;
mod hash;
mod json;
mod process;
mod random;
mod regexp;
mod time;

pub use date::{format_time, now_bang, parse_time};
pub use fs::{path_exists, read_dir, read_file, write_file};
pub use json::{parse_json, stringify_json};
pub use process::execute_command;
pub use regexp::{re_find, re_find_all, re_find_index, re_matches};
pub use time::{set_interval, set_timeout};
