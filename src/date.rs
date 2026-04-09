/// DateTime<FixedOffset> is used to store time internally
///
use std::{collections::HashMap, sync::Arc};

use chrono::{DateTime, Datelike, Duration, FixedOffset, Local, LocalResult, NaiveDate, TimeZone, Timelike, Weekday};
use cirru_edn::{Edn, EdnMapView, EdnTag, EdnTupleView};
use std::ops::Add;

/// calcit represents DateTime in f64
/// nil for no format
#[unsafe(no_mangle)]
pub fn parse_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match (&args[0], &args[1]) {
      (Edn::Str(s), Edn::Nil) => match DateTime::parse_from_rfc3339(s) {
        Ok(time) => Ok(Edn::any_ref(time.fixed_offset())),
        Err(e) => Err(format!("parse-time failed, {e}")),
      },
      (Edn::Str(s), Edn::Str(f)) => match DateTime::parse_from_str(s, f) {
        Ok(time) => Ok(Edn::any_ref(time.fixed_offset())),
        Err(e) => Err(format!("parse-time failed, {s} {f} {e}")),
      },
      (_, _) => Err(format!("parse-time expected 2 arguments, got: {args:?}")),
    }
  } else {
    Err(format!("parse-time expected 2 arguments, got: {args:?}"))
  }
}

#[unsafe(no_mangle)]
pub fn now_bang(_args: Vec<Edn>) -> Result<Edn, String> {
  Ok(Edn::any_ref(Local::now().fixed_offset()))
}

/// TODO currently only return self, no offset involved yet
#[unsafe(no_mangle)]
pub fn get_timestamp(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    match &args[0] {
      Edn::AnyRef(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.as_any().downcast_ref::<DateTime<FixedOffset>>() {
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
#[unsafe(no_mangle)]
pub fn format_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    let raw_time = match &args[0] {
      Edn::AnyRef(r) => Some(r.clone()),
      Edn::Number(n) => {
        let s = (*n / 1000.0) as i64;
        let ns = ((*n % 1000.0) * 1_000_000.0) as u32;
        match FixedOffset::east_opt(0).unwrap().timestamp_opt(s, ns) {
          LocalResult::Single(time) => {
            if let Edn::AnyRef(r) = Edn::any_ref(time) {
              Some(r)
            } else {
              None
            }
          }
          _ => None,
        }
      }
      Edn::Record(record) if record.tag == EdnTag::new("Date") => {
        let mut found = None;
        for entry in &record.pairs {
          if entry.0 == EdnTag::new("date") {
            match &entry.1 {
              Edn::AnyRef(r) => {
                found = Some(r.clone());
              }
              Edn::Number(n) => {
                let s = (*n / 1000.0) as i64;
                let ns = ((*n % 1000.0) * 1_000_000.0) as u32;
                if let LocalResult::Single(time) = FixedOffset::east_opt(0).unwrap().timestamp_opt(s, ns) {
                  if let Edn::AnyRef(r) = Edn::any_ref(time) {
                    found = Some(r);
                  }
                }
              }
              _ => {}
            }
            break;
          }
        }
        found
      }
      _ => None,
    };

    match raw_time {
      Some(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.as_any().downcast_ref::<DateTime<FixedOffset>>() {
          match &args[1] {
            Edn::Nil => Ok(Edn::Str(time.to_rfc3339().into())),
            Edn::Str(f) => Ok(Edn::Str(time.format(f).to_string().into())),
            _ => Err(format!("format-time expected string, got: {args:?}")),
          }
        } else {
          Err(format!("format-time expected DateTime, got: {v:?}"))
        }
      }
      None => Err(format!("format-time expected any-ref, got: {args:?}")),
    }
  } else {
    Err(format!("format-time expected 2 args, got: {args:?}"))
  }
}

/// nil for no format
#[unsafe(no_mangle)]
pub fn extract_time(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    match &args[0] {
      Edn::AnyRef(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.as_any().downcast_ref::<DateTime<FixedOffset>>() {
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

          Ok(Edn::Map(EdnMapView(data)))
        } else {
          Err(format!("extract-time expected DateTime, got: {v:?}"))
        }
      }
      _ => Err(format!("extract-time expected DateTime reference, got: {args:?}")),
    }
  } else {
    Err(format!("extract-time expected 1 arg, got: {args:?}"))
  }
}

/// create date from year/month/day
#[unsafe(no_mangle)]
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
            enum_tag: None,
          })),
          LocalResult::Single(d) => Ok(Edn::Tuple(EdnTupleView {
            tag: Arc::new(Edn::tag("single")),
            extra: vec![Edn::Number(d.timestamp_millis() as f64)],
            enum_tag: None,
          })),
          LocalResult::Ambiguous(d, d2) => Ok(Edn::Tuple(EdnTupleView {
            tag: Arc::new(Edn::tag("ambiguous")),
            extra: vec![Edn::Number(d.timestamp_millis() as f64), Edn::Number(d2.timestamp_millis() as f64)],
            enum_tag: None,
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
#[unsafe(no_mangle)]
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
              enum_tag: None,
            }));
          }
        };
        match NaiveDate::from_isoywd_opt(*y as i32, *w as u32, weekday) {
          Some(time) => match Local.from_local_datetime(&time.and_hms_opt(0, 0, 0).ok_or("hms got none")?) {
            LocalResult::None => Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("none")),
              extra: vec![],
              enum_tag: None,
            })),
            LocalResult::Single(d) => Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("single")),
              extra: vec![Edn::Number(d.timestamp_millis() as f64)],
              enum_tag: None,
            })),
            LocalResult::Ambiguous(d, d2) => Ok(Edn::Tuple(EdnTupleView {
              tag: Arc::new(Edn::tag("single")),
              extra: vec![Edn::Number(d.timestamp_millis() as f64), Edn::Number(d2.timestamp_millis() as f64)],
              enum_tag: None,
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

#[unsafe(no_mangle)]
pub fn add_duration(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 3 {
    let d = match &args[0] {
      Edn::AnyRef(r) => {
        let v = r.0.read().unwrap();
        if let Some(time) = v.as_any().downcast_ref::<DateTime<FixedOffset>>() {
          time.timestamp_millis() as f64
        } else {
          return Err(format!("add-duration expected DateTime, got: {v:?}"));
        }
      }
      Edn::Number(n) => *n,
      a => return Err(format!("add-duration expected date or number, got: {a}")),
    };

    match (&args[1], &args[2]) {
      (Edn::Number(n), Edn::Tag(k)) => {
        let s = (d / 1000.0) as i64;
        let ns = ((d % 1000.0) * 1_000_000.0) as u32;
        let time = match FixedOffset::east_opt(0).unwrap().timestamp_opt(s, ns) {
          LocalResult::Single(d) => d,
          LocalResult::None => return Err(format!("add-duration out of range: {d}")),
          LocalResult::Ambiguous(min_time, max_time) => return Err(format!("add-duration ambiguous: {min_time} {max_time}")),
        };

        match k.arc_str().as_ref() {
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
      (b, c) => Err(format!("add-duration expected number and keyword, got: {b} {c}")),
    }
  } else {
    Err(format!("add-duration expected 3 args, got: {args:?}"))
  }
}
