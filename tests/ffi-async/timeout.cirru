ns app.main $ :require
  calcit.std.time :refer $ set-timeout

set-timeout 10 $ fn ()
  println |timeout-fired
