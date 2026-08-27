//! wraped some functions from std::fs https://doc.rust-lang.org/std/fs/index.html

use cirru_edn::{Edn, EdnListView};
use glob::glob;
use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;
use std::sync::Arc;
use std::{fs, vec};
use walkdir::WalkDir;

#[unsafe(no_mangle)]
pub fn read_file(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      let task = fs::read_to_string(&**name);
      match task {
        Ok(s) => Ok(Edn::Str(s.into())),
        Err(e) => Err(format!("Failed to read file {name:?}: {e}")),
      }
    } else {
      Err(format!("read-file expected 1 filename, got {:?}", args[0]))
    }
  } else {
    Err(format!("read-file expected 1 argument, got {args:?}"))
  }
}

// The output is wrapped in a Result to allow matching on errors
// Returns an Iterator to the Reader of the lines of the file.
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where
  P: AsRef<Path>,
{
  let file = File::open(filename)?;
  Ok(io::BufReader::new(file).lines())
}

fn collect_file_lines(args: &[Edn]) -> Result<Vec<String>, String> {
  let [Edn::Str(name)] = args else {
    return Err(format!("read-file-by-line expected 1 filename, got {args:?}"));
  };
  let lines = read_lines(&**name).map_err(|error| format!("Failed to read file {name:?}: {error}"))?;
  lines
    .collect::<Result<Vec<_>, _>>()
    .map_err(|error| format!("failed reading line from {name:?}: {error}"))
}

#[unsafe(no_mangle)]
pub fn read_file_by_line(
  args: Vec<Edn>,
  handler: Arc<dyn Fn(Vec<Edn>) -> Result<Edn, String> + Send + Sync + 'static>,
  finish: Box<dyn FnOnce() + Send + Sync + 'static>,
) -> Result<Edn, String> {
  for line in collect_file_lines(&args)? {
    handler(vec![Edn::str(line)]).map_err(|error| format!("failed reading line: {error}"))?;
  }
  finish();
  Ok(Edn::Nil)
}

/// Read a file line-by-line through blocking protocol v1.
///
/// # Safety
///
/// Request bytes and descriptors must remain readable, and `output` writable,
/// for this call.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn read_file_by_line_calcit_ffi_blocking_v1(
  request_ptr: *const u8,
  request_len: usize,
  task: *const crate::ffi::CalcitFfiAsyncTaskV1,
  host: *const crate::ffi::CalcitFfiBlockingHostV1,
  output: *mut crate::ffi::CalcitFfiBuffer,
) -> i32 {
  // SAFETY: the shared adapter validates and copies all call-scoped inputs.
  unsafe {
    crate::ffi::run_blocking_adapter(request_ptr, request_len, task, host, output, |args, task, host| {
      for line in collect_file_lines(&args)? {
        crate::ffi::invoke_blocking_callback(host, task, vec![Edn::str(line)])?;
      }
      Ok(Edn::Nil)
    })
  }
}

#[unsafe(no_mangle)]
pub fn write_file(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(name), Edn::Str(content)) => {
        let task = fs::write(&**name, &**content);
        match task {
          Ok(()) => Ok(Edn::Nil),
          Err(e) => Err(format!("Failed to write to file {name:?}: {e}")),
        }
      }
      (_, _) => Err(format!("write-file expected 2 strings, got {args:?}")),
    }
  } else {
    Err(format!("write-file expected 2 args, got {args:?}"))
  }
}

#[unsafe(no_mangle)]
pub fn append_file(args: Vec<Edn>) -> Result<Edn, String> {
  use std::fs::OpenOptions;
  use std::io::prelude::*;

  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(name), Edn::Str(content)) => {
        let mut file = OpenOptions::new()
          .create(true)
          .append(true)
          .open(&**name)
          .map_err(|error| format!("Failed to open file {name:?} for append: {error}"))?;

        if let Err(e) = writeln!(file, "{content}") {
          Err(format!("Failed to append to file {name:?}: {e}"))
        } else {
          Ok(Edn::Nil)
        }
      }
      (_, _) => Err(format!("append-file expected 2 strings, got {args:?}")),
    }
  } else {
    Err(format!("append-file expected 2 args, got {args:?}"))
  }
}

#[unsafe(no_mangle)]
pub fn path_exists(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      Ok(Edn::Bool(Path::new(&**name).exists()))
    } else {
      Err(format!("path-exists? expected 1 filename, got {args:?}"))
    }
  } else {
    Err(format!("path-exists? expected 1 arg, got {args:?}"))
  }
}

