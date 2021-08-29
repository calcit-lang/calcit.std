
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.demo/main!) (:reload-fn |calcit.std.demo/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |calcit.std.process $ {}
      :ns $ quote
        ns calcit.std.process $ :require
          calcit.std.$meta :refer $ calcit-dirname
          calcit.std.fs :refer $ get-dylib-ext
      :defs $ {}
        |execute! $ quote
          defn execute! (command ? dir)
            assert "\"command in list" $ and (list? command) (every? command string?)
            &call-dylib:str:str->str
              str calcit-dirname "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"execute_command"
                .join-str command $ char-from-code 12
                either dir "\"./"
    |calcit.std.fs $ {}
      :ns $ quote
        ns calcit.std.fs $ :require
          calcit.std.$meta :refer $ calcit-dirname
      :defs $ {}
        |get-dylib-ext $ quote
          defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
        |read-dir! $ quote
          defn read-dir! (name)
            let
                files $ &call-dylib:str->str
                  str calcit-dirname "\"/dylibs/libcalcit_std" $ get-dylib-ext
                  , "\"read_dir" name
              .split-lines files
        |write-file! $ quote
          defn write-file! (name content)
            &call-dylib:str:str->str
              str calcit-dirname "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"write_file" name content
        |read-file! $ quote
          defn read-file! (name)
            &call-dylib:str->str
              str calcit-dirname "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"read_file" name
        |path-exists? $ quote
          defn path-exists? (name)
            &call-dylib:str->bool
              str calcit-dirname "\"/dylibs/libcalcit_std" $ get-dylib-ext
              , "\"path_exists" name
    |calcit.std.demo $ {}
      :ns $ quote
        ns calcit.std.demo $ :require
          calcit.std.$meta :refer $ calcit-filename calcit-dirname
          calcit.std.fs :refer $ read-file! write-file! path-exists? read-dir!
          calcit.std.process :refer $ execute!
      :defs $ {}
        |main! $ quote
          defn main! () (println calcit-filename calcit-dirname)
            println $ read-file! "\"build.js"
            println (path-exists? "\"build.js") (path-exists? "\"build.jsx")
            println $ read-dir! "\"./"
            println $ execute! ([] "\"ls")
        |reload! $ quote
          defn reload! () $ println "\"TODO reload"
