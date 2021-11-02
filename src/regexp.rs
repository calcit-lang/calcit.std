use cirru_edn::Edn;
use regex::Regex;

#[no_mangle]
pub fn re_matches(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Str(pattern)) => match Regex::new(pattern) {
        Ok(p) => Ok(Edn::Bool(p.is_match(s))),
        Err(e) => Err(format!("re-matches failed, {}", e)),
      },
      (_, _) => Err(format!("re-matches expected 2 strings: {:?}", args)),
    }
  } else {
    Err(format!("re-matches expected 2 strings: {:?}", args))
  }
}

#[no_mangle]
pub fn re_find_index(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Str(pattern)) => {
        match Regex::new(pattern) {
          Ok(p) => match p.find(s) {
            Some(matched) => Ok(Edn::Number(matched.start() as f64)),
            None => Ok(Edn::Number(-1.0)), // TODO maybe nil
          },
          Err(e) => Err(format!("re-find-index failed, {}", e)),
        }
      }
      (_, _) => Err(format!("re-find-index expected 2 strings: {:?}", args)),
    }
  } else {
    Err(format!("re-find-index expected 2 strings: {:?}", args))
  }
}

#[no_mangle]
/// takes stirng and patterns, returns a matches string, or empty for nil
pub fn re_find(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Str(pattern)) => {
        match Regex::new(pattern) {
          Ok(p) => {
            let mut matched = p.find_iter(s);
            match matched.next() {
              Some(v) => Ok(Edn::Str(v.as_str().to_string().into_boxed_str())),
              None => Ok(Edn::Str("".to_owned().into_boxed_str())), // TODO maybe nil
            }
          }
          Err(e) => Err(format!("re-find failed, {}", e)),
        }
      }
      (_, _) => Err(format!("re-find expected 2 strings: {:?}", args)),
    }
  } else {
    Err(format!("re-find expected 2 strings: {:?}", args))
  }
}

#[no_mangle]
pub fn re_find_all(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Str(pattern)) => match Regex::new(pattern) {
        Ok(p) => {
          let mut ys: Vec<Edn> = vec![];
          for v in p.find_iter(s) {
            ys.push(Edn::Str(v.as_str().to_string().into_boxed_str()))
          }
          Ok(Edn::List(ys))
        }
        Err(e) => Err(format!("re-find-all failed, {}", e)),
      },
      (_, _) => Err(format!("re-find-all expected 2 strings: {:?}", args)),
    }
  } else {
    Err(format!("re-find-all expected 2 strings: {:?}", args))
  }
}
