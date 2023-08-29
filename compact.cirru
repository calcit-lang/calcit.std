
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.test/main!) (:reload-fn |calcit.std.test/reload!) (:version |0.2.0-a2)
    :modules $ []
  :entries $ {}
  :files $ {}
    |calcit.std.date $ %{} :FileEntry
      :defs $ {}
        |Date $ %{} :CodeEntry (:doc |)
          :code $ quote
            defrecord! Date (:now get-time!) (:parse parse-time) (:timestamp get-timestamp) (:add add-duration) (:format format-time) (:from-ymd from-ymd) (:from-ywd from-ywd) (:extract extract-time)
        |add-duration $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn add-duration (date n k)
              %:: Date :date $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"add_duration" (nth date 1) n k
        |extract-time $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn extract-time (x)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"extract_time" $ nth x 1
        |format-time $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn format-time (time ? format)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"format_time" (nth time 1) format
        |from-ymd $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn from-ymd (y m d)
              tag-match
                &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"from_ymd" y m d
                (:single d) (%:: Date :date d)
                (:ambiguous a b)
                  raise $ str "\"ambiguous: " a "\" " b
                (:none) (raise "\"cannot construct")
                _ $ raise "\"unreachable!"
        |from-ywd $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn from-ywd (y w d)
              tag-match
                &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"from_ywd" y w d
                (:single d) (%:: Date :date d)
                (:ambiguous a b)
                  raise $ str "\"ambiguous: " a "\" " b
                (:none) (raise "\"cannot construct")
                _ $ raise "\"unreachable!"
        |get-time! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-time! () $ %:: Date :date
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"now_bang"
        |get-timestamp $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-timestamp (date)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"get_timestamp" $ nth date 1
        |parse-time $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn parse-time (time format)
              %:: Date :date $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"parse_time" time format
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.date $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.fs $ %{} :FileEntry
      :defs $ {}
        |append-file! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn append-file! (name content)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"append_file" name content
        |check-write-file! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn check-write-file! (name content)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"check_write_file" name content
        |create-dir! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn create-dir! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"create_dir" name
        |create-dir-all! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn create-dir-all! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"create_dir_all" name
        |glob! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn glob! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"glob_call" name
        |path-exists? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn path-exists? (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_exists" name
        |read-dir! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn read-dir! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_dir" name
        |read-file! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn read-file! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_file" name
        |read-file-by-line! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn read-file-by-line! (name cb)
              &blocking-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_file_by_line" name cb
        |rename! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rename! (from to)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rename_path" from to
        |walk-dir! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn walk-dir! (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"walk_dir" name
        |write-file! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn write-file! (name content)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"write_file" name content
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.fs $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.hash $ %{} :FileEntry
      :defs $ {}
        |md5 $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn md5 (s)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"md5" s
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.hash $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.json $ %{} :FileEntry
      :defs $ {}
        |parse-json $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn parse-json (s)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"parse_json" s
        |stringify-json $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn stringify-json (data ? colon?)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"stringify_json" data colon?
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.json $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.path $ %{} :FileEntry
      :defs $ {}
        |join-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn join-path (& xs)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"join_path" & xs
        |path-basename $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn path-basename (x)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_basename" x
        |path-dirname $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn path-dirname (x)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_dirname" x
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.path $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.process $ %{} :FileEntry
      :defs $ {}
        |execute! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn execute! (command ? dir)
              assert "\"command in list" $ and (list? command) (every? command string?)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"execute_command" (either dir "\"./") command
        |on-ctrl-c $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn on-ctrl-c (f)
              &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"on_ctrl_c" f
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.process $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.rand $ %{} :FileEntry
      :defs $ {}
        |nanoid! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn nanoid! (? size chars)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"call_nanoid" size chars
        |rand $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand (? from to)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand" from to
        |rand-between $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-between (x y)
              &+ x $ rand (&- y x)
        |rand-hex-color! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-hex-color! () $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand_hex_color"
        |rand-int $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-int (? from to)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand_int" from to
        |rand-nth $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-nth (xs)
              if (&list:empty? xs) nil $ get xs
                rand-int $ &- (&list:count xs) 1
        |rand-shift $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-shift (x y)
              &+ (&- x y)
                rand $ &* 2 y
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.rand $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.test $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (run-tests) (try-demos)
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ println "\"reload not handled yet"
        |run-tests $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn run-tests () (fs/main!) (json/main!) (date/main!) (random/main!) (test-path)
        |test-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn test-path ()
              assert= |a/b $ join-path |a |b
              assert= |a $ join-path |a
              assert= |a/b/c $ join-path |a |b |c
              assert= |a/b $ path-dirname "\"a/b/c"
              assert= |c $ path-basename "\"a/b/c"
        |try-ctrlc! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-ctrlc! () $ on-ctrl-c
              fn () $ println "\"TODO handler..."
        |try-demos $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-demos ()
              println $ md5 "\""
              println $ md5 "\"5"
        |try-time! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-time! ()
              set-timeout 4000 $ fn () (println "\"doing")
              set-interval 2000 $ fn () (println "\"DO Do Do")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test $ :require (calcit.std.test.fs :as fs) (calcit.std.test.date :as date) (calcit.std.test.json :as json) (calcit.std.test.rand :as random)
            calcit.std.process :refer $ on-ctrl-c
            calcit.std.time :refer $ set-timeout set-interval
            calcit.std.hash :refer $ md5
            calcit.std.path :refer $ join-path path-dirname path-basename
    |calcit.std.test.date $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"%%%% test date")
              println $ get-time!
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
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ main!
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.date $ :require
            calcit.std.date :refer $ parse-time format-time get-time! extract-time from-ymd from-ywd add-duration Date get-timestamp
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
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.fs $ :require
            calcit.std.$meta :refer $ calcit-filename calcit-dirname
            calcit.std.fs :refer $ read-file! append-file! write-file! path-exists? read-dir! create-dir! create-dir-all! rename! check-write-file! walk-dir! glob! read-file-by-line!
            calcit.std.process :refer $ execute!
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
        |slurp-cirru-edn $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro slurp-cirru-edn (file)
              with-cpu-time $ stringify-json
                first $ with-cpu-time
                  parse-cirru $ read-file file
                , true
        |try-large-json $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn try-large-json () $ slurp-cirru-edn |/Users/chen/repo/calcit-lang/apis/docs/apis.cirru
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.json $ :require
            calcit.std.json :refer $ parse-json stringify-json
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
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.test.rand $ :require
            calcit.std.rand :refer $ rand rand-int rand-shift rand-nth rand-between nanoid! rand-hex-color!
    |calcit.std.time $ %{} :FileEntry
      :defs $ {}
        |set-interval $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn set-interval (t cb)
              &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"set_interval" t cb
        |set-timeout $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn set-timeout (t cb)
              &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"set_timeout" t cb
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.time $ :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    |calcit.std.util $ %{} :FileEntry
      :defs $ {}
        |get-dylib-ext $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
        |get-dylib-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-dylib-path (p)
              str (or-current-path calcit-dirname) p $ get-dylib-ext
        |or-current-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn or-current-path (p)
              if (blank? p) "\"." p
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns calcit.std.util $ :require
            calcit.std.$meta :refer $ calcit-dirname
