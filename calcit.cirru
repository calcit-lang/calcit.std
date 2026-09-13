
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |calcit.std
  :entries $ {}
    :default $ {} (:description |)
      :init-fn 'calcit.std.test/main!
      :mode :native
      :reload-fn 'calcit.std.test/reload!
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
    :stream-process $ {} (:description |)
      :init-fn 'calcit.std.test.process/main!
      :mode :native
      :reload-fn 'calcit.std.test.process/main!
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'calcit.std.date $ %{} 'FileEntry
      :defs $ {}
        'Date0 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct Date0 (:date 'Number)
          :examples $ []
          :schema $ :: 'Enum
        'add-duration $ %{} 'CodeEntry
          :doc "|Add duration to Date object. Args: date object, numeric value, time unit (:days, :hours, :minutes, :seconds, etc). Example: (add-duration (get-time!) 7 :days)"
          :code $ quote $ defn add-duration (date n k)
            %{} Date0 $ :date $ &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |add_duration (:date date) n k
          :examples $ [] $ quote
            add-duration (get-time!) 7 :days
          :schema $ :: 'Fn $ {}
            :return 'calcit.std.date/Date0
            :args $ [] 'calcit.std.date/Date0 'Number 'Tag
            :features $ #{} :js-ffi
        'extract-time $ %{} 'CodeEntry
          :doc "|Extract time components from Date object. Returns a Map with :year, :month, :day, :hour, :minute, :second fields. Example: (extract-time (get-time!))"
          :code $ quote $ defn extract-time (x)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |extract_time $ :date x
          :examples $ [] $ quote
            extract-time $ get-time!
          :schema $ :: 'Fn $ {}
            :args $ [] 'calcit.std.date/Date0
            :features $ #{} :js-ffi
            :return $ :: 'Map 'Tag 'Number
        'format-time $ %{} 'CodeEntry
          :doc "|Format Date object to string. The optional format is Option<String>; %none uses ISO format, for example (format-time (get-time!) (%some \"|%Y-%m-%d\"))."
          :code $ quote $ defn format-time (time format)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |format_time (:date time) format
          :examples $ [] $ quote
            format-time (get-time!) (%some |%Y-%m-%d)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'calcit.std.date/Date0 $ :: 'Option 'String
        'from-ymd $ %{} 'CodeEntry
          :doc "|Create Date object from year, month, day. Args: year, month (1-12), day (1-31). Example: (from-ymd 2024 1 15)"
          :code $ quote $ defn from-ymd (y m d)
            match
              &call-dylib-edn
                get-dylib-path |/dylibs/libcalcit_std
                , |from_ymd y m d
              (:single d)
                %{} Date0 $ :date d
              (:ambiguous a b)
                raise $ str "|ambiguous: " a "| " b
              (:none)
                raise "|cannot construct"
              _ $ raise |unreachable!
          :examples $ [] $ quote (from-ymd 2024 1 15)
          :schema $ :: 'Fn $ {}
            :return 'calcit.std.date/Date0
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'from-ywd $ %{} 'CodeEntry
          :doc "|Create Date object from year, week, day. Args: year, week (1-53), day (1-7, 1=Monday). Example: (from-ywd 2024 1 1)"
          :code $ quote $ defn from-ywd (y w d)
            match
              &call-dylib-edn
                get-dylib-path |/dylibs/libcalcit_std
                , |from_ywd y w d
              (:single d)
                %{} Date0 $ :date d
              (:ambiguous a b)
                raise $ str "|ambiguous: " a "| " b
              (:none)
                raise "|cannot construct"
              _ $ raise |unreachable!
          :examples $ [] $ quote (from-ywd 2024 1 1)
          :schema $ :: 'Fn $ {}
            :return 'calcit.std.date/Date0
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'get-time! $ %{} 'CodeEntry
          :doc "|Get current system time as a Date object. Example: (get-time!)"
          :code $ quote $ defn get-time! ()
            Date0 :date $ &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |now_bang
          :examples $ [] $ quote (get-time!)
          :schema $ :: 'Fn $ {}
            :return 'calcit.std.date/Date0
            :args $ []
            :features $ #{} :js-ffi
        'get-timestamp $ %{} 'CodeEntry
          :doc "|Get timestamp (milliseconds) from Date object. Example: (get-timestamp (get-time!))"
          :code $ quote $ defn get-timestamp (date)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |get_timestamp $ :date date
          :examples $ [] $ quote
            get-timestamp $ get-time!
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'calcit.std.date/Date0
        'parse-time $ %{} 'CodeEntry
          :doc "|Parse time string to Date object. Args: time string, format string (e.g. %Y-%m-%d %H:%M:%S %z). Example: (parse-time \"|2024-01-01 12:00:00 +00:00\" \"|%Y-%m-%d %H:%M:%S %z\")"
          :code $ quote $ defn parse-time (time format)
            %{} Date0 $ :date $ &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |parse_time time format
          :examples $ [] $ quote
            parse-time "|2024-01-01 12:00:00 +00:00" "|%Y-%m-%d %H:%M:%S %z"
          :schema $ :: 'Fn $ {}
            :return 'calcit.std.date/Date0
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.date
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.fs $ %{} 'FileEntry
      :defs $ {}
        'append-file! $ %{} 'CodeEntry
          :doc "|Append content to end of file. Args: file path, content string. Example: (append-file! \"log.txt\" \"New log entry\")"
          :code $ quote $ defn append-file! (name content)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |append_file name content
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
        'check-write-file! $ %{} 'CodeEntry
          :doc "|Check if file exists, write content if not exists. Args: file path, content string."
          :code $ quote $ defn check-write-file! (name content)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |check_write_file name content
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
        'create-dir! $ %{} 'CodeEntry
          :doc "|Create a directory at the given path. Fails if parent directory does not exist. Example: (create-dir! \"new-folder\")"
          :code $ quote $ defn create-dir! (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |create_dir name
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'create-dir-all! $ %{} 'CodeEntry
          :doc "|Create a directory and all necessary parent directories. Example: (create-dir-all! \"path/to/nested/dir\")"
          :code $ quote $ defn create-dir-all! (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |create_dir_all name
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'glob! $ %{} 'CodeEntry
          :doc "|Find files matching the glob pattern. Returns a list of matching file paths. Example: (glob! \"src/*.rs\")"
          :code $ quote $ defn glob! (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |glob_call name
          :examples $ [] $ quote (glob! |src/**/*.rs)
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
        'path-exists? $ %{} 'CodeEntry
          :doc "|Check if a file or directory exists at the given path. Returns boolean. Example: (path-exists? \"README.md\")"
          :code $ quote $ defn path-exists? (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |path_exists name
          :examples $ [] $ quote (path-exists? |file.txt)
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'read-dir! $ %{} 'CodeEntry
          :doc "|Read directory contents and return a list of file/directory names. Example: (read-dir! \"src\")"
          :code $ quote $ defn read-dir! (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |read_dir name
          :examples $ [] $ quote (read-dir! |src)
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
        'read-file! $ %{} 'CodeEntry
          :doc "|Read entire file content as a string. Args: file path. Example: (read-file! \"README.md\")"
          :code $ quote $ defn read-file! (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |read_file name
          :examples $ [] $ quote (read-file! |README.md)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'read-file-by-line! $ %{} 'CodeEntry
          :doc "|Streams a file lazily through the blocking C-safe FFI and calls the callback once per line. The callback receives String and returns Unit. Line terminators are removed like BufRead::lines; callback failure or host closing stops reading immediately. Peak native memory is bounded by the reader buffer plus the longest line."
          :code $ quote $ defn read-file-by-line! (name cb)
            &blocking-dylib-edn-fn
              get-dylib-path |/dylibs/libcalcit_std
              , |read_file_by_line name cb
          :examples $ [] $ quote
            read-file-by-line! |Cargo.toml $ fn (line) &unit
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'String
        'rename! $ %{} 'CodeEntry
          :doc "|Rename or move a file/directory. Args: source path, destination path. Example: (rename! \"old.txt\" \"new.txt\")"
          :code $ quote $ defn rename! (from to)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |rename_path from to
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
        'walk-dir! $ %{} 'CodeEntry
          :doc "|Recursively walk through directory and return all file paths. Example: (walk-dir! \"target\")"
          :code $ quote $ defn walk-dir! (name)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |walk_dir name
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
        'write-file! $ %{} 'CodeEntry
          :doc "|Write content to file (overwrite). Args: file path, content string. Example: (write-file! \"output.txt\" \"Hello, World!\")"
          :code $ quote $ defn write-file! (name content)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |write_file name content
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.fs
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.hash $ %{} 'FileEntry
      :defs $ {} $ 'md5
        %{} 'CodeEntry
          :doc "|Calculate MD5 hash of a string. Returns 32-character hexadecimal string. Example: (md5 \"hello\")"
          :code $ quote $ defn md5 (s)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |md5 s
          :examples $ [] $ quote (md5 |hello)
          :ffi $ {} (:backend :native) (:invoke :sync) (:kind :pure-function) (:symbol |md5) (:transport :edn-buffer-v1)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.hash
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.path $ %{} 'FileEntry
      :defs $ {}
        'join-path $ %{} 'CodeEntry
          :doc "|Join multiple path segments into a complete path, handling separators automatically. Example: (join-path \"/home\" \"user\" \"documents\" \"file.txt\")"
          :code $ quote $ defn join-path (& xs)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |join_path & xs
          :examples $ [] $ quote (join-path |/home |user |documents |file.txt)
          :schema $ :: 'Fn $ {} (:rest 'String) (:return 'String)
            :args $ []
        'path-basename $ %{} 'CodeEntry
          :doc "|Get the filename part of a path (the last path component). Example: (path-basename \"/home/user/file.txt\")"
          :code $ quote $ defn path-basename (x)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |path_basename x
          :examples $ [] $ quote
            path-basename |/home/user/file.txt
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
        'path-dirname $ %{} 'CodeEntry
          :doc "|Get the directory part of a path (excluding the last component). Example: (path-dirname \"/home/user/file.txt\")"
          :code $ quote $ defn path-dirname (x)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |path_dirname x
          :examples $ [] $ quote
            path-dirname |/home/user/file.txt
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.path
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.process $ %{} 'FileEntry
      :defs $ {}
        'ProcessOutput $ %{} 'CodeEntry
          :doc "|A streamed process output event."
          :code $ quote $ defenum ProcessOutput (:stdout 'String) (:stderr 'String)
          :examples $ []
          :schema $ :: 'Enum
        'execute! $ %{} 'CodeEntry
          :doc "|Execute a command from a List<String>. The optional working directory defaults to ./; pass %some path to override it. Returns [stdout stderr]."
          :code $ quote $ defn execute! (command dir)
            assert "|command in list" $ and (list? command) (every? command string?)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |execute_command (option:unwrap-or dir |./) command
          :examples $ [] $ quote
            execute! ([] |ls |-la) (%none)
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'String) (:: 'Option 'String)
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
        'on-ctrl-c $ %{} 'CodeEntry
          :doc "|Register a callback function to handle Ctrl+C signal."
          :code $ quote $ defn on-ctrl-c (f)
            ffi:task $ &call-dylib-edn-fn
              get-dylib-path |/dylibs/libcalcit_std
              , |on_ctrl_c f
          :examples $ [] $ quote
            let
                task $ on-ctrl-c $ fn () (println |Exiting...)
              task.cancel-with :example-complete
          :schema $ :: 'Fn $ {} (:return 'FfiTask)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
        'stream! $ %{} 'CodeEntry
          :doc "|Start a process and stream tagged stdout/stderr events to callback. Runs asynchronously."
          :code $ quote $ defn stream! (command f dir)
            assert "|command in list" $ and (list? command) (every? command string?)
            ffi:task $ &call-dylib-edn-fn
              get-dylib-path |/dylibs/libcalcit_std
              , |stream_command (option:unwrap-or dir |./) command f
          :examples $ [] $ quote
            stream!
              [] |sh |-c "|printf 'out-1\\n'; sleep 0.2; printf 'err-1\\n' >&2; sleep 0.2; printf 'out-2\\n'; sleep 0.2; printf 'err-2\\n' >&2"
              fn (event)
                println |received-ProcessOutput event
              %none
          :schema $ :: 'Fn $ {} (:return 'FfiTask)
            :args $ [] (:: 'List 'String)
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'calcit.std.process/ProcessOutput
              :: 'Option 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.process
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.rand $ %{} 'FileEntry
      :defs $ {}
        'nanoid! $ %{} 'CodeEntry
          :doc "|Generate a nanoid string. Size and character set are Option values; omitted values use nanoid defaults."
          :code $ quote $ defn nanoid! (size chars)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |call_nanoid size chars
          :examples $ [] $ quote
            nanoid! (%some 10) (%none)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] (:: 'Option 'Number) (:: 'Option 'String)
            :features $ #{} :js-ffi
        'rand $ %{} 'CodeEntry
          :doc "|Generate a random float. Omitted bounds use the default range; present bounds use Option<Number>, for example (rand (%some 10) (%some 100))."
          :code $ quote $ defn rand (from to)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |rand from to
          :examples $ [] $ quote
            rand (%some 10) (%some 100)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] (:: 'Option 'Number) (:: 'Option 'Number)
            :features $ #{} :js-ffi
        'rand-between $ %{} 'CodeEntry
          :doc "|Generate random float between from and to."
          :code $ quote $ defn rand-between (x y)
            &+ x $ rand
              %some $ &- y x
              %none
          :examples $ [] $ quote (rand-between 10 20)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
        'rand-hex-color! $ %{} 'CodeEntry
          :doc "|Generate random hexadecimal color string in format #rrggbb. Example: (rand-hex-color!)"
          :code $ quote $ defn rand-hex-color! ()
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |rand_hex_color
          :examples $ [] $ quote (rand-hex-color!)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
            :features $ #{} :js-ffi
        'rand-int $ %{} 'CodeEntry
          :doc "|Generate a random integer. Omitted bounds use the default range; present bounds use Option<Number>, for example (rand-int (%some 10) (%some 100))."
          :code $ quote $ defn rand-int (from to)
            &call-dylib-edn
              get-dylib-path |/dylibs/libcalcit_std
              , |rand_int from to
          :examples $ [] $ quote
            rand-int (%some 100) (%none)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] (:: 'Option 'Number) (:: 'Option 'Number)
            :features $ #{} :js-ffi
        'rand-nth $ %{} 'CodeEntry
          :doc "|Randomly select one element from a list. Returns %none when the list is empty."
          :code $ quote $ defn rand-nth (xs)
            if (&list:empty? xs) (%none)
              get xs $ rand-int
                %some $ &list:count xs
                %none
          :examples $ [] $ quote
            rand-nth $ [] 1 2 3 4 5
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'T
            :generics $ [] 'T
            :return $ :: 'Option 'T
        'rand-shift $ %{} 'CodeEntry
          :doc "|Generate random float within center ± shift range."
          :code $ quote $ defn rand-shift (x y)
            &+ (&- x y)
              rand
                %some $ &* 2 y
                %none
          :examples $ [] $ quote (rand-shift 10 2)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.rand
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.test $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (run-tests) (try-demos)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (run-tests)
            println "|reload not handled yet"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'run-tests $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn run-tests () (fs/main!) (date/main!) (random/main!) (test-path)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'test-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn test-path ()
            do
              assert= |a/b $ join-path |a |b
              assert= |a $ join-path |a
              assert= |a/b/c $ join-path |a |b |c
              assert= |a/b $ path-dirname |a/b/c
              assert= |c $ path-basename |a/b/c
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'try-ctrlc! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn try-ctrlc! ()
            on-ctrl-c $ fn () $ println "|TODO handler..."
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'try-demos $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn try-demos ()
            println $ md5 |
            println $ md5 |5
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'try-time! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn try-time! ()
            set-timeout 4000 $ fn () $ println |doing
            set-interval 2000 $ fn () $ println "|DO Do Do"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.test
          :require
            calcit.std.test.fs :as fs
            calcit.std.test.date :as date
            calcit.std.test.rand :as random
            calcit.std.process :refer $ on-ctrl-c
            calcit.std.time :refer $ set-timeout set-interval
            calcit.std.hash :refer $ md5
            calcit.std.path :refer $ join-path path-dirname path-basename
    'calcit.std.test.date $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println &newline "|%%%% test date")
            println "|GET TIME" $ get-time!
            echo |time: $ format-time (get-time!)
              %some "|%Y-%m-%d %H:%M:%S %z"
            assert= 1417176009000 $ get-timestamp $ parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"
            w-log $ extract-time $ get-time!
            w-log $ from-ymd 2021 11 11
            w-log $ from-ywd 2021 45 6
            w-log $ format-time (from-ywd 2022 1 2) (%some "|%Y-%m-%d %H-%M")
            println $ format-time
              add-duration
                add-duration (get-time!) 1 :hours
                , 2 :minutes
              %some "|%Y-%m-%d %H-%M"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (main!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.test.date
          :require $ calcit.std.date :refer $ parse-time format-time get-time! extract-time from-ymd from-ywd add-duration get-timestamp
    'calcit.std.test.fs $ %{} 'FileEntry
      :defs $ {} $ 'main!
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            println "|%%%% test for fs"
            println calcit-filename calcit-dirname
            println $ >
              count $ read-file! |README.md
              , 1000
            let
                *c $ atom 0
              read-file-by-line! |README.md $ fn (line) (; println "|readling line:" line) (swap! *c inc)
              println |lines @*c
            println (path-exists? |README.md) (path-exists? |build.js)
            println $ read-dir! |./
            println |dirs: $ execute! ([] |ls) (%none)
            println "|all paths size:" $ count $ walk-dir! |target
            println "|rs files:" $ glob! |src/*.rs
            create-dir! |target/dir1
            rename! |target/dir1 |target/dir4
            create-dir-all! |target/dir2/dir3
            check-write-file! |target/dir8/dir9/file.text |TODO
            append-file! |target/dir8/dir9/file.text $ str &newline "|NEWLINE TODO"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.test.fs
          :require
            calcit.std.$meta :refer $ calcit-filename calcit-dirname
            calcit.std.fs :refer $ read-file! append-file! write-file! path-exists? read-dir! create-dir! create-dir-all! rename! check-write-file! walk-dir! glob! read-file-by-line!
            calcit.std.process :refer $ execute!
    'calcit.std.test.process $ %{} 'FileEntry
      :defs $ {} $ 'main!
        %{} 'CodeEntry
          :doc "|Verify streamed stdout/stderr events from a child process."
          :code $ quote $ defn main! ()
            println |starting-streamed-process
            stream!
              [] |sh |-c "|printf 'out-1\\n'; sleep 0.2; printf 'err-1\\n' >&2; sleep 0.2; printf 'out-2\\n'; sleep 0.2; printf 'err-2\\n' >&2"
              fn (event)
                println |received-ProcessOutput event
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.test.process
          :require $ calcit.std.process :refer $ stream! ProcessOutput
    'calcit.std.test.rand $ %{} 'FileEntry
      :defs $ {} $ 'main!
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            println "|%%%%%% test random"
            assert-detect identity $ option:some? $ rand-nth (range 10)
            assert= (%none)
              rand-nth $ take (range 1) 0
            assert-detect identity $ <= 0
              rand (%none) (%none)
              , 100
            assert-detect identity $ <= 0
              rand (%some 10) (%none)
              , 10
            assert-detect identity $ <= 20
              rand (%some 20) (%some 30)
              , 30
            assert "|try .rand-shift" $ &let
              x $ rand-shift 10 5
              and (>= x 5) (<= x 15)
            assert "|try .rand-between" $ &let
              x $ rand-between 10 5
              and (>= x 5) (<= x 10)
            assert-detect identity $ <= 0
              rand-int (%none) (%none)
              , 100
            assert-detect identity $ <= 0
              rand-int (%some 10) (%none)
              , 10
            assert-detect identity $ <= 20
              rand-int (%some 20) (%some 30)
              , 30
            println "|%%%% test id"
            assert= 9 $ count $ nanoid! (%some 9) (%none)
            assert= |aaaaa $ nanoid! (%some 5) (%some |a)
            println $ rand-hex-color!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.test.rand
          :require $ calcit.std.rand :refer $ rand rand-int rand-shift rand-nth rand-between nanoid! rand-hex-color!
    'calcit.std.time $ %{} 'FileEntry
      :defs $ {}
        'set-interval $ %{} 'CodeEntry
          :doc "|Execute function repeatedly at intervals. Args: interval in milliseconds, function to repeat. Example: (set-interval 1000 (fn () (println \"tick\")))"
          :code $ quote $ defn set-interval (t cb)
            ffi:task $ &call-dylib-edn-fn
              get-dylib-path |/dylibs/libcalcit_std
              , |set_interval t cb
          :examples $ [] $ quote
            let
                task $ set-interval 10 $ fn () (println |tick)
              task.cancel-with :example-complete
          :schema $ :: 'Fn $ {} (:return 'FfiTask)
            :args $ [] 'Number $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
        'set-timeout $ %{} 'CodeEntry
          :doc "|Execute function after delay. Args: delay in milliseconds, function to execute. Example: (set-timeout 1000 (fn () (println \"timeout\")))"
          :code $ quote $ defn set-timeout (t cb)
            ffi:task $ &call-dylib-edn-fn
              get-dylib-path |/dylibs/libcalcit_std
              , |set_timeout t cb
          :examples $ [] $ quote
            let
                task $ set-timeout 10 $ fn () (println |timeout)
              task.cancel-with :example-complete
          :schema $ :: 'Fn $ {} (:return 'FfiTask)
            :args $ [] 'Number $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.time
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path
    'calcit.std.util $ %{} 'FileEntry
      :defs $ {}
        'get-dylib-ext $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro get-dylib-ext ()
            case-default (&get-os) |.so (:macos |.dylib) (:windows |.dll)
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{} :platform-read
            :expansion $ :: 'Expr 'String
            :required $ []
        'get-dylib-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn get-dylib-path (p)
            str (or-current-path calcit-dirname) p $ get-dylib-ext
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
        'or-current-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn or-current-path (p)
            if (blank? p) |. p
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.util
          :require $ calcit.std.$meta :refer $ calcit-dirname
