
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |calcit.std
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'calcit.std.test/main!) (:mode :native) (:reload-fn 'calcit.std.test/reload!) (:target :native)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
    :stream-process $ {} (:description |) (:init-fn 'calcit.std.test.process/main!) (:mode :native) (:reload-fn 'calcit.std.test.process/main!) (:target :native)
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
            Date0 :date $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |add_duration (:date date) n k
          :examples $ [] $ quote
            add-duration (get-time!) 7 :days
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ [] 'calcit.std.date/Date0 'Number 'Tag
            :features $ #{} :js-ffi
        'extract-time $ %{} 'CodeEntry
          :doc "|Extract time components from Date object. Returns a Map with :year, :month, :day, :hour, :minute, :second fields. Example: (extract-time (get-time!))"
          :code $ quote $ defn extract-time (x)
            decode-tag-number-map $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |extract_time $ :date x
          :examples $ [] $ quote
            extract-time $ get-time!
          :schema $ :: 'Fn $ {}
            :args $ [] 'calcit.std.date/Date0
            :features $ #{} :js-ffi
            :return $ :: 'Map 'Tag 'Number
          :tests $ [] $ %{} 'TestEntry (:name |checked-tag-number-map)
            :code $ quote $ let
                parts $ calcit.std.date/extract-time $ calcit.std.date/parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"
              assert= (Option :some 2014) (get parts :year)
              assert= (Option :some 11) (get parts :month)
              assert= (Option :some 28) (get parts :day)
            :tags $ #{} :unit
        'format-time $ %{} 'CodeEntry
          :doc "||Format Date object to string. The optional format is Option<String>; (Option :none) uses ISO format, for example (format-time (get-time!) (Option :some \"|%Y-%m-%d\"))."
          :code $ quote $ defn format-time (time format)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |format_time (:date time) format
          :examples $ [] $ quote
            format-time (get-time!) (Option :some |%Y-%m-%d)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'calcit.std.date/Date0 $ :: 'calcit.core/Option 'String
          :tests $ [] $ %{} 'TestEntry (:name |checked-string-format)
            :code $ quote $ assert= |2014-11-28
              calcit.std.date/format-time (calcit.std.date/parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z") (Option :some |%Y-%m-%d)
            :tags $ #{} :unit
        'from-ymd $ %{} 'CodeEntry
          :doc "|Create Date object from year, month, day. Args: year, month (1-12), day (1-31). Example: (from-ymd 2024 1 15)"
          :code $ quote $ defn from-ymd (y m d)
            match
              &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |from_ymd y m d
              (:single d)
                Date0 :date $ decode-number d
              (:ambiguous a b)
                raise $ str "|ambiguous: " a "| " b
              (:none) (raise "|cannot construct")
              _ $ raise |unreachable!
          :examples $ [] $ quote (from-ymd 2024 1 15)
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'from-ywd $ %{} 'CodeEntry
          :doc "|Create Date object from year, week, day. Args: year, week (1-53), day (1-7, 1=Monday). Example: (from-ywd 2024 1 1)"
          :code $ quote $ defn from-ywd (y w d)
            match
              &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |from_ywd y w d
              (:single d)
                Date0 :date $ decode-number d
              (:ambiguous a b)
                raise $ str "|ambiguous: " a "| " b
              (:none) (raise "|cannot construct")
              _ $ raise |unreachable!
          :examples $ [] $ quote (from-ywd 2024 1 1)
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'get-time! $ %{} 'CodeEntry
          :doc "|Get current system time as a Date object. Example: (get-time!)"
          :code $ quote $ defn get-time! ()
            Date0 :date $ decode-number $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |now_bang
          :examples $ [] $ quote (get-time!)
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ []
            :features $ #{} :js-ffi
        'get-timestamp $ %{} 'CodeEntry
          :doc "|Get timestamp (milliseconds) from Date object. Example: (get-timestamp (get-time!))"
          :code $ quote $ defn get-timestamp (date)
            decode-number $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |get_timestamp $ :date date
          :examples $ [] $ quote
            get-timestamp $ get-time!
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'calcit.std.date/Date0
          :tests $ [] $ %{} 'TestEntry (:name |checked-number-timestamp)
            :code $ quote $ assert= 1417176009000
              calcit.std.date/get-timestamp $ calcit.std.date/parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"
            :tags $ #{} :unit
        'parse-time $ %{} 'CodeEntry
          :doc "|Parse time string to Date object. Args: time string, format string (e.g. %Y-%m-%d %H:%M:%S %z). Example: (parse-time \"|2024-01-01 12:00:00 +00:00\" \"|%Y-%m-%d %H:%M:%S %z\")"
          :code $ quote $ defn parse-time (time format)
            Date0 :date $ decode-number $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |parse_time time format
          :examples $ [] $ quote (parse-time "|2024-01-01 12:00:00 +00:00" "|%Y-%m-%d %H:%M:%S %z")
          :schema $ :: 'Fn $ {} (:return 'calcit.std.date/Date0)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.date
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path decode-number decode-string decode-tag-number-map
    'calcit.std.fs $ %{} 'FileEntry
      :defs $ {}
        'append-file! $ %{} 'CodeEntry
          :doc "|Append content to end of file. Args: file path, content string. Example: (append-file! \"log.txt\" \"New log entry\")"
          :code $ quote $ defn append-file! (name content)
            decode-unit $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |append_file name content
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-unit-append)
            :code $ quote $ let
                path |target/std-proofs/append-file.txt
              calcit.std.fs/create-dir-all! |target/std-proofs
              calcit.std.fs/write-file! path |a
              assert= true $ identical? &unit $ calcit.std.fs/append-file! path |b
              assert= "|ab\n" $ calcit.std.fs/read-file path
            :tags $ #{} :filesystem :unit
        'check-write-file! $ %{} 'CodeEntry
          :doc "|Check if file exists, write content if not exists or if the content differs. Args: file path, content string. Returns true when the file was written, false when the existing content was identical."
          :code $ quote $ defn check-write-file! (name content)
            decode-bool $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |check_write_file name content
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-bool-result)
            :code $ quote $ let
                path |target/std-proofs/check-write.txt
              calcit.std.fs/create-dir-all! |target/std-proofs
              calcit.std.fs/write-file! path |old
              assert= true $ calcit.std.fs/check-write-file! path |new
              assert= false $ calcit.std.fs/check-write-file! path |new
              assert= |new $ calcit.std.fs/read-file path
            :tags $ #{} :filesystem :unit
        'create-dir! $ %{} 'CodeEntry
          :doc "|Create a directory at the given path. Fails if parent directory does not exist. Example: (create-dir! \"new-folder\")"
          :code $ quote $ defn create-dir! (name)
            decode-unit $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |create_dir name
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-unit-create-dir)
            :code $ quote $ let
                path |target/std-proofs/create-dir-once
              assert= true $ identical? &unit $ calcit.std.fs/create-dir-all! path
              assert= true $ calcit.std.fs/path-exists? path
            :tags $ #{} :filesystem :unit
        'create-dir-all! $ %{} 'CodeEntry
          :doc "|Create a directory and all necessary parent directories. Example: (create-dir-all! \"path/to/nested/dir\")"
          :code $ quote $ defn create-dir-all! (name)
            decode-unit $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |create_dir_all name
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'glob! $ %{} 'CodeEntry
          :doc "|Find files matching the glob pattern. Returns a list of matching file paths. Example: (glob! \"src/*.rs\")"
          :code $ quote $ defn glob! (name)
            decode-string-list $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |glob_call name
          :examples $ [] $ quote (glob! |src/**/*.rs)
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
          :tests $ [] $ %{} 'TestEntry (:name |checked-string-list)
            :code $ quote $ assert= ([] |tests/fixtures/read-contracts/hello.txt) (calcit.std.fs/glob! |tests/fixtures/read-contracts/*.txt)
            :tags $ #{} :filesystem :unit
        'path-exists? $ %{} 'CodeEntry
          :doc "|Check if a file or directory exists at the given path. Returns boolean. Example: (path-exists? \"README.md\")"
          :code $ quote $ defn path-exists? (name)
            decode-bool $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |path_exists name
          :examples $ [] $ quote (path-exists? |file.txt)
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-bool-result)
            :code $ quote $ do
              assert= true $ calcit.std.fs/path-exists? |tests/fixtures/read-contracts/hello.txt
              assert= false $ calcit.std.fs/path-exists? |tests/fixtures/read-contracts/missing.txt
            :tags $ #{} :filesystem :unit
        'read-dir $ %{} 'CodeEntry
          :doc "|通过 native 模块列出直接子路径，返回 List<String>，顺序不保证，失败抛错；不执行写入。"
          :code $ quote $ defn read-dir (name)
            decode-string-list $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |read_dir name
          :examples $ [] $ quote (calcit.std.fs/read-dir |src)
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
          :tests $ []
            %{} 'TestEntry (:name |lists-direct-children)
              :code $ quote $ let
                  items $ calcit.std.fs/read-dir |tests/fixtures/read-contracts
                assert= 2 $ items.len
                assert= true $ items.includes? |tests/fixtures/read-contracts/hello.txt
                assert= true $ items.includes? |tests/fixtures/read-contracts/nested
              :tags $ #{} :filesystem :unit
            %{} 'TestEntry (:name |missing-path-throws)
              :code $ quote $ let
                  failed $ ref false
                try (calcit.std.fs/read-dir |tests/fixtures/read-contracts/missing.txt)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return $ :: 'List 'String
                    assert= true $ message.includes? |read_dir_calcit_ffi_v1
                    reset! failed true
                    []
                assert= true @failed
              :tags $ #{} :filesystem :unit
        'read-dir! $ %{} 'CodeEntry
          :doc "|兼容入口，请改用 read-dir；读取失败仍抛错，结果顺序不保证。只在发布版消费者迁移及相关门禁完成后退场，不作为新代码首选。"
          :code $ quote $ def read-dir! calcit.std.fs/read-dir
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
          :tags $ #{} :deprecated
          :tests $ [] $ %{} 'TestEntry (:name |legacy-directory-read)
            :code $ quote $ let
                items $ calcit.std.fs/read-dir! |tests/fixtures/read-contracts
              assert= 2 $ items.len
              assert= true $ items.includes? |tests/fixtures/read-contracts/hello.txt
              assert= true $ items.includes? |tests/fixtures/read-contracts/nested
            :tags $ #{} :filesystem :unit
        'read-file $ %{} 'CodeEntry
          :doc "|通过 native 模块同步读取 UTF-8 文件，返回 String，失败抛错；不返回 Result，不执行写入。示例见 attached examples。"
          :code $ quote $ defn read-file (name)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |read_file name
          :examples $ [] $ quote (calcit.std.fs/read-file |README.md)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
          :tests $ []
            %{} 'TestEntry (:name |reads-utf8-text)
              :code $ quote $ assert= "|Calcit 😀 native read\n" (calcit.std.fs/read-file |tests/fixtures/read-contracts/hello.txt)
              :tags $ #{} :filesystem :unit
            %{} 'TestEntry (:name |missing-path-throws)
              :code $ quote $ let
                  failed $ ref false
                try (calcit.std.fs/read-file |tests/fixtures/read-contracts/missing.txt)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return 'String
                    assert= true $ message.includes? |read_file_calcit_ffi_v1
                    reset! failed true
                    , |ignored
                assert= true @failed
              :tags $ #{} :filesystem :unit
        'read-file! $ %{} 'CodeEntry
          :doc "|兼容入口，请改用 read-file；读取失败仍抛错。只在发布版消费者迁移及相关门禁完成后退场，不作为新代码首选。"
          :code $ quote $ def read-file! calcit.std.fs/read-file
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
          :tags $ #{} :deprecated
          :tests $ [] $ %{} 'TestEntry (:name |legacy-call-and-callback)
            :code $ quote $ let
                path |tests/fixtures/read-contracts/hello.txt
                expected $ calcit.std.fs/read-file path
              assert= expected $ calcit.std.fs/read-file! path
              assert= ([] expected)
                map ([] path) calcit.std.fs/read-file!
            :tags $ #{} :filesystem :unit
        'read-file-by-line! $ %{} 'CodeEntry
          :doc "|Streams a file lazily through the blocking C-safe FFI and calls the callback once per line. The callback receives String and returns Unit. Line terminators are removed like BufRead::lines; callback failure or host closing stops reading immediately. Peak native memory is bounded by the reader buffer plus the longest line."
          :code $ quote $ defn read-file-by-line! (name cb)
            decode-unit $ &blocking-dylib-edn-fn (get-dylib-path |/dylibs/libcalcit_std) |read_file_by_line name cb
          :examples $ [] $ quote
            read-file-by-line! |Cargo.toml $ fn (line) &unit
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'String
          :tests $ [] $ %{} 'TestEntry (:name |checked-unit-callback-result)
            :code $ quote $ let
                *count $ ref 0
              assert= true $ identical? &unit $ calcit.std.fs/read-file-by-line! |tests/fixtures/read-contracts/hello.txt
                fn (line) (swap! *count inc) &unit
              assert= 1 @*count
            :tags $ #{} :filesystem :unit
        'rename! $ %{} 'CodeEntry
          :doc "|Rename or move a file/directory. Args: source path, destination path. Example: (rename! \"old.txt\" \"new.txt\")"
          :code $ quote $ defn rename! (from to)
            decode-unit $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |rename_path from to
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-unit-rename)
            :code $ quote $ let
                from |target/std-proofs/rename-from.txt
                to |target/std-proofs/rename-to.txt
              calcit.std.fs/create-dir-all! |target/std-proofs
              calcit.std.fs/write-file! from |moved
              assert= true $ identical? &unit $ calcit.std.fs/rename! from to
              assert= false $ calcit.std.fs/path-exists? from
              assert= |moved $ calcit.std.fs/read-file to
            :tags $ #{} :filesystem :unit
        'walk-dir $ %{} 'CodeEntry
          :doc "|通过 native 模块递归列出文件路径，返回 List<String>，顺序不保证，失败抛错；不执行写入。"
          :code $ quote $ defn walk-dir (name)
            decode-string-list $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |walk_dir name
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
          :tests $ []
            %{} 'TestEntry (:name |lists-recursive-files)
              :code $ quote $ let
                  items $ calcit.std.fs/walk-dir |tests/fixtures/read-contracts
                assert= 2 $ items.len
                assert= true $ items.includes? |tests/fixtures/read-contracts/hello.txt
                assert= true $ items.includes? |tests/fixtures/read-contracts/nested/second.txt
              :tags $ #{} :filesystem :unit
            %{} 'TestEntry (:name |missing-path-throws)
              :code $ quote $ let
                  failed $ ref false
                try (calcit.std.fs/walk-dir |tests/fixtures/read-contracts/missing.txt)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return $ :: 'List 'String
                    assert= true $ message.includes? |walk_dir_calcit_ffi_v1
                    reset! failed true
                    []
                assert= true @failed
              :tags $ #{} :filesystem :unit
        'walk-dir! $ %{} 'CodeEntry
          :doc "|兼容入口，请改用 walk-dir；遍历失败仍抛错，结果顺序不保证。只在发布版消费者迁移及相关门禁完成后退场，不作为新代码首选。"
          :code $ quote $ def walk-dir! calcit.std.fs/walk-dir
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
          :tags $ #{} :deprecated
          :tests $ [] $ %{} 'TestEntry (:name |legacy-recursive-read)
            :code $ quote $ let
                items $ calcit.std.fs/walk-dir! |tests/fixtures/read-contracts
              assert= 2 $ items.len
              assert= true $ items.includes? |tests/fixtures/read-contracts/hello.txt
              assert= true $ items.includes? |tests/fixtures/read-contracts/nested/second.txt
            :tags $ #{} :filesystem :unit
        'write-file! $ %{} 'CodeEntry
          :doc "|Write content to file (overwrite). Args: file path, content string. Example: (write-file! \"output.txt\" \"Hello, World!\")"
          :code $ quote $ defn write-file! (name content)
            decode-unit $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |write_file name content
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-unit-write)
            :code $ quote $ let
                path |target/std-proofs/write-file.txt
              calcit.std.fs/create-dir-all! |target/std-proofs
              assert= true $ identical? &unit $ calcit.std.fs/write-file! path |written
              assert= |written $ calcit.std.fs/read-file path
            :tags $ #{} :filesystem :unit
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.fs
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path decode-bool decode-string decode-string-list decode-unit
    'calcit.std.hash $ %{} 'FileEntry
      :defs $ {} $ 'md5
        %{} 'CodeEntry
          :doc "|Calculate MD5 hash of a string. Returns 32-character hexadecimal string. Example: (md5 \"hello\")"
          :code $ quote $ defn md5 (s)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |md5 s
          :examples $ [] $ quote (md5 |hello)
          :ffi $ {} (:backend :native) (:invoke :sync) (:kind :pure-function) (:symbol |md5) (:transport :edn-buffer-v1)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-empty-digest)
            :code $ quote $ assert= |d41d8cd98f00b204e9800998ecf8427e (calcit.std.hash/md5 |)
            :tags $ #{} :unit
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.hash
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path decode-string
    'calcit.std.path $ %{} 'FileEntry
      :defs $ {}
        'join-path $ %{} 'CodeEntry
          :doc "|Join multiple path segments into a complete path, handling separators automatically. Example: (join-path \"/home\" \"user\" \"documents\" \"file.txt\")"
          :code $ quote $ defn join-path (& xs)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |join_path & xs
          :examples $ [] $ quote (join-path |/home |user |documents |file.txt)
          :schema $ :: 'Fn $ {} (:rest 'String) (:return 'String)
            :args $ []
          :tests $ [] $ %{} 'TestEntry (:name |checked-join)
            :code $ quote $ assert= |a/b/c.txt (calcit.std.path/join-path |a |b |c.txt)
            :tags $ #{} :unit
        'path-basename $ %{} 'CodeEntry
          :doc "|Get the filename part of a path (the last path component). Example: (path-basename \"/home/user/file.txt\")"
          :code $ quote $ defn path-basename (x)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |path_basename x
          :examples $ [] $ quote (path-basename |/home/user/file.txt)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
          :tests $ [] $ %{} 'TestEntry (:name |checked-basename)
            :code $ quote $ assert= |c.txt (calcit.std.path/path-basename |a/b/c.txt)
            :tags $ #{} :unit
        'path-dirname $ %{} 'CodeEntry
          :doc "|Get the directory part of a path (excluding the last component). Example: (path-dirname \"/home/user/file.txt\")"
          :code $ quote $ defn path-dirname (x)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |path_dirname x
          :examples $ [] $ quote (path-dirname |/home/user/file.txt)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
          :tests $ [] $ %{} 'TestEntry (:name |checked-dirname)
            :code $ quote $ assert= |a/b (calcit.std.path/path-dirname |a/b/c.txt)
            :tags $ #{} :unit
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.path
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path decode-string
    'calcit.std.process $ %{} 'FileEntry
      :defs $ {}
        'ProcessOutput $ %{} 'CodeEntry (:doc "|A streamed process output event.")
          :code $ quote $ defenum ProcessOutput (:stdout 'String) (:stderr 'String)
          :examples $ []
          :schema $ :: 'Enum
        'execute! $ %{} 'CodeEntry
          :doc "||Execute a command from a List<String>. The optional working directory defaults to ./; pass (Option :some path) to override it. Returns [stdout stderr]."
          :code $ quote $ defn execute! (command dir)
            assert "|command in list" $ and (list? command) (every? command string?)
            decode-string-list $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |execute_command (option:unwrap-or dir |./) command
          :examples $ [] $ quote
            execute! ([] |ls |-la) (Option :none)
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'String) (:: 'calcit.core/Option 'String)
            :features $ #{} :js-ffi
            :return $ :: 'List 'String
          :tests $ [] $ %{} 'TestEntry (:name |checked-string-list)
            :code $ quote $ assert= ([] "|hi\n" |)
              calcit.std.process/execute! ([] |echo |hi) (Option :none)
            :tags $ #{} :unit
        'on-ctrl-c $ %{} 'CodeEntry
          :doc "|兼容入口，请改用 on-ctrl-c!；保留同一函数引用、callback 和取消语义。发布版消费者迁移完成前不删除。"
          :code $ quote $ def on-ctrl-c calcit.std.process/on-ctrl-c!
          :examples $ [] $ quote
            let
                task $ on-ctrl-c $ fn () (println |Exiting...)
              task.cancel-with! :example-complete
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
          :tags $ #{} :deprecated
          :tests $ [] $ %{} 'TestEntry (:name |same-callable)
            :code $ quote $ assert= on-ctrl-c calcit.std.process/on-ctrl-c!
            :tags $ #{} :lifecycle :unit
        'on-ctrl-c! $ %{} 'CodeEntry
          :doc "|注册处理 Ctrl+C 的零参数 callback，返回可取消的 FfiTask。callback 返回 Unit；! 表示注册宿主订阅，不改变退出或取消策略。"
          :code $ quote $ defn on-ctrl-c! (f)
            ffi:task $ &call-dylib-edn-fn (get-dylib-path |/dylibs/libcalcit_std) |on_ctrl_c f
          :examples $ [] $ quote
            let
                task $ on-ctrl-c! $ fn () (println |Exiting...)
              task.cancel-with! :example-complete
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
        'stream! $ %{} 'CodeEntry
          :doc "|Start a process and stream tagged stdout/stderr events to callback. Runs asynchronously."
          :code $ quote $ defn stream! (command f dir)
            assert "|command in list" $ and (list? command) (every? command string?)
            ffi:task $ &call-dylib-edn-fn (get-dylib-path |/dylibs/libcalcit_std) |stream_command (option:unwrap-or dir |./) command f
          :examples $ [] $ quote
            stream!
              [] |sh |-c "|printf 'out-1\\n'; sleep 0.2; printf 'err-1\\n' >&2; sleep 0.2; printf 'out-2\\n'; sleep 0.2; printf 'err-2\\n' >&2"
              fn (event) (println |received-ProcessOutput event)
              Option :none
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ [] (:: 'List 'String)
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'calcit.std.process/ProcessOutput
              :: 'calcit.core/Option 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.process
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path decode-string-list
    'calcit.std.rand $ %{} 'FileEntry
      :defs $ {}
        'nanoid! $ %{} 'CodeEntry
          :doc "|Generate a nanoid string. Size and character set are Option values; omitted values use nanoid defaults."
          :code $ quote $ defn nanoid! (size chars)
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |call_nanoid size chars
          :examples $ [] $ quote
            nanoid! (Option :some 10) (Option :none)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] (:: 'calcit.core/Option 'Number) (:: 'calcit.core/Option 'String)
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-length)
            :code $ quote $ assert= 8
              (calcit.std.rand/nanoid! (Option :some 8) (Option :none))
                , .len
            :tags $ #{} :unit
        'rand $ %{} 'CodeEntry
          :doc "||Generate a random float. Omitted bounds use the default range; present bounds use Option<Number>, for example (rand (Option :some 10) (Option :some 100))."
          :code $ quote $ defn rand (from to)
            decode-number $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |rand from to
          :examples $ [] $ quote
            rand (Option :some 10) (Option :some 100)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] (:: 'calcit.core/Option 'Number) (:: 'calcit.core/Option 'Number)
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-number-range)
            :code $ quote $ let
                value $ calcit.std.rand/rand (Option :some 1) (Option :some 2)
              assert= true $ and (>= value 1) (< value 2)
            :tags $ #{} :unit
        'rand-between $ %{} 'CodeEntry (:doc "|Generate random float between from and to.")
          :code $ quote $ defn rand-between (x y)
            &+ x $ rand
              Option :some $ &- y x
              Option :none
          :examples $ [] $ quote (rand-between 10 20)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
        'rand-hex-color! $ %{} 'CodeEntry
          :doc "|Generate random hexadecimal color string in format #rrggbb. Example: (rand-hex-color!)"
          :code $ quote $ defn rand-hex-color! ()
            decode-string $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |rand_hex_color
          :examples $ [] $ quote (rand-hex-color!)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-hex-color)
            :code $ quote $ let
                color $ calcit.std.rand/rand-hex-color!
              assert= 7 $ color.len
              assert= true $ color.starts-with? |#
            :tags $ #{} :unit
        'rand-int $ %{} 'CodeEntry
          :doc "||Generate a random integer. Omitted bounds use the default range; present bounds use Option<Number>, for example (rand-int (Option :some 10) (Option :some 100))."
          :code $ quote $ defn rand-int (from to)
            decode-number $ &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |rand_int from to
          :examples $ [] $ quote
            rand-int (Option :some 100) (Option :none)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] (:: 'calcit.core/Option 'Number) (:: 'calcit.core/Option 'Number)
            :features $ #{} :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |checked-number-range)
            :code $ quote $ assert= 5
              calcit.std.rand/rand-int (Option :some 5) (Option :some 6)
            :tags $ #{} :unit
        'rand-nth $ %{} 'CodeEntry
          :doc "||Randomly select one element from a list. Returns (Option :none) when the list is empty."
          :code $ quote $ defn rand-nth (xs)
            if (&list:empty? xs) (Option :none)
              get xs $ rand-int
                Option :some $ &list:count xs
                Option :none
          :examples $ [] $ quote
            rand-nth $ [] 1 2 3 4 5
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'T
            :generics $ [] 'T
            :return $ :: 'calcit.core/Option 'T
        'rand-shift $ %{} 'CodeEntry
          :doc "|Generate random float within center ± shift range."
          :code $ quote $ defn rand-shift (x y)
            &+ (&- x y)
              rand
                Option :some $ &* 2 y
                Option :none
          :examples $ [] $ quote (rand-shift 10 2)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.rand
          :require
            calcit.std.$meta :refer $ calcit-dirname
            calcit.std.util :refer $ get-dylib-path decode-number decode-string
    'calcit.std.test $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (run-tests) (try-demos)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (run-tests) (println "|reload not handled yet") &unit
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
            on-ctrl-c! $ fn () (println "|TODO handler...") &unit
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'try-demos $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn try-demos ()
            println $ md5 |
            println $ md5 |5
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'try-time! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn try-time! ()
            set-timeout! 4000 $ fn () (println |doing) &unit
            set-interval! 2000 $ fn () (println "|DO Do Do") &unit
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns calcit.std.test
          :require (calcit.std.test.fs :as fs) (calcit.std.test.date :as date) (calcit.std.test.rand :as random)
            calcit.std.process :refer $ on-ctrl-c!
            calcit.std.time :refer $ set-timeout! set-interval!
            calcit.std.hash :refer $ md5
            calcit.std.path :refer $ join-path path-dirname path-basename
    'calcit.std.test.date $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println &newline "|%%%% test date")
            println "|GET TIME" $ get-time!
            echo |time: $ format-time (get-time!) (Option :some "|%Y-%m-%d %H:%M:%S %z")
            assert= 1417176009000 $ get-timestamp $ parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"
            dbg $ extract-time $ get-time!
            dbg $ from-ymd 2021 11 11
            dbg $ from-ywd 2021 45 6
            dbg $ format-time (from-ywd 2022 1 2) (Option :some "|%Y-%m-%d %H-%M")
            println $ format-time
              add-duration
                add-duration (get-time!) 1 :hours
                , 2 :minutes
              Option :some "|%Y-%m-%d %H-%M"
            , &unit
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
          :code $ quote $ defn main! () (println "|%%%% test for fs") (println calcit-filename calcit-dirname)
            println $ >
              count $ calcit.std.fs/read-file |README.md
              , 1000
            let
                *c $ ref 0
              read-file-by-line! |README.md $ fn (line) (; println "|readling line:" line) (swap! *c inc) &unit
              println |lines @*c
            println (path-exists? |README.md) (path-exists? |build.js)
            println $ calcit.std.fs/read-dir |./
            println |dirs: $ execute! ([] |ls) (Option :none)
            println "|all paths size:" $ count $ calcit.std.fs/walk-dir |target
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
            calcit.std.fs :refer $ append-file! write-file! path-exists? create-dir! create-dir-all! rename! check-write-file! glob! read-file-by-line!
            calcit.std.process :refer $ execute!
    'calcit.std.test.process $ %{} 'FileEntry
      :defs $ {} $ 'main!
        %{} 'CodeEntry
          :doc "|Verify streamed stdout/stderr events from a child process."
          :code $ quote $ defn main! () (println |starting-streamed-process)
            stream!
              [] |sh |-c "|printf 'out-1\\n'; sleep 0.2; printf 'err-1\\n' >&2; sleep 0.2; printf 'out-2\\n'; sleep 0.2; printf 'err-2\\n' >&2"
              fn (event) (println |received-ProcessOutput event) &unit
              Option :none
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
          :code $ quote $ defn main! () (println "|%%%%%% test random")
            assert-detect identity $ option:some? $ rand-nth (range 10)
            assert= (Option :none)
              rand-nth $ take (range 1) 0
            assert-detect identity $ <= 0
              rand (Option :none) (Option :none)
              , 100
            assert-detect identity $ <= 0
              rand (Option :some 10) (Option :none)
              , 10
            assert-detect identity $ <= 20
              rand (Option :some 20) (Option :some 30)
              , 30
            assert "|try .rand-shift" $ &let
              x $ rand-shift 10 5
              and (>= x 5) (<= x 15)
            assert "|try .rand-between" $ &let
              x $ rand-between 10 5
              and (>= x 5) (<= x 10)
            assert-detect identity $ <= 0
              rand-int (Option :none) (Option :none)
              , 100
            assert-detect identity $ <= 0
              rand-int (Option :some 10) (Option :none)
              , 10
            assert-detect identity $ <= 20
              rand-int (Option :some 20) (Option :some 30)
              , 30
            println "|%%%% test id"
            assert= 9 $ count $ nanoid! (Option :some 9) (Option :none)
            assert= |aaaaa $ nanoid! (Option :some 5) (Option :some |a)
            println $ rand-hex-color!
            , &unit
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
          :doc "|兼容入口，请改用 set-interval!；保留同一函数引用、callback 和取消语义。发布版消费者迁移完成前不删除。"
          :code $ quote $ def set-interval calcit.std.time/set-interval!
          :examples $ [] $ quote
            let
                task $ set-interval 10 $ fn () (println |tick)
              task.cancel-with! :example-complete
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ [] 'Number $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
          :tags $ #{} :deprecated
          :tests $ [] $ %{} 'TestEntry (:name |same-callable)
            :code $ quote $ assert= set-interval calcit.std.time/set-interval!
            :tags $ #{} :lifecycle :unit
        'set-interval! $ %{} 'CodeEntry
          :doc "|按毫秒间隔重复执行返回 Unit 的零参数 callback，返回可取消的 FfiTask。调用方应在卸载或重载时显式取消；! 表示启动宿主任务。"
          :code $ quote $ defn set-interval! (t cb)
            ffi:task $ &call-dylib-edn-fn (get-dylib-path |/dylibs/libcalcit_std) |set_interval t cb
          :examples $ [] $ quote
            let
                task $ set-interval! 10 $ fn () (println |tick)
              task.cancel-with! :example-complete
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ [] 'Number $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
        'set-timeout $ %{} 'CodeEntry
          :doc "|兼容入口，请改用 set-timeout!；保留同一函数引用、callback 和取消语义。发布版消费者迁移完成前不删除。"
          :code $ quote $ def set-timeout calcit.std.time/set-timeout!
          :examples $ [] $ quote
            let
                task $ set-timeout 10 $ fn () (println |timeout)
              task.cancel-with! :example-complete
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
            :args $ [] 'Number $ :: 'Fn
              {} (:return 'Unit)
                :args $ []
            :features $ #{} :js-ffi
          :tags $ #{} :deprecated
          :tests $ [] $ %{} 'TestEntry (:name |same-callable)
            :code $ quote $ assert= set-timeout calcit.std.time/set-timeout!
            :tags $ #{} :lifecycle :unit
        'set-timeout! $ %{} 'CodeEntry
          :doc "|延时执行一次 callback，返回可取消的 FfiTask。参数依次为毫秒数和返回 Unit 的零参数函数；使用 ! 表示启动宿主任务，不表示改变失败处理。"
          :code $ quote $ defn set-timeout! (t cb)
            ffi:task $ &call-dylib-edn-fn (get-dylib-path |/dylibs/libcalcit_std) |set_timeout t cb
          :examples $ [] $ quote
            let
                task $ set-timeout! 10 $ fn () (println |timeout)
              task.cancel-with! :example-complete
          :schema $ :: 'Fn $ {} (:return 'calcit.core/FfiTask)
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
        'decode-bool $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro decode-bool (raw)
            quasiquote $ match (try-decode-map-as ~raw 'Bool)
              (:ok value) value
              (:err message)
                raise $ str "|FFI result decode failed: " message
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr 'Bool
            :required $ [] 'Syntax
          :tests $ []
            %{} 'TestEntry (:name |accepts-bool)
              :code $ quote $ assert= true (decode-bool true)
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-string)
              :code $ quote $ let
                  failed $ ref false
                try (decode-bool |true)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return 'Bool
                    assert= true $ message.includes? "|FFI result decode failed"
                    reset! failed true
                    , false
                assert= true @failed
              :tags $ #{} :unit
        'decode-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro decode-number (raw)
            quasiquote $ match (try-decode-map-as ~raw 'Number)
              (:ok value) value
              (:err message)
                raise $ str "|FFI result decode failed: " message
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr 'Number
            :required $ [] 'Syntax
          :tests $ []
            %{} 'TestEntry (:name |accepts-number)
              :code $ quote $ assert= 3 (decode-number 3)
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-string)
              :code $ quote $ let
                  failed $ ref false
                try (decode-number |3)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return 'Number
                    assert= true $ message.includes? "|FFI result decode failed"
                    reset! failed true
                    , 0
                assert= true @failed
              :tags $ #{} :unit
        'decode-string $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro decode-string (raw)
            quasiquote $ match (try-decode-map-as ~raw 'String)
              (:ok value) value
              (:err message)
                raise $ str "|FFI result decode failed: " message
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr 'String
            :required $ [] 'Syntax
          :tests $ []
            %{} 'TestEntry (:name |accepts-string)
              :code $ quote $ assert= |abc (decode-string |abc)
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-number)
              :code $ quote $ let
                  failed $ ref false
                try (decode-string 1)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return 'String
                    assert= true $ message.includes? "|FFI result decode failed"
                    reset! failed true
                    , |
                assert= true @failed
              :tags $ #{} :unit
        'decode-string-list $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro decode-string-list (raw)
            quasiquote $ match
              try-decode-map-as ~raw $ :: 'List 'String
              (:ok value) value
              (:err message)
                raise $ str "|FFI result decode failed: " message
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr $ :: 'List 'String
            :required $ [] 'Syntax
          :tests $ []
            %{} 'TestEntry (:name |accepts-string-list)
              :code $ quote $ assert= ([] |a |b)
                decode-string-list $ [] |a |b
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-mixed-list)
              :code $ quote $ let
                  failed $ ref false
                try
                  decode-string-list $ [] |a 1
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return $ :: 'List 'String
                    assert= true $ message.includes? "|FFI result decode failed"
                    reset! failed true
                    []
                assert= true @failed
              :tags $ #{} :unit
        'decode-tag-number-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro decode-tag-number-map (raw)
            quasiquote $ match
              try-decode-map-as ~raw $ :: 'Map 'Tag 'Number
              (:ok value) value
              (:err message)
                raise $ str "|FFI result decode failed: " message
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr $ :: 'Map 'Tag 'Number
            :required $ [] 'Syntax
          :tests $ []
            %{} 'TestEntry (:name |accepts-tag-number-map)
              :code $ quote $ assert=
                {} (:a 1) (:b 2)
                decode-tag-number-map $ {} (:a 1) (:b 2)
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-string-value)
              :code $ quote $ let
                  failed $ ref false
                try
                  decode-tag-number-map $ {} $ :a |one
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return $ :: 'Map 'Tag 'Number
                    assert= true $ message.includes? "|FFI result decode failed"
                    reset! failed true
                    {}
                assert= true @failed
              :tags $ #{} :unit
        'decode-unit $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro decode-unit (raw)
            quasiquote $ let
                unit-raw% ~raw
              if (nil? unit-raw%) &unit $ raise $ str "|FFI result decode failed: expected nil for Unit, got " unit-raw%
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr 'Unit
            :required $ [] 'Syntax
          :tests $ []
            %{} 'TestEntry (:name |accepts-nil)
              :code $ quote $ assert= true
                identical? &unit $ decode-unit nil
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-string)
              :code $ quote $ let
                  failed $ ref false
                try (decode-unit |done)
                  fn (message)
                    hint-fn $ {}
                      :args $ [] 'String
                      :return 'Unit
                    assert= true $ message.includes? "|FFI result decode failed"
                    reset! failed true
                    , &unit
                assert= true @failed
              :tags $ #{} :unit
        'get-dylib-ext $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro get-dylib-ext ()
            let
                os $ &get-os
              if (= os :macos) |.dylib $ if (= os :windows) |.dll |.so
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
