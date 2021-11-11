use cirru_edn::Edn;
use std::sync::Arc;
use std::thread::{sleep, spawn};
use std::time;

#[no_mangle]
pub fn set_timeout(
  args: Vec<Edn>,
  handler: Arc<dyn Fn(Vec<Edn>) -> Result<Edn, String> + Send + Sync + 'static>,
  finish: Arc<dyn Fn() + Send + Sync + 'static>,
) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Number(n) = args[0] {
      spawn(move || {
        sleep(time::Duration::from_millis(n as u64));

        if let Err(e) = handler(vec![]) {
          println!("error for timeout: {}", e);
        }
        finish();
      });

      Ok(Edn::Nil)
    } else {
      Err(format!("set-timeout expected 1 number {:?}", args))
    }
  } else {
    Err(format!("set-timeout expected 1 argument {:?}", args))
  }
}

#[no_mangle]
pub fn set_interval(
  args: Vec<Edn>,
  handler: Arc<dyn Fn(Vec<Edn>) -> Result<Edn, String> + Send + Sync + 'static>,
  _finish: Arc<dyn Fn() + Send + Sync + 'static>,
) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Number(n) = args[0] {
      spawn(move || loop {
        if let Err(e) = handler(vec![]) {
          println!("error for interval: {}", e);
        }
        sleep(time::Duration::from_millis(n as u64));
      });

      Ok(Edn::Nil)
    } else {
      Err(format!("set-interval expected 1 number {:?}", args))
    }
  } else {
    Err(format!("set-interval expected 1 argument {:?}", args))
  }
}
