
{}
  :configs $ {} (:reload-fn |calcit.std.demo/reload!) (:port 6001) (:version |0.0.1)
    :modules $ []
    :init-fn |calcit.std.demo/main!
  :ir $ {} (:package |calcit.std)
    :files $ {}
      |calcit.std.process $ {}
        :defs $ {}
          |execute! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630233671273) (:by |u0)
              |j $ {} (:text |execute!) (:type :leaf) (:at 1630233687823) (:by |u0)
              |v $ {}
                :data $ {}
                  |T $ {} (:text |command) (:type :leaf) (:at 1630233700999) (:by |u0)
                  |b $ {} (:text |?) (:type :leaf) (:at 1630233702596) (:by |u0)
                  |j $ {} (:text |dir) (:type :leaf) (:at 1630233701886) (:by |u0)
                :type :expr
                :at 1630233691235
                :by |u0
              |w $ {}
                :data $ {}
                  |T $ {} (:text |assert) (:type :leaf) (:at 1630234480547) (:by |u0)
                  |j $ {} (:text "|\"command in list") (:type :leaf) (:at 1630234486571) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |D $ {} (:text |and) (:type :leaf) (:at 1630234495001) (:by |u0)
                      |T $ {}
                        :data $ {}
                          |T $ {} (:text |list?) (:type :leaf) (:at 1630234491417) (:by |u0)
                          |j $ {} (:text |command) (:type :leaf) (:at 1630234492926) (:by |u0)
                        :type :expr
                        :at 1630234488772
                        :by |u0
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |every?) (:type :leaf) (:at 1630234498652) (:by |u0)
                          |j $ {} (:text |command) (:type :leaf) (:at 1630234500190) (:by |u0)
                          |r $ {} (:text |string?) (:type :leaf) (:at 1630234501757) (:by |u0)
                        :type :expr
                        :at 1630234495683
                        :by |u0
                    :type :expr
                    :at 1630234493500
                    :by |u0
                :type :expr
                :at 1630234479391
                :by |u0
              |x $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib:str:str->str) (:type :leaf) (:at 1630235017316) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1630233743657) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |D $ {} (:text |or-current-path) (:type :leaf) (:at 1630245637034) (:by |u0)
                          |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630233743657) (:by |u0)
                        :type :expr
                        :at 1630245636440
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1630233743657) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630234600186) (:by |u0)
                        :type :expr
                        :at 1630234592549
                        :by |u0
                    :type :expr
                    :at 1630233743657
                    :by |u0
                  |r $ {} (:text "|\"execute_command") (:type :leaf) (:at 1630233743657) (:by |u0)
                  |v $ {}
                    :data $ {}
                      |T $ {} (:text |.join-str) (:type :leaf) (:at 1630234412795) (:by |u0)
                      |j $ {} (:text |command) (:type :leaf) (:at 1630234412795) (:by |u0)
                      |r $ {}
                        :data $ {}
                          |T $ {} (:text |char-from-code) (:type :leaf) (:at 1630234412795) (:by |u0)
                          |j $ {} (:text |12) (:type :leaf) (:at 1630234412795) (:by |u0)
                        :type :expr
                        :at 1630234412795
                        :by |u0
                    :type :expr
                    :at 1630234412795
                    :by |u0
                  |x $ {}
                    :data $ {}
                      |T $ {} (:text |either) (:type :leaf) (:at 1630234418614) (:by |u0)
                      |j $ {} (:text |dir) (:type :leaf) (:at 1630234419869) (:by |u0)
                      |r $ {} (:text "|\"./") (:type :leaf) (:at 1630234422115) (:by |u0)
                    :type :expr
                    :at 1630234417567
                    :by |u0
                :type :expr
                :at 1630233743657
                :by |u0
            :type :expr
            :at 1630233671273
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1630233659635
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1630233659635) (:by |u0)
            |j $ {} (:text |calcit.std.process) (:type :leaf) (:at 1630233659635) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1630234563918) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.$meta) (:type :leaf) (:at 1630234563918) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630234563918) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630234563918) (:by |u0)
                      :type :expr
                      :at 1630234563918
                      :by |u0
                  :type :expr
                  :at 1630234563918
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.fs) (:type :leaf) (:at 1630234680982) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630234680982) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630234680982) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1630245649958) (:by |u0)
                      :type :expr
                      :at 1630234680982
                      :by |u0
                  :type :expr
                  :at 1630234680982
                  :by |u0
              :type :expr
              :at 1630234563918
              :by |u0
          :type :expr
          :at 1630233659635
          :by |u0
      |calcit.std.fs $ {}
        :defs $ {}
          |get-dylib-ext $ {}
            :data $ {}
              |T $ {} (:text |defmacro) (:type :leaf) (:at 1630231418304) (:by |u0)
              |j $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630231398718) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1630231398718
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |case-default) (:type :leaf) (:at 1630231423910) (:by |u0)
                  |b $ {}
                    :data $ {}
                      |T $ {} (:text |&get-os) (:type :leaf) (:at 1630231433951) (:by |u0)
                    :type :expr
                    :at 1630231429893
                    :by |u0
                  |j $ {} (:text "|\".so") (:type :leaf) (:at 1630231427453) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |:macos) (:type :leaf) (:at 1630231439152) (:by |u0)
                      |j $ {} (:text "|\".dylib") (:type :leaf) (:at 1630231447585) (:by |u0)
                    :type :expr
                    :at 1630231437150
                    :by |u0
                  |v $ {}
                    :data $ {}
                      |T $ {} (:text |:windows) (:type :leaf) (:at 1630231449901) (:by |u0)
                      |j $ {} (:text "|\".dll") (:type :leaf) (:at 1630231461388) (:by |u0)
                    :type :expr
                    :at 1630231448478
                    :by |u0
                :type :expr
                :at 1630231403270
                :by |u0
            :type :expr
            :at 1630231398718
            :by |u0
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
                              |T $ {} (:text |&call-dylib:str->str) (:type :leaf) (:at 1630224747449) (:by |u0)
                              |j $ {}
                                :data $ {}
                                  |T $ {} (:text |str) (:type :leaf) (:at 1630224747449) (:by |u0)
                                  |j $ {}
                                    :data $ {}
                                      |D $ {} (:text |or-current-path) (:type :leaf) (:at 1630245630276) (:by |u0)
                                      |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630224747449) (:by |u0)
                                    :type :expr
                                    :at 1630245629650
                                    :by |u0
                                  |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1630231484017) (:by |u0)
                                  |v $ {}
                                    :data $ {}
                                      |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630231485274) (:by |u0)
                                    :type :expr
                                    :at 1630231485274
                                    :by |u0
                                :type :expr
                                :at 1630224747449
                                :by |u0
                              |r $ {} (:text "|\"read_dir") (:type :leaf) (:at 1630224753870) (:by |u0)
                              |v $ {} (:text |name) (:type :leaf) (:at 1630224747449) (:by |u0)
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
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1630231496823) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630231497547) (:by |u0)
                        :type :expr
                        :at 1630231497547
                        :by |u0
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
                      |j $ {}
                        :data $ {}
                          |D $ {} (:text |or-current-path) (:type :leaf) (:at 1630245580749) (:by |u0)
                          |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630175134914) (:by |u0)
                        :type :expr
                        :at 1630245565638
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1630231491522) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630231492086) (:by |u0)
                        :type :expr
                        :at 1630231492086
                        :by |u0
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
              |T $ {} (:text |defn) (:type :leaf) (:at 1630219258753) (:by |u0)
              |j $ {} (:text |path-exists?) (:type :leaf) (:at 1630219258753) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |name) (:type :leaf) (:at 1630219268038) (:by |u0)
                :type :expr
                :at 1630219268038
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib:str->bool) (:type :leaf) (:at 1630219274092) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1630219268038) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |D $ {} (:text |or-current-path) (:type :leaf) (:at 1630245627140) (:by |u0)
                          |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630219268038) (:by |u0)
                        :type :expr
                        :at 1630245626564
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1630231388580) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630231396884) (:by |u0)
                        :type :expr
                        :at 1630231389815
                        :by |u0
                    :type :expr
                    :at 1630219268038
                    :by |u0
                  |r $ {} (:text "|\"path_exists") (:type :leaf) (:at 1630219282714) (:by |u0)
                  |v $ {} (:text |name) (:type :leaf) (:at 1630219268038) (:by |u0)
                :type :expr
                :at 1630219268038
                :by |u0
            :type :expr
            :at 1630219258753
            :by |u0
          |or-current-path $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630245583936) (:by |u0)
              |j $ {} (:text |or-current-path) (:type :leaf) (:at 1630245582276) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |p) (:type :leaf) (:at 1630245585364) (:by |u0)
                :type :expr
                :at 1630245582276
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |if) (:type :leaf) (:at 1630245586336) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |blank?) (:type :leaf) (:at 1630245614560) (:by |u0)
                      |j $ {} (:text |p) (:type :leaf) (:at 1630245615061) (:by |u0)
                    :type :expr
                    :at 1630245586894
                    :by |u0
                  |r $ {} (:text "|\".") (:type :leaf) (:at 1630245616843) (:by |u0)
                  |v $ {} (:text |p) (:type :leaf) (:at 1630245618366) (:by |u0)
                :type :expr
                :at 1630245585942
                :by |u0
            :type :expr
            :at 1630245582276
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
              |yj $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1630234445436) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |execute!) (:type :leaf) (:at 1630234447173) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |[]) (:type :leaf) (:at 1630234455628) (:by |u0)
                          |j $ {} (:text "|\"ls") (:type :leaf) (:at 1630234458445) (:by |u0)
                        :type :expr
                        :at 1630234455761
                        :by |u0
                    :type :expr
                    :at 1630234446499
                    :by |u0
                :type :expr
                :at 1630234444588
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
                      |j $ {} (:text "|\"README.md") (:type :leaf) (:at 1630245682315) (:by |u0)
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
                      |j $ {} (:text "|\"README.md") (:type :leaf) (:at 1630245685393) (:by |u0)
                    :type :expr
                    :at 1630219295597
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |path-exists?) (:type :leaf) (:at 1630219295880) (:by |u0)
                      |j $ {} (:text "|\"build.js") (:type :leaf) (:at 1630245688251) (:by |u0)
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
              |T $ {} (:text |defn) (:type :leaf) (:at 1630174789087) (:by |u0)
              |j $ {} (:text |reload!) (:type :leaf) (:at 1630174789087) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1630174789087
                :by |u0
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
                |v $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.process) (:type :leaf) (:at 1630234435928) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630234437452) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |execute!) (:type :leaf) (:at 1630234439968) (:by |u0)
                      :type :expr
                      :at 1630234437661
                      :by |u0
                  :type :expr
                  :at 1630234432423
                  :by |u0
              :type :expr
              :at 1630174698487
              :by |u0
          :type :expr
          :at 1630174670374
          :by |u0
  :users $ {}
    |u0 $ {} (:avatar nil) (:name |chen) (:nickname |chen) (:id |u0) (:theme :star-trail) (:password |d41d8cd98f00b204e9800998ecf8427e)
