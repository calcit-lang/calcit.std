
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.demo/main!) (:reload-fn |calcit.std.demo/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |calcit.std.process $ {}
      :ns $ quote
        ns calcit.std.process $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.fs :refer $ get-dylib-ext or-current-path
      :defs $ {}
        |execute! $ quote
          defn execute! (command ? dir)
            assert "\"command in list" $ and (list? command) (every? command string?)
            &call-dylib:vec-str->tuple-str2
              str (or-current-path calcit-dirname) "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"execute_command" command $ either dir "\"./"
    |calcit.std.fs $ {}
      :ns $ quote
        ns calcit.std.fs $ :require
          calcit.std.$meta :refer $ calcit-dirname
      :defs $ {}
        |get-dylib-ext $ quote
          defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
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
        |or-current-path $ quote
          defn or-current-path (p)
            if (blank? p) "\"." p
    |calcit.std.demo $ {}
      :ns $ quote
        ns calcit.std.demo $ :require
          calcit.std.$meta :refer $ calcit-filename calcit-dirname
          calcit.std.fs :refer $ read-file! write-file! path-exists? read-dir!
          calcit.std.process :refer $ execute!
      :defs $ {}
        |main! $ quote
          defn main! () (println calcit-filename calcit-dirname)
            println $ read-file! "\"README.md"
            println (path-exists? "\"README.md") (path-exists? "\"build.js")
            println $ read-dir! "\"./"
            println $ execute! ([] "\"ls")
        |reload! $ quote
          defn reload! () $ println "\"TODO reload"
