
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.test/main!) (:reload-fn |calcit.std.test/reload!)
    :modules $ []
    :version |0.0.6
  :files $ {}
    |calcit.std.test.date $ {}
      :ns $ quote
        ns calcit.std.test.date $ :require
          calcit.std.date :refer $ parse-time format-time get-time!
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"%%%% test date")
            println $ get-time!
            echo |time: $ format-time (get-time!) "|%Y-%m-%d %H:%M:%S %z"
            assert= 1417176009000 $ parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"
            assert= "|2014-11-28 12:00:09 +0000" $ format-time 1417176009000 "|%Y-%m-%d %H:%M:%S %z"
    |calcit.std.test.json $ {}
      :ns $ quote
        ns calcit.std.test.json $ :require
          calcit.std.json :refer $ parse-json stringify-json
      :defs $ {}
        |main! $ quote
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
        |slurp-cirru-edn $ quote
          defmacro slurp-cirru-edn (file)
            with-cpu-time $ stringify-json
              first $ with-cpu-time
                parse-cirru $ read-file file
              , true
        |try-large-json $ quote
          defn try-large-json () $ slurp-cirru-edn |/Users/chen/repo/calcit-lang/apis/docs/apis.cirru
    |calcit.std.test.rand $ {}
      :ns $ quote
        ns calcit.std.test.rand $ :require
          calcit.std.rand :refer $ rand rand-int rand-shift rand-nth rand-between nanoid!
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"%%%%%% test random")
            assert-detect identity $ <= 0
              index-of (range 10)
                rand-nth $ range 10
            assert= nil $ rand-nth ([])
            assert= nil $ ;nil anything
            ;
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
            ;
            println "\"%%%% test id"
            assert= 9 $ count (nanoid! 9)
            assert= |aaaaa $ nanoid! 5 |a
    |calcit.std.regex $ {}
      :ns $ quote
        ns calcit.std.regex $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |re-find-all $ quote
          defn re-find-all (s pattern)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"re_find_all" s pattern
        |re-matches $ quote
          defn re-matches (s pattern)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"re_matches" s pattern
        |re-find-index $ quote
          defn re-find-index (s pattern)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"re_find_index" s pattern
        |re-find $ quote
          defn re-find (s pattern)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"re_find" s pattern
    |calcit.std.process $ {}
      :ns $ quote
        ns calcit.std.process $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |on-ctrl-c $ quote
          defn on-ctrl-c (f)
            &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"on_ctrl_c" f
        |execute! $ quote
          defn execute! (command ? dir)
            assert "\"command in list" $ and (list? command) (every? command string?)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"execute_command" (either dir "\"./") command
    |calcit.std.fs $ {}
      :ns $ quote
        ns calcit.std.fs $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |read-dir! $ quote
          defn read-dir! (name)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_dir" name
        |write-file! $ quote
          defn write-file! (name content)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"write_file" name content
        |read-file! $ quote
          defn read-file! (name)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"read_file" name
        |path-exists? $ quote
          defn path-exists? (name)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_exists" name
    |calcit.std.test.regex $ {}
      :ns $ quote
        ns calcit.std.test.regex $ :require
          calcit.std.regex :refer $ re-matches re-find-index re-find re-find-all
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"%%%% test for regex") (println "|Test regular expression")
            assert= true $ re-matches |2 |\d
            assert= true $ re-matches |23 |\d+
            assert= false $ re-matches |a |\d
            assert= "\"4" $ re-find |a4 |\d
            assert= 1 $ re-find-index |a1 |\d
            assert= -1 $ re-find-index |aa |\d
            assert= ([] |1 |2 |3) (re-find-all |123 |\d)
            assert= ([] |123) (re-find-all |123 |\d+)
            assert= ([] |1 |2 |3) (re-find-all |1a2a3 |\d+)
            assert= ([] |1 |2 |34) (re-find-all |1a2a34 |\d+)
    |calcit.std.date $ {}
      :ns $ quote
        ns calcit.std.date $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |get-time! $ quote
          defn get-time! () $ &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"now_bang"
        |parse-time $ quote
          defn parse-time (time format)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"parse_time" time format
        |format-time $ quote
          defn format-time (time ? format)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"format_time" time format
    |calcit.std.hash $ {}
      :ns $ quote
        ns calcit.std.hash $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |md5 $ quote
          defn md5 (s)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"md5" s
    |calcit.std.json $ {}
      :ns $ quote
        ns calcit.std.json $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |stringify-json $ quote
          defn stringify-json (data ? colon?)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"stringify_json" data colon?
        |parse-json $ quote
          defn parse-json (s)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"parse_json" s
    |calcit.std.rand $ {}
      :ns $ quote
        ns calcit.std.rand $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |nanoid! $ quote
          defn nanoid! (? size chars)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"call_nanoid" size chars
        |rand $ quote
          defn rand (? from to)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand" from to
        |rand-int $ quote
          defn rand-int (? from to)
            &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"rand_int" from to
        |rand-nth $ quote
          defn rand-nth (xs)
            if (&list:empty? xs) nil $ get xs
              rand-int $ &- (&list:count xs) 1
        |rand-shift $ quote
          defn rand-shift (x y)
            &+ (&- x y)
              rand $ &* 2 y
        |rand-between $ quote
          defn rand-between (x y)
            &+ x $ rand (&- y x)
    |calcit.std.test $ {}
      :ns $ quote
        ns calcit.std.test $ :require (calcit.std.test.fs :as fs) (calcit.std.test.date :as date) (calcit.std.test.regex :as regex) (calcit.std.test.json :as json) (calcit.std.test.rand :as random)
          calcit.std.process :refer $ on-ctrl-c
          calcit.std.time :refer $ set-timeout set-interval
          calcit.std.hash :refer $ md5
      :defs $ {}
        |run-tests $ quote
          defn run-tests () (fs/main!) (json/main!) (date/main!) (regex/main!) (random/main!)
        |try-demos $ quote
          defn try-demos ()
            println $ md5 "\""
            println $ md5 "\"5"
        |try-time! $ quote
          defn try-time! ()
            set-timeout 4000 $ fn () (println "\"doing")
            set-interval 2000 $ fn () (println "\"DO Do Do")
        |main! $ quote
          defn main! () (run-tests) (try-demos)
        |try-ctrlc! $ quote
          defn try-ctrlc! () $ on-ctrl-c
            fn () $ println "\"TODO handler..."
        |reload! $ quote
          defn reload! () $ println "\"reload not handled yet"
    |calcit.std.time $ {}
      :ns $ quote
        ns calcit.std.time $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-path
      :defs $ {}
        |set-interval $ quote
          defn set-interval (t cb)
            &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"set_interval" t cb
        |set-timeout $ quote
          defn set-timeout (t cb)
            &call-dylib-edn-fn (get-dylib-path "\"/dylibs/libcalcit_std") "\"set_timeout" t cb
    |calcit.std.util $ {}
      :ns $ quote
        ns calcit.std.util $ :require
          calcit.std.$meta :refer $ calcit-dirname
      :defs $ {}
        |get-dylib-ext $ quote
          defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
        |get-dylib-path $ quote
          defn get-dylib-path (p)
            str (or-current-path calcit-dirname) p $ get-dylib-ext
        |or-current-path $ quote
          defn or-current-path (p)
            if (blank? p) "\"." p
    |calcit.std.test.fs $ {}
      :ns $ quote
        ns calcit.std.test.fs $ :require
          calcit.std.$meta :refer $ calcit-filename calcit-dirname
          calcit.std.fs :refer $ read-file! write-file! path-exists? read-dir!
          calcit.std.process :refer $ execute!
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"%%%% test for fs") (println calcit-filename calcit-dirname)
            println $ >
              count $ read-file! "\"README.md"
              , 1000
            println (path-exists? "\"README.md") (path-exists? "\"build.js")
            println $ read-dir! "\"./"
            println "\"dirs:" $ execute! ([] "\"ls")
