
{}
  :configs $ {} (:reload-fn |calcit.std.demo/reload!) (:port 6001) (:version |0.0.1)
    :modules $ []
    :init-fn |calcit.std.demo/main!
  :ir $ {} (:package |calcit.std)
    :files $ {}
      |calcit.std.fs $ {}
        :defs $ {}
          |read-dir! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630224735170) (:by |u0)
              |j $ {} (:text |read-dir!) (:type :leaf) (:at 1630224735170) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |name) (:type :leaf) (:at 1630224746580) (:by |u0)
                :type :expr
                :at 1630224735170
                :by |u0
              |v $ {}
                :data $ {}
                  |D $ {} (:text |let) (:type :leaf) (:at 1630224766614) (:by |u0)
                  |T $ {}
                    :data $ {}
                      |T $ {}
                        :data $ {}
                          |D $ {} (:text |files) (:type :leaf) (:at 1630224770480) (:by |u0)
                          |T $ {}
                            :data $ {}
                              |T $ {} (:type :leaf) (:by |u0) (:at 1630224747449) (:text |&call-dylib:str->str)
                              |j $ {} (:type :expr) (:by |u0) (:at 1630224747449)
                                :data $ {}
                                  |T $ {} (:type :leaf) (:by |u0) (:at 1630224747449) (:text |str)
                                  |j $ {} (:type :leaf) (:by |u0) (:at 1630224747449) (:text |calcit-dirname)
                                  |r $ {} (:type :leaf) (:by |u0) (:at 1630224747449) (:text "|\"/dylibs/libcalcit_std.dylib")
                              |r $ {} (:text "|\"read_dir") (:type :leaf) (:at 1630224753870) (:by |u0)
                              |v $ {} (:type :leaf) (:by |u0) (:at 1630224747449) (:text |name)
                            :type :expr
                            :at 1630224747449
                            :by |u0
                        :type :expr
                        :at 1630224768940
                        :by |u0
                    :type :expr
                    :at 1630224768791
                    :by |u0
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |.split-lines) (:type :leaf) (:at 1630224777684) (:by |u0)
                      |j $ {} (:text |files) (:type :leaf) (:at 1630224773531) (:by |u0)
                    :type :expr
                    :at 1630224771222
                    :by |u0
                :type :expr
                :at 1630224765987
                :by |u0
            :type :expr
            :at 1630224735170
            :by |u0
          |write-file! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630171482098) (:by |u0)
              |j $ {} (:text |write-file!) (:type :leaf) (:at 1630171482098) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |name) (:type :leaf) (:at 1630171486803) (:by |u0)
                  |j $ {} (:text |content) (:type :leaf) (:at 1630171487824) (:by |u0)
                :type :expr
                :at 1630171482098
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib:str:str->str) (:type :leaf) (:at 1630175107476) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1630171491979) (:by |u0)
                      |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630175139198) (:by |u0)
                      |r $ {} (:text "|\"/dylibs/libcalcit_std.dylib") (:type :leaf) (:at 1630175211025) (:by |u0)
                    :type :expr
                    :at 1630171491979
                    :by |u0
                  |n $ {} (:text "|\"write_file") (:type :leaf) (:at 1630176312321) (:by |u0)
                  |r $ {} (:text |name) (:type :leaf) (:at 1630171491979) (:by |u0)
                  |v $ {} (:text |content) (:type :leaf) (:at 1630171494451) (:by |u0)
                :type :expr
                :at 1630171491979
                :by |u0
            :type :expr
            :at 1630171482098
            :by |u0
          |read-file! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630171370222) (:by |u0)
              |j $ {} (:text |read-file!) (:type :leaf) (:at 1630171370222) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |name) (:type :leaf) (:at 1630171376091) (:by |u0)
                :type :expr
                :at 1630171370222
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib:str->str) (:type :leaf) (:at 1630175111430) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1630171417092) (:by |u0)
                      |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630175134914) (:by |u0)
                      |r $ {} (:text "|\"/dylibs/libcalcit_std.dylib") (:type :leaf) (:at 1630176339738) (:by |u0)
                    :type :expr
                    :at 1630171415642
                    :by |u0
                  |n $ {} (:text "|\"read_file") (:type :leaf) (:at 1630176304763) (:by |u0)
                  |r $ {} (:text |name) (:type :leaf) (:at 1630171465347) (:by |u0)
                :type :expr
                :at 1630171376690
                :by |u0
            :type :expr
            :at 1630171370222
            :by |u0
          |path-exists? $ {}
            :data $ {}
              |T $ {} (:type :leaf) (:by |u0) (:at 1630219258753) (:text |defn)
              |j $ {} (:type :leaf) (:by |u0) (:at 1630219258753) (:text |path-exists?)
              |r $ {}
                :data $ {}
                  |T $ {} (:type :leaf) (:by |u0) (:at 1630219268038) (:text |name)
                :type :expr
                :at 1630219268038
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib:str->bool) (:type :leaf) (:at 1630219274092) (:by |u0)
                  |j $ {} (:type :expr) (:by |u0) (:at 1630219268038)
                    :data $ {}
                      |T $ {} (:type :leaf) (:by |u0) (:at 1630219268038) (:text |str)
                      |j $ {} (:type :leaf) (:by |u0) (:at 1630219268038) (:text |calcit-dirname)
                      |r $ {} (:type :leaf) (:by |u0) (:at 1630219268038) (:text "|\"/dylibs/libcalcit_std.dylib")
                  |r $ {} (:text "|\"path_exists") (:type :leaf) (:at 1630219282714) (:by |u0)
                  |v $ {} (:type :leaf) (:by |u0) (:at 1630219268038) (:text |name)
                :type :expr
                :at 1630219268038
                :by |u0
            :type :expr
            :at 1630219258753
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1630171366222
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1630171366222) (:by |u0)
            |j $ {} (:text |calcit.std.fs) (:type :leaf) (:at 1630171366222) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1630175119637) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.$meta) (:type :leaf) (:at 1630175125976) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630175127717) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630175130627) (:by |u0)
                      :type :expr
                      :at 1630175128076
                      :by |u0
                  :type :expr
                  :at 1630175120856
                  :by |u0
              :type :expr
              :at 1630175118985
              :by |u0
          :type :expr
          :at 1630171366222
          :by |u0
      |calcit.std.demo $ {}
        :defs $ {}
          |main! $ {}
            :data $ {}
              |yT $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1630224784483) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |read-dir!) (:type :leaf) (:at 1630224790382) (:by |u0)
                      |j $ {} (:text "|\"./") (:type :leaf) (:at 1630225166386) (:by |u0)
                    :type :expr
                    :at 1630224785532
                    :by |u0
                :type :expr
                :at 1630224783367
                :by |u0
              |T $ {} (:text |defn) (:type :leaf) (:at 1630174676216) (:by |u0)
              |j $ {} (:text |main!) (:type :leaf) (:at 1630174676216) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1630174676216
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1630174687985) (:by |u0)
                  |j $ {} (:text |calcit-filename) (:type :leaf) (:at 1630174693957) (:by |u0)
                  |r $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630174696531) (:by |u0)
                :type :expr
                :at 1630174686386
                :by |u0
              |x $ {}
                :data $ {}
                  |D $ {} (:text |println) (:type :leaf) (:at 1630176279093) (:by |u0)
                  |T $ {}
                    :data $ {}
                      |T $ {} (:text |read-file!) (:type :leaf) (:at 1630176262288) (:by |u0)
                      |j $ {} (:text "|\"build.js") (:type :leaf) (:at 1630176275302) (:by |u0)
                    :type :expr
                    :at 1630176241192
                    :by |u0
                :type :expr
                :at 1630176276151
                :by |u0
              |y $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1630219294943) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |path-exists?) (:type :leaf) (:at 1630219295880) (:by |u0)
                      |j $ {} (:text "|\"build.js") (:type :leaf) (:at 1630219299256) (:by |u0)
                    :type :expr
                    :at 1630219295597
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |path-exists?) (:type :leaf) (:at 1630219295880) (:by |u0)
                      |j $ {} (:text "|\"build.jsx") (:type :leaf) (:at 1630219302619) (:by |u0)
                    :type :expr
                    :at 1630219295597
                    :by |u0
                :type :expr
                :at 1630219294072
                :by |u0
            :type :expr
            :at 1630174676216
            :by |u0
          |reload! $ {}
            :data $ {}
              |T $ {} (:type :leaf) (:by |u0) (:at 1630174789087) (:text |defn)
              |j $ {} (:type :leaf) (:by |u0) (:at 1630174789087) (:text |reload!)
              |r $ {} (:type :expr) (:by |u0) (:at 1630174789087)
                :data $ {}
              |v $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1630174794944) (:by |u0)
                  |j $ {} (:text "|\"TODO reload") (:type :leaf) (:at 1630174798689) (:by |u0)
                :type :expr
                :at 1630174792572
                :by |u0
            :type :expr
            :at 1630174789087
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1630174670374
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1630174670374) (:by |u0)
            |j $ {} (:text |calcit.std.demo) (:type :leaf) (:at 1630174670374) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1630174699239) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.$meta) (:type :leaf) (:at 1630174765731) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630174767620) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-filename) (:type :leaf) (:at 1630174769568) (:by |u0)
                        |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630174774512) (:by |u0)
                      :type :expr
                      :at 1630174767807
                      :by |u0
                  :type :expr
                  :at 1630174699521
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.fs) (:type :leaf) (:at 1630176227478) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630176229782) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |read-file!) (:type :leaf) (:at 1630176235651) (:by |u0)
                        |j $ {} (:text |write-file!) (:type :leaf) (:at 1630176238637) (:by |u0)
                        |r $ {} (:text |path-exists?) (:type :leaf) (:at 1630219447225) (:by |u0)
                        |v $ {} (:text |read-dir!) (:type :leaf) (:at 1630224796390) (:by |u0)
                      :type :expr
                      :at 1630176230004
                      :by |u0
                  :type :expr
                  :at 1630176222588
                  :by |u0
              :type :expr
              :at 1630174698487
              :by |u0
          :type :expr
          :at 1630174670374
          :by |u0
  :users $ {}
    |u0 $ {} (:avatar nil) (:name |chen) (:nickname |chen) (:id |u0) (:theme :star-trail) (:password |d41d8cd98f00b204e9800998ecf8427e)
