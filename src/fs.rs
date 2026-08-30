//! wraped some functions from std::fs https://doc.rust-lang.org/std/fs/index.html

use cirru_edn::{Edn, EdnListView};
use glob::glob;
use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;
use std::{fs, vec};
use walkdir::WalkDir;

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

fn stream_reader_lines<R, F>(reader: R, source: &str, mut on_line: F) -> Result<(), String>
where
  R: BufRead,
  F: FnMut(String) -> Result<(), String>,
{
  for line in reader.lines() {
    let line = line.map_err(|error| format!("failed reading line from {source}: {error}"))?;
    on_line(line)?;
  }
  Ok(())
}

fn stream_file_lines<F>(args: &[Edn], on_line: F) -> Result<(), String>
where
  F: FnMut(String) -> Result<(), String>,
{
  let [Edn::Str(name)] = args else {
    return Err(format!("read-file-by-line expected 1 filename, got {args:?}"));
  };
  let file = File::open(&**name).map_err(|error| format!("Failed to read file {name:?}: {error}"))?;
  stream_reader_lines(io::BufReader::new(file), &format!("{name:?}"), on_line)
}

/// Stream a file line-by-line through blocking protocol v1.
///
/// Each line is delivered before the next line is read. Terminators match
/// [`BufRead::lines`]: `\n` and a preceding `\r` are removed. Callback errors
/// or host/task closing stop the read immediately.
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
      stream_file_lines(&args, |line| {
        crate::ffi::invoke_blocking_callback(host, task, vec![Edn::str(line)])?;
        Ok(())
      })?;
      Ok(Edn::Nil)
    })
  }
}

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

#[cfg(test)]
mod tests {
  use super::*;
  use std::io::{BufReader, Cursor, Read};

  struct ReadOnceThenPanic {
    emitted: bool,
  }

  impl Read for ReadOnceThenPanic {
    fn read(&mut self, output: &mut [u8]) -> io::Result<usize> {
      assert!(!self.emitted, "reader advanced after callback failure");
      self.emitted = true;
      let line = b"first\n";
      output[..line.len()].copy_from_slice(line);
      Ok(line.len())
    }
  }

  struct RepeatingLines {
    remaining: usize,
  }

  impl Read for RepeatingLines {
    fn read(&mut self, output: &mut [u8]) -> io::Result<usize> {
      if self.remaining == 0 {
        return Ok(0);
      }
      let lines = self.remaining.min(output.len() / 2);
      for chunk in output[..lines * 2].chunks_exact_mut(2) {
        chunk.copy_from_slice(b"x\n");
      }
      self.remaining -= lines;
      Ok(lines * 2)
    }
  }

  #[test]
  fn line_stream_preserves_lines_semantics_without_terminators() {
    let mut lines = Vec::new();
    stream_reader_lines(Cursor::new(b"one\r\ntwo\nthree"), "memory", |line| {
      lines.push(line);
      Ok(())
    })
    .expect("stream lines");
    assert_eq!(lines, ["one", "two", "three"]);
  }

  #[test]
  fn callback_failure_stops_before_reading_more_input() {
    let reader = BufReader::with_capacity(8, ReadOnceThenPanic { emitted: false });
    let error = stream_reader_lines(reader, "guarded", |_| Err("callback stopped".to_owned())).expect_err("callback failure");
    assert_eq!(error, "callback stopped");
  }

  #[test]
  fn large_generated_input_is_delivered_without_a_full_input_buffer() {
    const LINE_COUNT: usize = 1_000_000;
    let reader = BufReader::with_capacity(4096, RepeatingLines { remaining: LINE_COUNT });
    let mut delivered = 0;
    stream_reader_lines(reader, "generated", |line| {
      assert_eq!(line, "x");
      delivered += 1;
      Ok(())
    })
    .expect("stream generated lines");
    assert_eq!(delivered, LINE_COUNT);
  }
}
