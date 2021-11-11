//! wraped some functions from std::fs https://doc.rust-lang.org/std/fs/index.html

use cirru_edn::Edn;
use std::fs;
use std::path::Path;

#[no_mangle]
pub fn read_file(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      let task = fs::read_to_string(&**name);
      match task {
        Ok(s) => Ok(Edn::Str(s.into_boxed_str())),
        Err(e) => Err(format!("Failed to read file {:?}: {}", name, e)),
      }
    } else {
      Err(format!("read-file expected 1 filename, got {:?}", &args[0]))
    }
  } else {
    Err(format!("read-file expected 1 argument, got {:?}", args))
  }
}

#[no_mangle]
pub fn write_file(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(name), Edn::Str(content)) => {
        let task = fs::write(&**name, &**content);
        match task {
          Ok(()) => Ok(Edn::Nil),
          Err(e) => Err(format!("Failed to write to file {:?}: {}", name, e)),
        }
      }
      (_, _) => Err(format!("write-file expected 2 strings, got {:?}", args)),
    }
  } else {
    Err(format!("write-file expected 2 args, got {:?}", args))
  }
}

#[no_mangle]
pub fn path_exists(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      Ok(Edn::Bool(Path::new(&**name).exists()))
    } else {
      Err(format!("path-exists? expected 1 filename, got {:?}", args))
    }
  } else {
    Err(format!("path-exists? expected 1 arg, got {:?}", args))
  }
}

#[no_mangle]
pub fn read_dir(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      let task = fs::read_dir(&**name);
      match task {
        Ok(children) => {
          let mut content: Vec<Edn> = vec![];
          for c in children {
            content.push(Edn::Str(
              format!("{}", c.unwrap().path().display()).into_boxed_str(),
            ));
          }
          // println!("child dir: {:?}", content);

          Ok(Edn::List(content))
        }
        Err(e) => Err(format!("Failed to read dir {:?}: {}", name, e)),
      }
    } else {
      Err(format!("read-dir expected a string, {}", &args[0]))
    }
  } else {
    Err(format!("read-dir expected 1 argument, got: {:?}", args))
  }
}

/// wraps https://doc.rust-lang.org/std/fs/fn.create_dir.html
/// throws error in many cases, path existed, missing parents
#[no_mangle]
pub fn create_dir(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      fs::create_dir(&**name).map_err(|e| e.to_string())?;
      Ok(Edn::Nil)
    } else {
      Err(format!(
        "create-dir! expected 1 filename, got {:?}",
        &args[0]
      ))
    }
  } else {
    Err(format!("create-dir! expected 1 argument, got {:?}", args))
  }
}

/// wraps https://doc.rust-lang.org/std/fs/fn.create_dir_all.html
#[no_mangle]
pub fn create_dir_all(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      fs::create_dir_all(&**name).map_err(|e| e.to_string())?;
      Ok(Edn::Nil)
    } else {
      Err(format!(
        "create-dir-all! expected 1 filename, got {:?}",
        &args[0]
      ))
    }
  } else {
    Err(format!(
      "create-dir-all! expected 1 argument, got {:?}",
      args
    ))
  }
}

/// wraps https://doc.rust-lang.org/std/fs/fn.rename.html
#[no_mangle]
pub fn rename_path(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(name), Edn::Str(next)) => {
        let task = fs::rename(&**name, &**next);
        match task {
          Ok(()) => Ok(Edn::Nil),
          Err(e) => Err(format!(
            "Failed to rename file {:?} -> {:?} {}",
            name, next, e
          )),
        }
      }
      (_, _) => Err(format!("rename! expected 2 strings, got {:?}", args)),
    }
  } else {
    Err(format!("rename! expected 2 args, got {:?}", args))
  }
}

/// make sure path existed. skip if file content identical
#[no_mangle]
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
                  Err(e) => Err(format!("Failed to write to file {:?}: {}", name, e)),
                }
              }
            }
            Err(e) => Err(e.to_string()),
          }
        } else {
          let parent = Path::new(&**name).parent().expect("some parent");
          if !parent.exists() {
            fs::create_dir_all(parent).expect("create target path");
          }
          let task = fs::write(&**name, &**content);
          match task {
            Ok(()) => Ok(Edn::Bool(true)),
            Err(e) => Err(format!("Failed to write to file {:?}: {}", name, e)),
          }
        }
      }
      (_, _) => Err(format!(
        "check-write-file! expected 2 strings, got {:?}",
        args
      )),
    }
  } else {
    Err(format!("check-write-file! expected 2 args, got {:?}", args))
  }
}
