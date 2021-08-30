use std::ffi::{CStr, CString};
use std::fs;
use std::os::raw::c_char;
use std::path::Path;
use std::process::Command;

#[no_mangle]
pub extern "C" fn add(x: usize, y: usize) -> usize {
  return x + y;
}

#[no_mangle]
pub unsafe extern "C" fn read_file(name_a: *const c_char) -> *mut c_char {
  let name = CStr::from_ptr(name_a).to_str().unwrap();
  let task = fs::read_to_string(&name);
  match task {
    Ok(s) => {
      let a = CString::new(s).unwrap();
      CString::into_raw(a)
    }
    Err(e) => {
      panic!("Failed to read file {:?}: {}", name, e)
    }
  }
}

#[no_mangle]
pub unsafe extern "C" fn write_file(raw_name: *const c_char, raw_content: *const c_char) {
  let name = CStr::from_ptr(raw_name).to_str().unwrap();
  let content = CStr::from_ptr(raw_content).to_str().unwrap();
  let task = fs::write(&name, content);
  match task {
    Ok(()) => {}
    Err(e) => {
      panic!("Failed to write to file {:?}: {}", name, e)
    }
  }
}

#[no_mangle]
pub unsafe extern "C" fn path_exists(name_a: *const c_char) -> bool {
  let name = CStr::from_ptr(name_a).to_str().unwrap();
  return Path::new(name).exists();
}

#[no_mangle]
pub unsafe extern "C" fn read_dir(name_a: *const c_char) -> *mut c_char {
  let name = CStr::from_ptr(name_a).to_str().unwrap();
  let task = fs::read_dir(&name);
  match task {
    Ok(children) => {
      let mut content = String::from("");
      for c in children {
        content = format!("{}\n{}", content, c.unwrap().path().display());
      }
      // println!("child dir: {:?}", content);
      let c_content = CString::new(content.trim()).unwrap();
      CString::into_raw(c_content)
    }
    Err(e) => {
      panic!("Failed to read dir {:?}: {}", name, e)
    }
  }
}

// not sure, but use this for now, thich is `(char-from-code 12)`
const ARGS_SEP: char = '\u{000C}';

#[no_mangle]
pub unsafe extern "C" fn execute_command(
  command_bytes: *const c_char,
  dir_bytes: *const c_char,
) -> *mut c_char {
  let command_chunk = CStr::from_ptr(command_bytes).to_str().unwrap();

  let dir = CStr::from_ptr(dir_bytes).to_str().unwrap();

  let pieces = command_chunk.split(ARGS_SEP).collect::<Vec<&str>>();

  let mut cmd = String::from("");
  let mut args: Vec<String> = vec![];

  for (idx, piece) in pieces.iter().enumerate() {
    if idx == 0 {
      cmd = piece.to_string();
    } else {
      args.push(piece.to_string());
    }
  }

  let task = Command::new(cmd)
    .current_dir(dir)
    .args(&args)
    .output()
    .expect("failed to execute process");

  let content = String::from_utf8(task.stdout).unwrap();

  let c_content = CString::new(content.trim()).unwrap();
  CString::into_raw(c_content)
}
