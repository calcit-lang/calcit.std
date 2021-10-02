use std::process::Command;

#[no_mangle]
pub fn execute_command(dir: String, pieces: Vec<String>) -> Result<(String, String), String> {
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
