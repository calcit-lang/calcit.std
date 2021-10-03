use cirru_edn::Edn;
use std::process::Command;

#[no_mangle]
pub fn execute_command(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(dir), Edn::List(ys)) => {
        let mut cmd = String::from("");
        let mut xs: Vec<String> = vec![];

        for (idx, piece) in ys.iter().enumerate() {
          if let Edn::Str(s) = piece {
            if idx == 0 {
              cmd = s.to_owned();
            } else {
              xs.push(s.to_owned());
            }
          } else {
            return Err(format!(
              "execute-command expected string in list, got {}",
              piece
            ));
          }
        }

        match Command::new(cmd).current_dir(dir).args(&xs).output() {
          Ok(t) => {
            let content = String::from_utf8(t.stdout).unwrap();
            let stderr = String::from_utf8(t.stderr).unwrap();
            Ok(Edn::List(vec![Edn::Str(content), Edn::Str(stderr)]))
          }
          Err(e) => Err(format!("Failed to excute: {}", e)),
        }
      }
      (_, _) => Err(format!(
        "excute-command expected string and list: {:?}",
        args
      )),
    }
  } else {
    Err(format!("excute-command expected 2 args: {:?}", args))
  }
}
