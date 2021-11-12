use rand::prelude::*;

use cirru_edn::Edn;

pub fn rand_number(n: f64) -> f64 {
  let mut rng = rand::thread_rng();
  let y: f64 = rng.gen(); // generates a float between 0 and 1
  y * n
}

#[no_mangle]
pub fn rand(xs: Vec<Edn>) -> Result<Edn, String> {
  if xs.len() == 2 {
    match (&xs[0], &xs[1]) {
      (Edn::Nil, Edn::Nil) => Ok(Edn::Number(rand_number(100.0))),
      (Edn::Number(n), Edn::Nil) => Ok(Edn::Number(rand_number(*n))),
      (Edn::Number(from), Edn::Number(to)) => {
        let delta = to - from;

        Ok(Edn::Number(from + rand_number(delta)))
      }
      (a, b) => Err(format!("rand expected 2 numbers: {:?} {:?}", a, b)),
    }
  } else {
    Err(format!("rand expected 2 numbers: {:?}", xs))
  }
}

#[no_mangle]
pub fn rand_int(xs: Vec<Edn>) -> Result<Edn, String> {
  if xs.len() == 2 {
    match (&xs[0], &xs[1]) {
      (Edn::Nil, Edn::Nil) => Ok(Edn::Number(rand_number(100.0).floor())),
      (Edn::Number(n), Edn::Nil) => Ok(Edn::Number(rand_number(*n).floor())),
      (Edn::Number(from), Edn::Number(to)) => {
        let delta = to - from;

        Ok(Edn::Number((from + rand_number(delta)).floor()))
      }
      (a, b) => Err(format!("rand-int expected 2 numbers: {:?} {:?}", a, b)),
    }
  } else {
    Err(format!("rand-int expected 2 arguments, got: {:?}", xs))
  }
}

pub fn f64_to_usize(f: f64) -> Result<usize, String> {
  if f.fract() == 0.0 {
    if f >= 0.0 {
      Ok(f as usize)
    } else {
      Err(format!("usize expected a positive number, but got: {}", f))
    }
  } else {
    Err(format!("cannot extract usize from float: {}", f))
  }
}

#[no_mangle]
pub fn call_nanoid(xs: Vec<Edn>) -> Result<Edn, String> {
  if xs.len() == 2 {
    let size = match &xs[0] {
      Edn::Number(n) => match f64_to_usize(*n) {
        Ok(size) => Some(size),
        Err(e) => return Err(e),
      },
      Edn::Nil => None, // nanoid defaults to 21
      a => return Err(format!("expected usize, got: {}", a)),
    };

    match (size, &xs[1]) {
      (None, Edn::Nil) => Ok(Edn::Str(nanoid!().into_boxed_str())),
      (Some(n), Edn::Nil) => Ok(Edn::Str(nanoid!(n).into_boxed_str())),
      (Some(n), Edn::Str(s)) => {
        let mut charset: Vec<char> = vec![];
        for c in s.chars() {
          charset.push(c);
        }
        Ok(Edn::Str(nanoid!(n, &charset).into_boxed_str()))
      }
      (a, b) => Err(format!(
        "nanoid! expected size or charset, got: {:?} {:?}",
        a, b
      )),
    }
  } else {
    Err(format!("nanoid! expected 2 args, got: {:?}", xs))
  }
}

// cheap way creating hex color
#[no_mangle]
pub fn rand_hex_color(_xs: Vec<Edn>) -> Result<Edn, String> {
  let mut rng = rand::thread_rng();
  let y: u32 = rng.gen();
  Ok(Edn::str(format!("#{:06x}", y >> 8)))
}
