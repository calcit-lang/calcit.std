use std::collections::HashMap;

use chrono::{DateTime, Datelike, TimeZone, Timelike, Utc};
use chrono_tz::Asia::Shanghai;
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
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Number(n), Edn::Nil) => {
        let time = Utc.timestamp(
          (n.floor() / 1000.0) as i64,
          (n.fract() * 1_000_000.0) as u32,
        );
        Ok(Edn::Str(time.to_rfc3339().into_boxed_str()))
      }
      (Edn::Number(n), Edn::Str(f)) => {
        let time = Utc.timestamp(
          (n.floor() / 1000.0) as i64,
          (n.fract() * 1_000_000.0) as u32,
        );
        Ok(Edn::Str(time.format(f).to_string().into_boxed_str()))
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

/// nil for no format
#[no_mangle]
pub fn extract_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    match &args[0] {
      Edn::Number(n) => {
        let time = Utc
          .timestamp(
            (n.floor() / 1000.0) as i64,
            (n.fract() * 1_000_000.0) as u32,
          )
          // TODO need to store timezone inside data structure, and use buffer
          .with_timezone(&Shanghai);

        let mut data: HashMap<Edn, Edn> = HashMap::new();
        data.insert(Edn::kwd("year"), Edn::Number(time.date().year() as f64));
        data.insert(Edn::kwd("month"), Edn::Number(time.date().month() as f64));
        data.insert(Edn::kwd("month0"), Edn::Number(time.date().month0() as f64));
        data.insert(Edn::kwd("day"), Edn::Number(time.date().day() as f64));
        data.insert(Edn::kwd("hour"), Edn::Number(time.hour() as f64));
        data.insert(Edn::kwd("minute"), Edn::Number(time.minute() as f64));
        data.insert(Edn::kwd("second"), Edn::Number(time.second() as f64));
        data.insert(
          Edn::kwd("weekday"),
          Edn::Number(time.date().weekday().num_days_from_sunday() as f64),
        );
        data.insert(
          Edn::kwd("week"),
          Edn::Number(time.date().iso_week().week() as f64),
        );
        data.insert(
          Edn::kwd("week0"),
          Edn::Number(time.date().iso_week().week0() as f64),
        );

        Ok(Edn::Map(data))
      }
      _ => Err(format!(
        "extract-time expected f64 and string, got: {:?}",
        args
      )),
    }
  } else {
    Err(format!("extract-time expected 2 args, got: {:?}", args))
  }
}
