use rand::prelude::*;

use cirru_edn::Edn;

pub fn rand_number(n: f64) -> f64 {
  let mut rng = rand::thread_rng();
  let y: f64 = rng.r#gen(); // generates a float between 0 and 1
  y * n
}

fn option_number(value: &Edn, name: &str) -> Result<Option<f64>, String> {
  match value {
    Edn::Nil => Ok(None),
    Edn::Number(n) => Ok(Some(*n)),
    Edn::Enum(option) if option.variant.as_ref() == "none" && option.extra.is_empty() => Ok(None),
    Edn::Enum(option) if option.variant.as_ref() == "some" && option.extra.len() == 1 => match &option.extra[0] {
      Edn::Number(n) => Ok(Some(*n)),
      inner => Err(format!("{name} expected Option<Number>, got some({inner})")),
    },
    other => Err(format!("{name} expected Option<Number>, got: {other}")),
  }
}

fn option_string(value: &Edn, name: &str) -> Result<Option<String>, String> {
  match value {
    Edn::Nil => Ok(None),
    Edn::Str(s) => Ok(Some(s.to_string())),
    Edn::Enum(option) if option.variant.as_ref() == "none" && option.extra.is_empty() => Ok(None),
    Edn::Enum(option) if option.variant.as_ref() == "some" && option.extra.len() == 1 => match &option.extra[0] {
      Edn::Str(s) => Ok(Some(s.to_string())),
      inner => Err(format!("{name} expected Option<String>, got some({inner})")),
    },
    other => Err(format!("{name} expected Option<String>, got: {other}")),
  }
}

pub fn rand(xs: Vec<Edn>) -> Result<Edn, String> {
  if xs.len() == 2 {
    match (option_number(&xs[0], "rand from")?, option_number(&xs[1], "rand to")?) {
      (None, None) => Ok(Edn::Number(rand_number(100.0))),
      (Some(n), None) => Ok(Edn::Number(rand_number(n))),
      (Some(from), Some(to)) => {
        let delta = to - from;

        Ok(Edn::Number(from + rand_number(delta)))
      }
      (None, Some(to)) => Err(format!("rand requires from when to is some({to})")),
    }
  } else {
    Err(format!("rand expected 2 numbers: {xs:?}"))
  }
}

pub fn rand_int(xs: Vec<Edn>) -> Result<Edn, String> {
  if xs.len() == 2 {
    match (option_number(&xs[0], "rand-int from")?, option_number(&xs[1], "rand-int to")?) {
      (None, None) => Ok(Edn::Number(rand_number(100.0).floor())),
      (Some(n), None) => Ok(Edn::Number(rand_number(n).floor())),
      (Some(from), Some(to)) => {
        let delta = to - from;

        Ok(Edn::Number((from + rand_number(delta)).floor()))
      }
      (None, Some(to)) => Err(format!("rand-int requires from when to is some({to})")),
    }
  } else {
    Err(format!("rand-int expected 2 arguments, got: {xs:?}"))
  }
}

pub fn f64_to_usize(f: f64) -> Result<usize, String> {
  if f.fract() == 0.0 {
    if f >= 0.0 {
      Ok(f as usize)
    } else {
      Err(format!("usize expected a positive number, but got: {f}"))
    }
  } else {
    Err(format!("cannot extract usize from float: {f}"))
  }
}

pub fn call_nanoid(xs: Vec<Edn>) -> Result<Edn, String> {
  if xs.len() == 2 {
    let size = option_number(&xs[0], "nanoid! size")?.map(f64_to_usize).transpose()?;
    let chars = option_string(&xs[1], "nanoid! chars")?;

    match (size, chars) {
      (None, None) => Ok(Edn::Str(nanoid!().into())),
      (Some(n), None) => Ok(Edn::Str(nanoid!(n).into())),
      (Some(n), Some(s)) => {
        let mut charset: Vec<char> = vec![];
        for c in s.chars() {
          charset.push(c);
        }
        Ok(Edn::Str(nanoid!(n, &charset).into()))
      }
      (None, Some(_)) => Err("nanoid! requires size when chars is present".to_owned()),
    }
  } else {
    Err(format!("nanoid! expected 2 args, got: {xs:?}"))
  }
}

// cheap way creating hex color
pub fn rand_hex_color(_xs: Vec<Edn>) -> Result<Edn, String> {
  let mut rng = rand::thread_rng();
  let y: u32 = rng.r#gen();
  Ok(Edn::str(format!("#{:06x}", y >> 8)))
}

#[cfg(test)]
mod tests {
  use super::*;

  fn none() -> Edn {
    Edn::enum_value("none", vec![])
  }

  fn some(value: Edn) -> Edn {
    Edn::enum_value("some", vec![value])
  }

  #[test]
  fn decodes_calcit_option_values() {
    assert_eq!(option_number(&none(), "number").unwrap(), None);
    assert_eq!(option_number(&some(Edn::Number(5.0)), "number").unwrap(), Some(5.0));
    assert_eq!(option_string(&some(Edn::str("abc")), "string").unwrap(), Some("abc".to_owned()));
  }

  #[test]
  fn random_exports_accept_option_arguments() {
    let Edn::Number(value) = rand(vec![some(Edn::Number(10.0)), none()]).unwrap() else {
      panic!("rand should return a number");
    };
    assert!((0.0..10.0).contains(&value));

    assert_eq!(
      call_nanoid(vec![some(Edn::Number(5.0)), some(Edn::str("a"))]).unwrap(),
      Edn::str("aaaaa")
    );
  }
}
