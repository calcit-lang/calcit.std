ns app.main $ :require
  calcit.std.process :refer $ on-ctrl-c

let
    task-ref $ atom nil
  reset! task-ref $ on-ctrl-c $ fn ()
    println |ctrl-c-received
    .cancel-with @task-ref :smoke-complete
    , &unit
  println |ctrl-c-ready
