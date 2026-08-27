ns app.main $ :require
  calcit.std.process :refer $ on-ctrl-c

let
    task-ref $ atom nil
  reset! task-ref $ on-ctrl-c $ fn ()
    println |ctrl-c-received
    &ffi-task-cancel @task-ref :smoke-complete
  println |ctrl-c-ready
