ns app.main $ :require
  calcit.std.process :refer $ on-ctrl-c
  calcit.std.time :refer $ set-timeout

let
    task $ on-ctrl-c $ fn ()
      println |ctrl-c-received
      , &unit
  set-timeout 2000 $ fn ()
    .cancel-with task :smoke-complete
    , &unit
  println |ctrl-c-ready
