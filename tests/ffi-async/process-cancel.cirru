ns app.main $ :require
  calcit.std.process :refer $ stream!
  calcit.std.time :refer $ set-timeout

let
    task $ stream!
      [] |sh |-c "|printf 'process-started\\n'; exec sleep 5"
      fn (event)
        println event
        , &unit
      , (%none)
  set-timeout 100 $ fn ()
    .cancel-with task :smoke-complete
    , &unit
  println |process-stream-started
