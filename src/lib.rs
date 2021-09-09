use std::fs;
use std::path::Path;
use std::process::Command;

/// CStr related
#[no_mangle]
pub fn read_file(name: String) -> Result<String, String> {
  let task = fs::read_to_string(&name);
  match task {
    Ok(s) => Ok(s),
    Err(e) => Err(format!("Failed to read file {:?}: {}", name, e)),
  }
}

/// CStr related
#[no_mangle]
pub fn write_file(name: String, content: String) -> Result<(), String> {
  let task = fs::write(name.to_owned(), content.to_owned());
  match task {
    Ok(()) => Ok(()),
    Err(e) => Err(format!("Failed to write to file {:?}: {}", name, e)),
  }
}

/// CStr related
#[no_mangle]
pub fn path_exists(name: String) -> Result<bool, String> {
  return Ok(Path::new(&name).exists());
}

/// CStr related
#[no_mangle]
pub fn read_dir(name: String) -> Result<Vec<String>, String> {
  let task = fs::read_dir(&name);
  match task {
    Ok(children) => {
      let mut content = vec![];
      for c in children {
        content.push(format!("{}", c.unwrap().path().display()));
      }
      // println!("child dir: {:?}", content);

      Ok(content)
    }
    Err(e) => Err(format!("Failed to read dir {:?}: {}", name, e)),
  }
}

#[no_mangle]
pub fn execute_command(pieces: Vec<String>, dir: String) -> Result<(String, String), String> {
  let mut cmd = String::from("");
  let mut args: Vec<String> = vec![];

  for (idx, piece) in pieces.iter().enumerate() {
    if idx == 0 {
      cmd = piece.to_string();
    } else {
      args.push(piece.to_string());
    }
  }

  match Command::new(cmd).current_dir(dir).args(&args).output() {
    Ok(t) => {
      let content = String::from_utf8(t.stdout).unwrap();
      let stderr = String::from_utf8(t.stderr).unwrap();
      Ok((content, stderr))
    }
    Err(e) => Err(format!("Failed to excute: {}", e)),
  }
}
