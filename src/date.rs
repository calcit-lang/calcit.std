//! TODO, need to store offset as well,
//! currently lack of offset, prefer using Local time

use std::collections::HashMap;

use chrono::{DateTime, Datelike, Duration, Local, LocalResult, NaiveDate, TimeZone, Timelike, Utc, Weekday};
use cirru_edn::Edn;
use std::ops::Add;

/// calcit represents DateTime in f64
/// nil for no format
#[no_mangle]
pub fn parse_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Nil) => match DateTime::parse_from_rfc3339(s) {
        Ok(time) => Ok(Edn::Number(time.timestamp_millis() as f64)),
        Err(e) => Err(format!("parse-time failed, {e}")),
      },
      (Edn::Str(s), Edn::Str(f)) => match DateTime::parse_from_str(s, f) {
        Ok(time) => Ok(Edn::Number(time.timestamp_millis() as f64)),
        Err(e) => Err(format!("parse-time failed, {s} {f} {e}")),
      },
      (_, _) => Err(format!("parse-time expected 2 arguments, got: {args:?}")),
    }
  } else {
    Err(format!("parse-time expected 2 arguments, got: {args:?}"))
  }
}

#[no_mangle]
pub fn now_bang(_args: Vec<Edn>) -> Result<Edn, String> {
  Ok(Edn::Number(Utc::now().timestamp_millis() as f64))
}

/// TODO currently only return self, no offset involved yet
#[no_mangle]
pub fn get_timestamp(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    Ok(args[0].to_owned())
  } else {
    Err(format!("expected 1 arguments: {args:?}"))
  }
}

/// nil for no format
#[no_mangle]
pub fn format_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Number(n), Edn::Nil) => match Local.timestamp_opt((n.floor() / 1000.0) as i64, (n.fract() * 1_000_000.0) as u32) {
        LocalResult::Single(time) => Ok(Edn::Str(time.to_rfc3339().into_boxed_str())),
        LocalResult::Ambiguous(min_time, max_time) => Err(format!("format-time failed, ambiguous: {min_time} {max_time}")),
        LocalResult::None => Err(format!("format-time out of range: {n}")),
      },
      (Edn::Number(n), Edn::Str(f)) => match Local.timestamp_opt((n.floor() / 1000.0) as i64, (n.fract() * 1_000_000.0) as u32) {
        LocalResult::Single(time) => Ok(Edn::Str(time.format(f).to_string().into_boxed_str())),
        LocalResult::None => Err(format!("format-time out of range: {n} {f}")),
        LocalResult::Ambiguous(min_time, max_time) => Err(format!("format-time ambiguous: {min_time} {max_time}")),
      },
      (_, _) => Err(format!("format-time expected f64 and string, got: {args:?}")),
    }
  } else {
    Err(format!("format-time expected 2 args, got: {args:?}"))
  }
}

/// nil for no format
#[no_mangle]
pub fn extract_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    match &args[0] {
      Edn::Number(n) => {
        let time = match Local.timestamp_opt((n.floor() / 1000.0) as i64, (n.fract() * 1_000_000.0) as u32) {
          LocalResult::Single(time) => time,
          LocalResult::Ambiguous(min_time, max_time) => return Err(format!("extract-time failed, ambiguous: {min_time} {max_time}")),
          LocalResult::None => return Err(format!("extract-time out of range: {n}")),
        };

        let mut data: HashMap<Edn, Edn> = HashMap::new();
        data.insert(Edn::kwd("year"), Edn::Number(time.date_naive().year() as f64));
        data.insert(Edn::kwd("month"), Edn::Number(time.date_naive().month() as f64));
        data.insert(Edn::kwd("month0"), Edn::Number(time.date_naive().month0() as f64));
        data.insert(Edn::kwd("day"), Edn::Number(time.date_naive().day() as f64));
        data.insert(Edn::kwd("hour"), Edn::Number(time.hour() as f64));
        data.insert(Edn::kwd("minute"), Edn::Number(time.minute() as f64));
        data.insert(Edn::kwd("second"), Edn::Number(time.second() as f64));
        data.insert(
          Edn::kwd("weekday"),
          Edn::Number(time.date_naive().weekday().num_days_from_sunday() as f64),
        );
        data.insert(Edn::kwd("week"), Edn::Number(time.date_naive().iso_week().week() as f64));
        data.insert(Edn::kwd("week0"), Edn::Number(time.date_naive().iso_week().week0() as f64));

        Ok(Edn::Map(data))
      }
      _ => Err(format!("extract-time expected f64 and string, got: {args:?}")),
    }
  } else {
    Err(format!("extract-time expected 2 args, got: {args:?}"))
  }
}

