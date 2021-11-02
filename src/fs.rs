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
