use cirru_edn::{Edn, EdnListView, EdnTupleView};
use std::io::{BufRead, BufReader, Read};
use std::process::{Command, Stdio};
use std::sync::mpsc;
use std::sync::Arc;
use std::thread;

/// Reads one child's pipe without blocking the other pipe. Events are line-based
/// because `BufRead::lines` also keeps stdout/stderr pipes from deadlocking.
fn forward_lines<R: Read + Send + 'static>(pipe: R, name: &'static str, tx: mpsc::Sender<(&'static str, String)>) {
  thread::spawn(move || {
    for line in BufReader::new(pipe).lines().map_while(Result::ok) {
      if tx.send((name, line + "\n")).is_err() {
        break;
      }
    }
  });
}

#[unsafe(no_mangle)]
pub fn execute_command(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(dir), Edn::List(EdnListView(ys))) => {
        let mut cmd = String::from("");
        let mut xs: Vec<String> = vec![];

        for (idx, piece) in ys.iter().enumerate() {
          if let Edn::Str(s) = piece {
            if idx == 0 {
              cmd = s.to_string();
            } else {
              xs.push(s.to_string());
            }
          } else {
            return Err(format!("execute-command expected string in list, got {piece}"));
          }
        }

        match Command::new(cmd).current_dir(&**dir).args(&xs).output() {
          Ok(t) => {
            let content = String::from_utf8(t.stdout).unwrap();
            let stderr = String::from_utf8(t.stderr).unwrap();
            Ok(Edn::List(EdnListView(vec![Edn::Str(content.into()), Edn::Str(stderr.into())])))
          }
          Err(e) => Err(format!("Failed to excute: {e}")),
        }
      }
      (_, _) => Err(format!("excute-command expected string and list: {args:?}")),
    }
  } else {
    Err(format!("excute-command expected 2 args: {args:?}"))
  }
}

/// Starts a command asynchronously and reports output lines as tagged EDN tuples.
/// The callback receives `(:stdout "...")` or `(:stderr "...")`; callbacks are
/// serialized through one event channel while stdout and stderr are read in parallel.
#[unsafe(no_mangle)]
pub fn stream_command(
  args: Vec<Edn>,
  handler: Arc<dyn Fn(Vec<Edn>) -> Result<Edn, String> + Send + Sync + 'static>,
  finish: Box<dyn FnOnce() + Send + Sync + 'static>,
) -> Result<Edn, String> {
  if args.len() != 2 {
    return Err(format!("stream-command expected working directory and command list: {args:?}"));
  }
  let (Edn::Str(dir), Edn::List(EdnListView(parts))) = (&args[0], &args[1]) else {
    return Err(format!("stream-command expected string and list: {args:?}"));
  };
  let mut command = parts.iter();
  let Some(Edn::Str(program)) = command.next() else {
    return Err(format!("stream-command expected a non-empty string command: {args:?}"));
  };
  let extra_args: Vec<String> = command
    .map(|x| match x {
      Edn::Str(s) => Ok(s.to_string()),
      _ => Err(format!("stream-command expected string arguments: {args:?}")),
    })
    .collect::<Result<_, _>>()?;
  let mut child = Command::new(&**program)
    .current_dir(&**dir)
    .args(extra_args)
    .stdout(Stdio::piped())
    .stderr(Stdio::piped())
    .spawn()
    .map_err(|e| format!("failed to spawn command: {e}"))?;
  let stdout = child.stdout.take().ok_or("failed to capture stdout")?;
  let stderr = child.stderr.take().ok_or("failed to capture stderr")?;
  let (tx, rx) = mpsc::channel::<(&'static str, String)>();
  forward_lines(stdout, "stdout", tx.clone());
  forward_lines(stderr, "stderr", tx.clone());
  drop(tx);
  thread::spawn(move || {
    for (name, content) in rx {
      let tag = Edn::tag(name);
      let event = Edn::Tuple(EdnTupleView {
        tag: Arc::new(tag),
        extra: vec![Edn::Str(content.into())],
        enum_tag: Some(Arc::new(Edn::tag("ProcessOutput"))),
      });
      if let Err(e) = handler(vec![event]) {
        eprintln!("stream callback failed: {e}");
        break;
      }
    }
    let _ = child.wait();
    finish();
  });
  Ok(Edn::Nil)
}
