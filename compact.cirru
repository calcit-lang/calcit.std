
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.demo/main!) (:reload-fn |calcit.std.demo/reload!)
    :modules $ []
    :version |0.0.1
  :files $ {}
    |calcit.std.fs $ {}
      :ns $ quote
        ns calcit.std.fs $ :require
          calcit.std.$meta :refer $ calcit-dirname
      :defs $ {}
        |write-file! $ quote
          defn write-file! (name content)
            &call-dylib:str:str->str (str calcit-dirname "\"/dylibs/libcalcit_std.dylib") "\"write_file" name content
        |read-file! $ quote
          defn read-file! (name)
            &call-dylib:str->str (str calcit-dirname "\"/dylibs/libcalcit_std.dylib") "\"read_file" name
    |calcit.std.demo $ {}
      :ns $ quote
        ns calcit.std.demo $ :require
          calcit.std.$meta :refer $ calcit-filename calcit-dirname
          calcit.std.fs :refer $ read-file! write-file!
      :defs $ {}
        |main! $ quote
          defn main! () (println calcit-filename calcit-dirname)
            println $ read-file! "\"build.js"
        |reload! $ quote
          defn reload! () $ println "\"TODO reload"
