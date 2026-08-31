pub fn md5(value: &str) -> String {
  format!("{:x}", md5::compute(value))
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn hashes_utf8_input_to_lowercase_hex() {
    assert_eq!(md5("hello"), "5d41402abc4b2a76b9719d911017c592");
    assert_eq!(md5("你好"), "7eca689f0d3389d9dea66ae112e5cfd7");
  }
}