/// create date from year/month/day
#[no_mangle]
pub fn from_ymd(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 3 {
    match (&args[0], &args[1], &args[2]) {
      (Edn::Number(y), Edn::Number(m), Edn::Number(d)) => {
        // from local time
        match Local.from_local_datetime(
          &NaiveDate::from_ymd_opt(*y as i32, *m as u32, *d as u32)
            .ok_or("from_ymd got none")?
            .and_hms_opt(0, 0, 0)
            .ok_or("from_ymd got none")?,
        ) {
          LocalResult::None => Ok(Edn::List(vec![Edn::kwd("none")])),
          LocalResult::Single(d) => Ok(Edn::List(vec![Edn::kwd("single"), Edn::Number(d.timestamp_millis() as f64)])),
          LocalResult::Ambiguous(d, d2) => Ok(Edn::List(vec![
            Edn::kwd("ambiguous"),
            Edn::Number(d.timestamp_millis() as f64),
            Edn::Number(d2.timestamp_millis() as f64),
          ])),
        }
      }
      (a, b, c) => Err(format!("from-ymd expected 2 args, got: {a} {b} {c}")),
    }
  } else {
    Err(format!("from-ymd expected 3 args, got: {args:?}"))
  }
}

/// create date from year/week/day
#[no_mangle]
pub fn from_ywd(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 3 {
    match (&args[0], &args[1], &args[2]) {
      (Edn::Number(y), Edn::Number(w), Edn::Number(d)) => {
        let weekday = match *d as u8 {
          0 => Weekday::Sun,
          1 => Weekday::Mon,
          2 => Weekday::Tue,
          3 => Weekday::Wed,
          4 => Weekday::Thu,
          5 => Weekday::Fri,
          6 => Weekday::Sat,
          _ => {
            return Ok(Edn::List(vec![
              Edn::kwd("err"),
              Edn::str(format!("invalid digit for weekday: {d}")),
            ]))
          }
        };
        match NaiveDate::from_isoywd_opt(*y as i32, *w as u32, weekday) {
          Some(time) => match Local.from_local_datetime(&time.and_hms_opt(0, 0, 0).ok_or("hms got none")?) {
            LocalResult::None => Ok(Edn::List(vec![Edn::kwd("none")])),
            LocalResult::Single(d) => Ok(Edn::List(vec![Edn::kwd("single"), Edn::Number(d.timestamp_millis() as f64)])),
            LocalResult::Ambiguous(d, d2) => Ok(Edn::List(vec![
              Edn::kwd("single"),
              Edn::Number(d.timestamp_millis() as f64),
              Edn::Number(d2.timestamp_millis() as f64),
            ])),
          },
          None => Err(format!("from-ywd got invalid args: {y} {w} {weekday}")),
        }
      }
      (a, b, c) => Err(format!("from-ywd expected 3 args, got: {a} {b} {c}")),
    }
  } else {
    Err(format!("from-ywd expected 3 args, got: {args:?}"))
  }
}

#[no_mangle]
pub fn add_duration(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 3 {
    match (&args[0], &args[1], &args[2]) {
      (Edn::Number(d), Edn::Number(n), Edn::Keyword(k)) => {
        let time = match Local.timestamp_opt((d.floor() / 1000.0) as i64, (d.fract() * 1_000_000.0) as u32) {
          LocalResult::Single(d) => d,
          LocalResult::None => return Err(format!("add-duration out of range: {d}")),
          LocalResult::Ambiguous(min_time, max_time) => return Err(format!("add-duration ambiguous: {min_time} {max_time}")),
        };

        match &(*k.to_str()) {
          "week" | "weeks" => Ok(Edn::Number(time.add(Duration::weeks(*n as i64)).timestamp_millis() as f64)),
          "day" | "days" => Ok(Edn::Number(time.add(Duration::days(*n as i64)).timestamp_millis() as f64)),
          "h" | "hour" | "hours" => Ok(Edn::Number(time.add(Duration::hours(*n as i64)).timestamp_millis() as f64)),
          "min" | "minute" | "minutes" => Ok(Edn::Number(time.add(Duration::minutes(*n as i64)).timestamp_millis() as f64)),
          "second" | "seconds" => Ok(Edn::Number(time.add(Duration::seconds(*n as i64)).timestamp_millis() as f64)),
          "milli" | "millisecond" | "milliseconds" => {
            Ok(Edn::Number(time.add(Duration::milliseconds(*n as i64)).timestamp_millis() as f64))
          }
          a => Err(format!("unknown duration unit: {a}")),
        }
      }
      (a, b, c) => Err(format!("add-duration expected date, numner, keyword: {a} {b} {c}")),
    }
  } else {
    Err(format!("add-duration expected date, number and keyword, {args:?}"))
  }
}
