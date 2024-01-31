use cirru_edn::Edn;

#[no_mangle]
pub fn md5(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(s) = &args[0] {
      Ok(Edn::Str(format!("{:x}", md5::compute(&**s)).into()))
    } else {
      Err(format!("md5 expected a string, {}", &args[0]))
    }
  } else {
    Err(format!("md5 expected 1 arguement, got: {args:?}"))
  }
}
