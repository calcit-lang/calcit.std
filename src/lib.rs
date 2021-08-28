use std::ffi::{CStr, CString};
use std::fs;
use std::os::raw::c_char;

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
