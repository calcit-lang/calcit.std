ns app.main $ :require
  calcit.std.time :refer $ set-interval

let
    task-ref $ atom nil
  reset! task-ref $ set-interval 10 $ fn ()
    println |interval-fired
    &ffi-task-cancel @task-ref :smoke-complete
  println |interval-started
