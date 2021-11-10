use cirru_edn::Edn;
use std::path::{Path, PathBuf};

#[no_mangle]
pub fn join_path(args: Vec<Edn>) -> Result<Edn, String> {
  if args.is_empty() {
    Err(format!(
      "join-path expected multiple arguments, got: {:?}",
      args
    ))
  } else {
    let mut first = true;
    let mut buf: PathBuf = PathBuf::from("");
    for p in args {
      if let Edn::Str(s) = p {
        if first {
          buf = PathBuf::from(&*s);
          first = false
        } else {
          buf = buf.join(PathBuf::from(&*s));
        }
      } else {
        return Err(format!("expected string path: {}", p));
      }
    }
    Ok(Edn::str(buf.display().to_string()))
  }
}

/// naming like Node.js
#[no_mangle]
pub fn path_dirname(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(s) = &args[0] {
      match Path::new(&**s).parent() {
        Some(v) => Ok(Edn::str(v.display().to_string())),
        None => Err(format!("cannot read dirname from: {}", args[0])),
      }
    } else {
      Err(format!("path-dirname expected 1 path, got: {}", args[0]))
    }
  } else {
    Err(format!("path-dirname expected 1 arg, got: {:?}", args))
  }
}

/// naming like Node.js
#[no_mangle]
pub fn path_basename(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(s) = &args[0] {
      match Path::new(&**s).file_name() {
        Some(v) => Ok(Edn::str(v.to_str().unwrap())),
        None => Err(format!("cannot read basename from: {}", args[0])),
      }
    } else {
      Err(format!("path-basename expected 1 path, got: {}", args[0]))
    }
  } else {
    Err(format!("path-basename expected 1 arg, got: {:?}", args))
  }
}