#[unsafe(no_mangle)]
pub fn read_dir(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      let task = fs::read_dir(&**name);
      match task {
        Ok(children) => {
          let mut content: Vec<Edn> = vec![];
          for child in children {
            let child = child.map_err(|error| format!("Failed to read child of {name:?}: {error}"))?;
            content.push(Edn::Str(format!("{}", child.path().display()).into()));
          }
          // println!("child dir: {:?}", content);

          Ok(Edn::List(EdnListView(content)))
        }
        Err(e) => Err(format!("Failed to read dir {name:?}: {e}")),
      }
    } else {
      Err(format!("read-dir expected a string, {}", args[0]))
    }
  } else {
    Err(format!("read-dir expected 1 argument, got: {args:?}"))
  }
}

/// wraps https://doc.rust-lang.org/std/fs/fn.create_dir.html
/// throws error in many cases, path existed, missing parents
#[unsafe(no_mangle)]
pub fn create_dir(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      fs::create_dir(&**name).map_err(|e| e.to_string())?;
      Ok(Edn::Nil)
    } else {
      Err(format!("create-dir! expected 1 filename, got {:?}", args[0]))
    }
  } else {
    Err(format!("create-dir! expected 1 argument, got {args:?}"))
  }
}

/// wraps https://doc.rust-lang.org/std/fs/fn.create_dir_all.html
#[unsafe(no_mangle)]
pub fn create_dir_all(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      fs::create_dir_all(&**name).map_err(|e| e.to_string())?;
      Ok(Edn::Nil)
    } else {
      Err(format!("create-dir-all! expected 1 filename, got {:?}", args[0]))
    }
  } else {
    Err(format!("create-dir-all! expected 1 argument, got {args:?}"))
  }
}

/// wraps https://doc.rust-lang.org/std/fs/fn.rename.html
#[unsafe(no_mangle)]
pub fn rename_path(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(name), Edn::Str(next)) => {
        let task = fs::rename(&**name, &**next);
        match task {
          Ok(()) => Ok(Edn::Nil),
          Err(e) => Err(format!("Failed to rename file {name:?} -> {next:?} {e}")),
        }
      }
      (_, _) => Err(format!("rename! expected 2 strings, got {args:?}")),
    }
  } else {
    Err(format!("rename! expected 2 args, got {args:?}"))
  }
}

/// make sure path existed. skip if file content identical
#[unsafe(no_mangle)]
pub fn check_write_file(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(name), Edn::Str(content)) => {
        if Path::new(&**name).exists() {
          match fs::read_to_string(&**name) {
            Ok(old) => {
              if old == **content {
                Ok(Edn::Bool(false))
              } else {
                let task = fs::write(&**name, &**content);
                match task {
                  Ok(()) => Ok(Edn::Bool(true)),
                  Err(e) => Err(format!("Failed to write to file {name:?}: {e}")),
                }
              }
            }
            Err(e) => Err(e.to_string()),
          }
        } else {
          if let Some(parent) = Path::new(&**name).parent().filter(|parent| !parent.as_os_str().is_empty())
            && !parent.exists()
          {
            fs::create_dir_all(parent).map_err(|error| format!("Failed to create parent directory {parent:?}: {error}"))?;
          }
          let task = fs::write(&**name, &**content);
          match task {
            Ok(()) => Ok(Edn::Bool(true)),
            Err(e) => Err(format!("Failed to write to file {name:?}: {e}")),
          }
        }
      }
      (_, _) => Err(format!("check-write-file! expected 2 strings, got {args:?}")),
    }
  } else {
    Err(format!("check-write-file! expected 2 args, got {args:?}"))
  }
}

/// walk a directory, return a list of files
#[unsafe(no_mangle)]
pub fn walk_dir(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      let mut content: Vec<Edn> = vec![];
      for entry in WalkDir::new(&**name) {
        let entry = entry.map_err(|error| format!("Failed to walk {name:?}: {error}"))?;
        let path = entry.path();
        if path.is_file() {
          content.push(Edn::Str(format!("{}", path.display()).into()));
        }
      }
      Ok(Edn::List(EdnListView(content)))
    } else {
      Err(format!("walk-dir expected a string, got: {}", args[0]))
    }
  } else {
    Err(format!("walk-dir expected 1 argument, got: {args:?}"))
  }
}

/// use glob to match paths recursively
#[unsafe(no_mangle)]
pub fn glob_call(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      let mut content: Vec<Edn> = vec![];
      for entry in glob(name).map_err(|error| format!("Invalid glob pattern {name:?}: {error}"))? {
        match entry {
          Ok(entry) => {
            if entry.is_file() {
              content.push(Edn::Str(format!("{}", entry.display()).into()));
            }
          }
          Err(e) => return Err(format!("Failed to read: {e}")),
        }
      }
      Ok(Edn::List(EdnListView(content)))
    } else {
      Err(format!("glob expected a string, got: {}", args[0]))
    }
  } else {
    Err(format!("glob expected 1 argument, got: {args:?}"))
  }
}
