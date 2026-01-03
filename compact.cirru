
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.test/main!) (:reload-fn |calcit.std.test/reload!) (:version |0.2.6)
    :modules $ []
  :entries $ {}
  :files $ {}
    |calcit.std.date $ %{} :FileEntry
      :defs $ {}
        |Date $ %{} :CodeEntry (:doc "|Date record type wrapping timestamps. Provides static methods: :now (current time), :parse (parse string), :timestamp (get timestamp), :add (add duration), :format (format output).")
          :code $ quote
            defrecord! Date (:now get-time!) (:parse parse-time) (:timestamp get-timestamp) (:add add-duration) (:format format-time) (:from-ymd from-ymd) (:from-ywd from-ywd) (:extract extract-time)
          :examples $ []
        |add-duration $ %{} :CodeEntry (:doc "|Add duration to Date object. Args: date object, numeric value, time unit (:days, :hours, :minutes, :seconds, etc).")
          :code $ quote
            defn add-duration (date n k)
              %:: Date :date $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"add_duration" (nth date 1) n k
          :examples $ []
            quote $ add-duration (get-time!) 7 :days
        |extract-time $ %{} :CodeEntry (:doc "|Extract time components from Date object. Returns a Map with :year, :month, :day, :hour, :minute, :second fields.")
          :code $ quote
            defn extract-time (x)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"extract_time" $ nth x 1
          :examples $ []
            quote $ extract-time (get-time!)
        |format-time $ %{} :CodeEntry (:doc "|Format Date object to string. Optional second parameter specifies format (default ISO format).")
          :code $ quote
            defn format-time (time ? format)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"format_time" (nth time 1) format
          :examples $ []
            quote $ format-time (get-time!) |%Y-%m-%d
        |from-ymd $ %{} :CodeEntry (:doc "|Create Date object from year, month, day. Args: year, month (1-12), day (1-31).")
          :code $ quote
            defn from-ymd (y m d)
              tag-match
                &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"from_ymd" y m d
                (:single d) (%:: Date :date d)
                (:ambiguous a b)
                  raise $ str "\"ambiguous: " a "\" " b
                (:none) (raise "\"cannot construct")
                _ $ raise "\"unreachable!"
          :examples $ []
            quote $ from-ymd 2024 1 15
        |from-ywd $ %{} :CodeEntry (:doc "|Create Date object from year, week, day. Args: year, week (1-53), day (1-7, 1=Monday).")
          :code $ quote
            defn from-ywd (y w d)
              tag-match
                &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"from_ywd" y w d
                (:single d) (%:: Date :date d)
                (:ambiguous a b)
                  raise $ str "\"ambiguous: " a "\" " b
                (:none) (raise "\"cannot construct")
                _ $ raise "\"unreachable!"
          :examples $ []
            quote $ from-ywd 2024 1 1
        |get-time! $ %{} :CodeEntry (:doc "|Get current system time as a Date object.")
          :code $ quote
            defn get-time! () $ %:: Date :date
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"now_bang"
          :examples $ []
            quote $ get-time!
        |get-timestamp $ %{} :CodeEntry (:doc "|Get timestamp (milliseconds) from Date object.")
          :code $ quote
            defn get-timestamp (date)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"get_timestamp" $ nth date 1
          :examples $ []
            quote $ get-timestamp (get-time!)
        |parse-time $ %{} :CodeEntry (:doc "|Parse time string to Date object. Args: time string, format string (e.g. \"%Y-%m-%d %H:%M:%S %z\").")
          :code $ quote
            defn parse-time (time format)
              %:: Date :date $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"parse_time" time format
          :examples $ []
            quote $ parse-time "|2024-01-01 12:00:00 +00:00" "|%Y-%m-%d %H:%M:%S %z"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.date $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.fs $ %{} :FileEntry
      :defs $ {}
        |append-file! $ %{} :CodeEntry (:doc "|Append content to end of file. Args: file path, content string.")
          :code $ quote
            defn append-file! (name content)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"append_file" name content
          :examples $ []
            quote $ append-file! |log.txt | "New log entry"
        |check-write-file! $ %{} :CodeEntry (:doc "|Check if file exists, write content if not exists. Args: file path, content string.")
          :code $ quote
            defn check-write-file! (name content)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"check_write_file" name content
          :examples $ []
        |create-dir! $ %{} :CodeEntry (:doc "|Create a directory at the given path. Fails if parent directory does not exist.")
          :code $ quote
            defn create-dir! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"create_dir" name
          :examples $ []
            quote $ create-dir! |new-folder
        |create-dir-all! $ %{} :CodeEntry (:doc "|Create a directory and all necessary parent directories.")
          :code $ quote
            defn create-dir-all! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"create_dir_all" name
          :examples $ []
            quote $ create-dir-all! |path/to/nested/dir
        |glob! $ %{} :CodeEntry (:doc "|Find files matching the glob pattern. Returns a list of matching file paths.")
          :code $ quote
            defn glob! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"glob_call" name
          :examples $ []
            quote $ glob! | src/**/*.rs
        |path-exists? $ %{} :CodeEntry (:doc "|Check if a file or directory exists at the given path. Returns boolean.")
          :code $ quote
            defn path-exists? (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_exists" name
          :examples $ []
            quote $ path-exists? |file.txt
        |read-dir! $ %{} :CodeEntry (:doc "|Read directory contents and return a list of file/directory names.")
          :code $ quote
            defn read-dir! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_dir" name
          :examples $ []
            quote $ read-dir! |src
        |read-file! $ %{} :CodeEntry (:doc "|Read entire file content as a string. Args: file path.")
          :code $ quote
            defn read-file! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_file" name
          :examples $ []
            quote $ read-file! |example.txt
        |read-file-by-line! $ %{} :CodeEntry (:doc "|Read file line by line and call the callback function for each line. Args: file path, callback function.")
          :code $ quote
            defn read-file-by-line! (name cb)
              &blocking-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_file_by_line" name cb
          :examples $ []
            quote $ read-file-by-line! |file.txt
              fn (line) (println line)
        |rename! $ %{} :CodeEntry (:doc "|Rename or move a file/directory. Args: source path, destination path.")
          :code $ quote
            defn rename! (from to)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rename_path" from to
          :examples $ []
            quote $ rename! |old.txt |new.txt
        |walk-dir! $ %{} :CodeEntry (:doc "|Recursively walk through directory and return all file paths.")
          :code $ quote
            defn walk-dir! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"walk_dir" name
          :examples $ []
        |write-file! $ %{} :CodeEntry (:doc "|Write content to file (overwrite). Args: file path, content string.")
          :code $ quote
            defn write-file! (name content)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"write_file" name content
          :examples $ []
            quote $ write-file! |output.txt | "Hello, World!"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.fs $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.hash $ %{} :FileEntry
      :defs $ {}
        |md5 $ %{} :CodeEntry (:doc "|Calculate MD5 hash of a string. Returns 32-character hexadecimal string.")
          :code $ quote
            defn md5 (s)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"md5" s
          :examples $ []
            quote $ md5 |hello
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.hash $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.json $ %{} :FileEntry
      :defs $ {}
        |parse-json $ %{} :CodeEntry (:doc "|Parse JSON string to Calcit data structures. String keys remain as strings, keyword keys become keywords.")
          :code $ quote
            defn parse-json (s)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"parse_json" s
          :examples $ []
            quote $ parse-json "|{\"a\": [1, 2], \":b\": 3}"
        |stringify-json $ %{} :CodeEntry (:doc "|Serialize Calcit data structures to JSON string. Second parameter colon? when true converts keywords to strings with colon prefix.")
          :code $ quote
            defn stringify-json (data ? colon?)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"stringify_json" data colon?
          :examples $ []
            quote $ stringify-json ([] 1 2 3)
            quote $ stringify-json
              {} (:a 1) (:b 2)
              , true
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.json $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.path $ %{} :FileEntry
      :defs $ {}
        |join-path $ %{} :CodeEntry (:doc "|Join multiple path segments into a complete path, handling separators automatically.")
          :code $ quote
            defn join-path (& xs)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"join_path" & xs
          :examples $ []
            quote $ join-path |/home |user |documents |file.txt
        |path-basename $ %{} :CodeEntry (:doc "|Get the filename part of a path (the last path component).")
          :code $ quote
            defn path-basename (x)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_basename" x
          :examples $ []
            quote $ path-basename |/home/user/file.txt
        |path-dirname $ %{} :CodeEntry (:doc "|Get the directory part of a path (excluding the last component).")
          :code $ quote
            defn path-dirname (x)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_dirname" x
          :examples $ []
            quote $ path-dirname |/home/user/file.txt
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.path $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.process $ %{} :FileEntry
      :defs $ {}
        |execute! $ %{} :CodeEntry (:doc "|Execute a shell command. Args: command as list of strings, optional working directory. Returns output or error.")
          :code $ quote
            defn execute! (command ? dir)
              assert "\"command in list" $ and (list? command) (every? command string?)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"execute_command" (either dir "\"./") command
          :examples $ []
            quote $ execute! ([] |ls | -la)
        |on-ctrl-c $ %{} :CodeEntry (:doc "|Register a callback function to handle Ctrl+C signal.")
          :code $ quote
            defn on-ctrl-c (f)
              &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"on_ctrl_c" f
          :examples $ []
            quote $ on-ctrl-c
              fn () $ println | Exiting...
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.process $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.rand $ %{} :FileEntry
      :defs $ {}
        |nanoid! $ %{} :CodeEntry (:doc "|Generate nanoid string. Optional: size (default 21), chars (character set).")
          :code $ quote
            defn nanoid! (? size chars)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"call_nanoid" size chars
          :examples $ []
            quote $ nanoid!
            quote $ nanoid! 10
        |rand $ %{} :CodeEntry (:doc "|Generate random float. No args: [0, 1), one arg: [0, n), two args: [from, to).")
          :code $ quote
            defn rand (? from to)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand" from to
          :examples $ []
            quote $ rand
            quote $ rand 10 100
        |rand-between $ %{} :CodeEntry (:doc "|Generate random float between from and to.")
          :code $ quote
            defn rand-between (x y)
              &+ x $ rand (&- y x)
          :examples $ []
            quote $ rand-between 10 20
        |rand-hex-color! $ %{} :CodeEntry (:doc "|Generate random hexadecimal color string in format #rrggbb.")
          :code $ quote
            defn rand-hex-color! () $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand_hex_color"
          :examples $ []
            quote $ rand-hex-color!
        |rand-int $ %{} :CodeEntry (:doc "|Generate random integer. No args: large range, one arg: [0, n), two args: [from, to).")
          :code $ quote
            defn rand-int (? from to)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand_int" from to
          :examples $ []
            quote $ rand-int 100
        |rand-nth $ %{} :CodeEntry (:doc "|Randomly select one element from a list.")
          :code $ quote
            defn rand-nth (xs)
              if (&list:empty? xs) nil $ get xs
                rand-int $ &- (&list:count xs) 1
          :examples $ []
            quote $ rand-nth ([] 1 2 3 4 5)
        |rand-shift $ %{} :CodeEntry (:doc "|Generate random float within center ± shift range.")
          :code $ quote
            defn rand-shift (x y)
              &+ (&- x y)
                rand $ &* 2 y
          :examples $ []
            quote $ rand-shift 10 2
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.rand $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.test $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (run-tests) (try-demos)
          :examples $ []
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () (run-tests) (println "\"reload not handled yet")
          :examples $ []
        |run-tests $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn run-tests () (fs/main!) (json/main!) (date/main!) (random/main!) (test-path)
          :examples $ []
        |test-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn test-path ()
              assert= |a/b $ join-path |a |b
              assert= |a $ join-path |a
              assert= |a/b/c $ join-path |a |b |c
              assert= |a/b $ path-dirname "\"a/b/c"
              assert= |c $ path-basename "\"a/b/c"
          :examples $ []
        |try-ctrlc! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-ctrlc! () $ on-ctrl-c
              fn () $ println "\"TODO handler..."
          :examples $ []
        |try-demos $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-demos ()
              println $ md5 "\""
              println $ md5 "\"5"
          :examples $ []
        |try-time! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-time! ()
              set-timeout 4000 $ fn () (println "\"doing")
              set-interval 2000 $ fn () (println "\"DO Do Do")
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test $ :require (calcit.std.test.fs :as fs) (calcit.std.test.date :as date) (calcit.std.test.json :as json) (calcit.std.test.rand :as random)
            calcit.std.process :refer $ on-ctrl-c
            calcit.std.time :refer $ set-timeout set-interval
            calcit.std.hash :refer $ md5
            calcit.std.path :refer $ join-path path-dirname path-basename
        :examples $ []
    |calcit.std.test.date $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println &newline "\"%%%% test date")
              println "\"GET TIME" $ get-time!
              echo |time: $ format-time (get-time!) "|%Y-%m-%d %H:%M:%S %z"
              assert= 1417176009000 $ get-timestamp (parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z")
              ; assert= "|2014-11-28 12:00:09 +0000" $ format-time (%:: Date :date 1417176009000) "|%Y-%m-%d %H:%M:%S %z"
              w-log $ extract-time (get-time!)
              w-log $ from-ymd 2021 11 11
              w-log $ from-ywd 2021 45 6
              w-log $ .format (from-ywd 2022 1 2) "\"%Y-%m-%d %H-%M"
              let
                  d $ from-ymd 2021 11 11
                do (println "\"single....")
                  ; assert= "\"2021-11-12" $ -> d (.add 1 :days) (format-time "\"%Y-%m-%d")
                  ; assert= "\"2021-11-11 01-00" $ -> d (.add 1 :hours) (format-time "\"%Y-%m-%d %H-%M")
                  ; assert= "\"2021-11-11 00-01" $ -> d (.add 1 :minutes) (format-time "\"%Y-%m-%d %H-%M")
                  ; assert= "\"2021-11-10 16-00" $ -> d (.add -8 :hours) (format-time "\"%Y-%m-%d %H-%M")
              println $ ->
                  :now Date
                .add 1 :hours
                .add 2 :minutes
                .format "\"%Y-%m-%d %H-%M"
          :examples $ []
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ main!
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.date $ :require
            calcit.std.date :refer $ parse-time format-time get-time! extract-time from-ymd from-ywd add-duration Date get-timestamp
        :examples $ []
    |calcit.std.test.fs $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"%%%% test for fs") (println calcit-filename calcit-dirname)
              println $ >
                count $ read-file! "\"README.md"
                , 1000
              let
                  *c $ atom 0
                read-file-by-line! "\"README.md" $ fn (line) (; println "\"readling line:" line) (swap! *c inc)
                println "\"lines" @*c
              println (path-exists? "\"README.md") (path-exists? "\"build.js")
              println $ read-dir! "\"./"
              println "\"dirs:" $ execute! ([] "\"ls")
              println "\"all paths size:" $ count (walk-dir! "\"target")
              println "\"rs files:" $ glob! "\"src/*.rs"
              create-dir! "\"target/dir1"
              rename! "\"target/dir1" "\"target/dir4"
              create-dir-all! "\"target/dir2/dir3"
              check-write-file! "\"target/dir8/dir9/file.text" "\"TODO"
              append-file! "\"target/dir8/dir9/file.text" $ str &newline "\"NEWLINE TODO"
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.fs $ :require
            calcit.std.$meta :refer $ calcit-filename calcit-dirname
            calcit.std.fs :refer $ read-file! append-file! write-file! path-exists? read-dir! create-dir! create-dir-all! rename! check-write-file! walk-dir! glob! read-file-by-line!
            calcit.std.process :refer $ execute!
        :examples $ []
    |calcit.std.test.json $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"%%%% test for json")
              println $ stringify-json ([] 1 2 3 :a)
              assert= (parse-json "|{\"a\": [1, 2], \":b\": 3}")
                {}
                  |a $ [] 1 2
                  :b 3
              &let
                data $ {} (|a 1) (:b 2) (:c :k)
                assert= data $ parse-json
                  w-log $ stringify-json data true
              &let
                data $ {} (|a 1) (:b 2) (:c :k)
                assert=
                  parse-json $ stringify-json data
                  {} (|a 1) (|b 2) (|c |k)
          :examples $ []
        |slurp-cirru-edn $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro slurp-cirru-edn (file)
              with-cpu-time $ stringify-json
                first $ with-cpu-time
                  parse-cirru $ read-file file
                , true
          :examples $ []
        |try-large-json $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-large-json () $ slurp-cirru-edn |/Users/chen/repo/calcit-lang/apis/docs/apis.cirru
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.json $ :require
            calcit.std.json :refer $ parse-json stringify-json
        :examples $ []
    |calcit.std.test.rand $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"%%%%%% test random")
              assert-detect identity $ <= 0
                index-of (range 10)
                  rand-nth $ range 10
              assert= nil $ rand-nth ([])
              assert= nil $ ;nil anything
              assert-detect identity $ <= 0 (rand) 100
              assert-detect identity $ <= 0 (rand 10) 10
              assert-detect identity $ <= 20 (rand 20 30) 30
              assert "|try .rand-shift" $ &let
                x $ rand-shift 10 5
                and (>= x 5) (<= x 15)
              assert "|try .rand-between" $ &let
                x $ rand-between 10 5
                and (>= x 5) (<= x 10)
              assert-detect identity $ <= 0 (rand-int) 100
              assert-detect identity $ <= 0 (rand-int 10) 10
              assert-detect identity $ <= 20 (rand-int 20 30) 30
              println "\"%%%% test id"
              assert= 9 $ count (nanoid! 9)
              assert= |aaaaa $ nanoid! 5 |a
              println $ rand-hex-color!
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.rand $ :require
            calcit.std.rand :refer $ rand rand-int rand-shift rand-nth rand-between nanoid! rand-hex-color!
        :examples $ []
    |calcit.std.time $ %{} :FileEntry
      :defs $ {}
        |set-interval $ %{} :CodeEntry (:doc "|Execute function repeatedly at intervals. Args: interval in milliseconds, function to repeat.")
          :code $ quote
            defn set-interval (t cb)
              &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"set_interval" t cb
          :examples $ []
            quote $ set-interval 1000
              fn () $ println |tick
        |set-timeout $ %{} :CodeEntry (:doc "|Execute function after delay. Args: delay in milliseconds, function to execute.")
          :code $ quote
            defn set-timeout (t cb)
              &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"set_timeout" t cb
          :examples $ []
            quote $ set-timeout 1000
              fn () $ println |timeout
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.time $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
        :examples $ []
    |calcit.std.util $ %{} :FileEntry
      :defs $ {}
        |get-dylib-ext $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
          :examples $ []
        |get-dylib-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-dylib-path (p)
              str (or-current-path calcit-dirname) p $ get-dylib-ext
          :examples $ []
        |or-current-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn or-current-path (p)
              if (blank? p) "\"." p
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.util $ :require
            calcit.std.$meta :refer $ calcit-dirname
        :examples $ []
