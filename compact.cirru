
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.test/main!) (:reload-fn |calcit.std.test/reload!)
    :modules $ []
    :version |0.0.1
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
        |try-large-json $ quote
          defn try-large-json () $ slurp-cirru-edn |/Users/chen/repo/calcit-lang/apis/docs/apis.cirru
        |slurp-cirru-edn $ quote
          defmacro slurp-cirru-edn (file)
            with-cpu-time $ stringify-json
              first $ with-cpu-time
                parse-cirru $ read-file file
              , true
    |calcit.std.regex $ {}
      :ns $ quote
        ns calcit.std.regex $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-ext or-current-path
      :defs $ {}
        |re-matches $ quote
          defn re-matches (s pattern)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"re_matches" s pattern
        |re-find $ quote
          defn re-find (s pattern)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"re_find" s pattern
        |re-find-index $ quote
          defn re-find-index (s pattern)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"re_find_index" s pattern
        |re-find-all $ quote
          defn re-find-all (s pattern)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"re_find_all" s pattern
    |calcit.std.process $ {}
      :ns $ quote
        ns calcit.std.process $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-ext or-current-path
      :defs $ {}
        |execute! $ quote
          defn execute! (command ? dir)
            assert "\"command in list" $ and (list? command) (every? command string?)
            &call-dylib:str-vec-str->tuple-str2
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"execute_command" (either dir "\"./") command
    |calcit.std.fs $ {}
      :ns $ quote
        ns calcit.std.fs $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-ext or-current-path
      :defs $ {}
        |read-dir! $ quote
          defn read-dir! (name)
            &call-dylib:str->vec-str
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"read_dir" name
        |write-file! $ quote
          defn write-file! (name content)
            &call-dylib:str:str->str
              str calcit-dirname "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"write_file" name content
        |read-file! $ quote
          defn read-file! (name)
            &call-dylib:str->str
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"read_file" name
        |path-exists? $ quote
          defn path-exists? (name)
            &call-dylib:str->bool
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"path_exists" name
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
          calcit.std.util :refer $ get-dylib-ext or-current-path
      :defs $ {}
        |parse-time $ quote
          defn parse-time (time format)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"parse_time" time format
        |format-time $ quote
          defn format-time (time ? format)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"format_time" time format
        |get-time! $ quote
          defn get-time! () $ &call-dylib:edn
            str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
            , "\"now_bang"
    |calcit.std.json $ {}
      :ns $ quote
        ns calcit.std.json $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.util :refer $ get-dylib-ext or-current-path
      :defs $ {}
        |parse-json $ quote
          defn parse-json (s)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"parse_json" s
        |stringify-json $ quote
          defn stringify-json (data ? colon?)
            &call-dylib:edn
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"stringify_json" data colon?
    |calcit.std.test $ {}
      :ns $ quote
        ns calcit.std.test $ :require (calcit.std.test.fs :as fs) (calcit.std.test.date :as date) (calcit.std.test.regex :as regex) (calcit.std.test.json :as json)
      :defs $ {}
        |main! $ quote
          defn main! () $ run-tests
        |reload! $ quote
          defn reload! $
        |run-tests $ quote
          defn run-tests () (fs/main!) (json/main!) (date/main!) (regex/main!)
    |calcit.std.util $ {}
      :ns $ quote (ns calcit.std.util)
      :defs $ {}
        |get-dylib-ext $ quote
          defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
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
            println $ execute! ([] "\"ls")
