ns app.main $ :require
  calcit.std.time :refer $ set-interval set-timeout

let
    task $ set-interval 10 $ fn ()
      println |interval-fired
      , &unit
  set-timeout 30 $ fn ()
    .cancel-with task :smoke-complete
    , &unit
  println |interval-started
