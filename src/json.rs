use std::collections::HashMap;

use serde_json::Value;

use cirru_edn::{Edn, EdnKwd};

pub fn json_to_edn(data: &Value) -> Edn {
  match data {
    Value::Null => Edn::Nil,
    Value::Bool(b) => Edn::Bool(*b),
    Value::Number(n) => Edn::Number(n.as_f64().unwrap()), // why f64
    Value::String(s) => {
      if s.starts_with(':') {
        // special logic to parse keyword
        Edn::Keyword(EdnKwd::new(s.strip_prefix(':').unwrap()))
      } else {
        Edn::Str(s.to_owned().into_boxed_str())
      }
    }
    Value::Array(xs) => {
      let mut ys: Vec<Edn> = vec![];
      for x in xs {
        ys.push(json_to_edn(x));
      }
      Edn::List(ys)
    }
    Value::Object(xs) => {
      let mut ys: HashMap<Edn, Edn> = HashMap::new();
      for (k, v) in xs {
        let key = if k.starts_with(':') {
          Edn::kwd(k.strip_prefix(':').unwrap())
        } else {
          Edn::Str(k.to_owned().into_boxed_str())
        };
        ys.insert(key, json_to_edn(v));
      }
      Edn::Map(ys)
    }
  }
}

/// option for "add colon to keyword"
pub fn edn_to_json(data: Edn, add_colon: bool) -> Result<Value, String> {
  match data {
    Edn::Nil => Ok(Value::Null),
    Edn::Bool(b) => Ok(Value::Bool(b)),
    Edn::Number(n) => match serde_json::value::Number::from_f64(n) {
      Some(v) => Ok(Value::Number(v)),
      None => Err(format!("failed to convert to number: {n}")),
    },
    Edn::Symbol(s, ..) => Ok(Value::String((*s).to_string())),
    Edn::Keyword(s) => {
      if add_colon {
        Ok(Value::String(format!(":{s}")))
      } else {
        Ok(Value::String((*s.to_str()).to_string()))
      }
    }
    Edn::Str(s) => Ok(Value::String((*s).to_string())),
    Edn::List(xs) => {
      let mut ys: Vec<Value> = vec![];
      for x in xs {
        ys.push(edn_to_json(x, add_colon)?);
      }
      Ok(Value::Array(ys))
    }
    Edn::Map(xs) => {
      let mut data = serde_json::Map::new();
      for (k, v) in xs {
        match k {
          Edn::Str(s) => {
            data.insert(s.to_string(), edn_to_json(v, add_colon)?);
          }
          Edn::Keyword(s) => {
            if add_colon {
              data.insert(format!(":{}", s.to_owned()), edn_to_json(v, add_colon)?);
            } else {
              data.insert(s.to_string(), edn_to_json(v, add_colon)?);
            }
          }
          a => return Err(format!("expected string/keyword for json keys, got: {a}")),
        }
      }

      Ok(Value::Object(data))
    }
    Edn::Record(_, entries) => {
      let mut data = serde_json::Map::new();
      for entry in entries {
        data.insert(entry.0.to_string(), edn_to_json(entry.1.to_owned(), add_colon)?);
      }
      Ok(Value::Object(data))
    }
    a => Err(format!("cannot convert to json: {a}")),
  }
}

/// public interface to builtins
#[no_mangle]
pub fn parse_json(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    match &args[0] {
      Edn::Str(s) => match serde_json::from_str::<Value>(s) {
        Ok(v) => Ok(json_to_edn(&v)),
        Err(e) => Err(format!("failed to parse JSON: {e}")),
      },
      _ => Err(format!("parse-json expected 1 string, got {args:?}")),
    }
  } else {
    Err(format!("parse-json expected 1 argument, got {args:?}"))
  }
}

#[no_mangle]
pub fn stringify_json(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 2 {
    match &args[1] {
      Edn::Bool(add_colon) => {
        let ret = edn_to_json(args[0].to_owned(), *add_colon)?;
        match serde_json::to_string(&ret) {
          Ok(s) => Ok(Edn::Str(s.into_boxed_str())),
          Err(e) => Err(format!("failed to generate string: {e}")),
        }
      }
      Edn::Nil => {
        let ret = edn_to_json(args[0].to_owned(), false)?;
        match serde_json::to_string(&ret) {
          Ok(s) => Ok(Edn::Str(s.into_boxed_str())),
          Err(e) => Err(format!("failed to generate string: {e}")),
        }
      }
      _ => Err(format!("stringify-json expected add_colon in bool, got {:?}", args[1])),
    }
  } else {
    Err(format!("stringify-json expected 2 arguments, got {args:?}"))
  }
}
