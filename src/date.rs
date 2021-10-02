use chrono::{DateTime, TimeZone, Utc};
use cirru_edn::Edn;

/// calcit represents DateTime in f64
/// nil for no format
#[no_mangle]
pub fn parse_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Nil) => match DateTime::parse_from_rfc3339(s) {
        Ok(time) => Ok(Edn::Number(time.timestamp_millis() as f64)),
        Err(e) => Err(format!("parse-time failed, {}", e)),
      },
      (Edn::Str(s), Edn::Str(f)) => match DateTime::parse_from_str(s, f) {
        Ok(time) => Ok(Edn::Number(time.timestamp_millis() as f64)),
        Err(e) => Err(format!("parse-time failed, {} {} {}", s, f, e)),
      },
      (_, _) => Err(format!("parse-time expected 2 arguments, got: {:?}", args)),
    }
  } else {
    Err(format!("parse-time expected 2 arguments, got: {:?}", args))
  }
}

#[no_mangle]
pub fn now_bang(_args: Vec<Edn>) -> Result<Edn, String> {
  Ok(Edn::Number(Utc::now().timestamp_millis() as f64))
}

/// nil for no format
#[no_mangle]
pub fn format_time(args: Vec<Edn>) -> Result<Edn, String> {
  println!("format time: {:?}", args);
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Number(n), Edn::Nil) => {
        let time = Utc.timestamp(
          (n.floor() / 1000.0) as i64,
          (n.fract() * 1_000_000.0) as u32,
        );
        Ok(Edn::Str(time.to_rfc3339()))
      }
      (Edn::Number(n), Edn::Str(f)) => {
        let time = Utc.timestamp(
          (n.floor() / 1000.0) as i64,
          (n.fract() * 1_000_000.0) as u32,
        );
        Ok(Edn::Str(time.format(f).to_string()))
      }
      (_, _) => Err(format!(
        "format-time expected f64 and string, got: {:?}",
        args
      )),
    }
  } else {
    Err(format!("format-time expected 2 args, got: {:?}", args))
  }
}
