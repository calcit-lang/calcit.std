ns app.main $ :require
  calcit.std.process :refer $ stream!

let
    task-ref $ atom nil
  reset! task-ref $ stream!
    [] |sh |-c "|printf 'process-started\\n'; exec sleep 5"
    fn (event)
      println event
      &ffi-task-cancel @task-ref :smoke-complete
      , &unit
    , (%none)
  println |process-stream-started
