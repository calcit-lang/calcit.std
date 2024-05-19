//! TODO, need to store offset as well,
//! currently lack of offset, prefer using Local time

use std::{
  collections::HashMap,
  sync::{Arc, RwLock},
};

use chrono::{DateTime, Datelike, Duration, FixedOffset, Local, LocalResult, NaiveDate, TimeZone, Timelike, Weekday};
use cirru_edn::{Edn, EdnAnyRef, EdnTupleView};
use std::ops::Add;

/// an alias generating Edn from DateTime
/// DateTime<FixedOffset> is used to store time internally
fn date_to_edn<T: TimeZone>(d: &DateTime<T>) -> Edn {
  Edn::AnyRef(EdnAnyRef(Arc::new(RwLock::new(d.fixed_offset()))))
}

/// calcit represents DateTime in f64
/// nil for no format
#[no_mangle]
pub fn parse_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Nil) => match DateTime::parse_from_rfc3339(s) {
        Ok(time) => Ok(date_to_edn(&time)),
        Err(e) => Err(format!("parse-time failed, {e}")),
      },
      (Edn::Str(s), Edn::Str(f)) => match DateTime::parse_from_str(s, f) {
        Ok(time) => Ok(date_to_edn(&time)),
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
  Ok(date_to_edn(&Local::now()))
}

/// TODO currently only return self, no offset involved yet
#[no_mangle]
pub fn get_timestamp(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    match &args[0] {
      Edn::AnyRef(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.downcast_ref::<DateTime<FixedOffset>>() {
          Ok((time.timestamp_millis() as f64).into())
        } else {
          Err(format!("get-timestamp expected DateTime, got: {v:?}"))
        }
      }
      _ => Err(format!("get-timestamp expected any-ref, got: {args:?}")),
    }
  } else {
    Err(format!("expected 1 arguments: {args:?}"))
  }
}

/// nil for no format
#[no_mangle]
pub fn format_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match &args[0] {
      Edn::AnyRef(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.downcast_ref::<DateTime<FixedOffset>>() {
          match &args[1] {
            Edn::Nil => Ok(Edn::Str(time.to_rfc3339().into())),
            Edn::Str(f) => Ok(Edn::Str(time.format(f).to_string().into())),
            _ => Err(format!("format-time expected string, got: {args:?}")),
          }
        } else {
          Err(format!("format-time expected DateTime, got: {v:?}"))
        }
      }
      _ => Err(format!("format-time expected any-ref, got: {args:?}")),
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
      Edn::AnyRef(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.downcast_ref::<DateTime<FixedOffset>>() {
          let mut data: HashMap<Edn, Edn> = HashMap::new();
          data.insert(Edn::tag("year"), Edn::Number(time.date_naive().year() as f64));
          data.insert(Edn::tag("month"), Edn::Number(time.date_naive().month() as f64));
          data.insert(Edn::tag("month0"), Edn::Number(time.date_naive().month0() as f64));
          data.insert(Edn::tag("day"), Edn::Number(time.date_naive().day() as f64));
          data.insert(Edn::tag("hour"), Edn::Number(time.time().hour() as f64));
          data.insert(Edn::tag("minute"), Edn::Number(time.time().minute() as f64));
          data.insert(Edn::tag("second"), Edn::Number(time.time().second() as f64));
          data.insert(
            Edn::tag("weekday"),
            Edn::Number(time.date_naive().weekday().num_days_from_sunday() as f64),
          );
          data.insert(Edn::tag("week"), Edn::Number(time.date_naive().iso_week().week() as f64));
          data.insert(Edn::tag("week0"), Edn::Number(time.date_naive().iso_week().week0() as f64));

          Ok(Edn::from(data))
        } else {
          Err(format!("extract-time expected DateTime, got: {v:?}"))
        }
      }
      // }
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
          LocalResult::None => Ok(Edn::Tuple(EdnTupleView {
            tag: Arc::new(Edn::tag("none")),
            extra: vec![],
          })),
          LocalResult::Single(d) => Ok(Edn::Tuple(EdnTupleView {
            tag: Arc::new(Edn::tag("single")),
            extra: vec![date_to_edn(&d)],
          })),
          LocalResult::Ambiguous(d, d2) => Ok(Edn::Tuple(EdnTupleView {
            tag: Arc::new(Edn::tag("ambiguous")),
            extra: vec![date_to_edn(&d), date_to_edn(&d2)],
          })),
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
            return Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("err")),
              extra: vec![Edn::str(format!("invalid digit for weekday: {d}"))],
            }))
          }
        };
        match NaiveDate::from_isoywd_opt(*y as i32, *w as u32, weekday) {
          Some(time) => match Local.from_local_datetime(&time.and_hms_opt(0, 0, 0).ok_or("hms got none")?) {
            LocalResult::None => Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("none")),
              extra: vec![],
            })),
            LocalResult::Single(d) => Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("single")),
              extra: vec![date_to_edn(&d)],
            })),
            LocalResult::Ambiguous(d, d2) => Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("single")),
              extra: vec![date_to_edn(&d), date_to_edn(&d2)],
            })),
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
      (Edn::AnyRef(d), Edn::Number(n), Edn::Tag(k)) => {
        if let Some(time) = d.0.read().unwrap().downcast_ref::<DateTime<FixedOffset>>() {
          match k.ref_str() {
            "week" | "weeks" => Ok(date_to_edn(&time.add(Duration::weeks(*n as i64)))),
            "day" | "days" => Ok(date_to_edn(&time.add(Duration::days(*n as i64)))),
            "h" | "hour" | "hours" => Ok(date_to_edn(&time.add(Duration::hours(*n as i64)))),
            "min" | "minute" | "minutes" => Ok(date_to_edn(&time.add(Duration::minutes(*n as i64)))),
            "second" | "seconds" => Ok(date_to_edn(&time.add(Duration::seconds(*n as i64)))),
            "milli" | "millisecond" | "milliseconds" => Ok(date_to_edn(&time.add(Duration::milliseconds(*n as i64)))),
            a => Err(format!("unknown duration unit: {a}")),
          }
        } else {
          Err(format!("add-duration expected any-ref, got: {d:?}"))
        }
      }
      (a, b, c) => Err(format!("add-duration expected date, any-ref, keyword: {a} {b} {c}")),
    }
  } else {
    Err(format!("add-duration expected date, number and keyword, {args:?}"))
  }
}
