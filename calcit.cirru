
{}
  :configs $ {} (:reload-fn |calcit.std.test/reload!) (:port 6001) (:version |0.0.2)
    :modules $ []
    :init-fn |calcit.std.test/main!
  :ir $ {} (:package |calcit.std)
    :files $ {}
      |calcit.std.test.date $ {}
        :defs $ {}
          |main! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633181508087) (:by |u0)
              |j $ {} (:text |main!) (:type :leaf) (:at 1633181508087) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633181508087
                :by |u0
              |t $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633182683895) (:by |u0)
                  |j $ {} (:text "|\"%%%% test date") (:type :leaf) (:at 1633182694863) (:by |u0)
                :type :expr
                :at 1633182683895
                :by |u0
              |u $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633182724062) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |get-time!) (:type :leaf) (:at 1633182726288) (:by |u0)
                    :type :expr
                    :at 1633182726288
                    :by |u0
                :type :expr
                :at 1633182723200
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |echo) (:type :leaf) (:at 1633181525316) (:by |u0)
                  |j $ {} (:text ||time:) (:type :leaf) (:at 1633181525316) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |format-time) (:type :leaf) (:at 1633181525316) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |get-time!) (:type :leaf) (:at 1633181525316) (:by |u0)
                        :type :expr
                        :at 1633181525316
                        :by |u0
                      |r $ {} (:text "||%Y-%m-%d %H:%M:%S %z") (:type :leaf) (:at 1633181525316) (:by |u0)
                    :type :expr
                    :at 1633181525316
                    :by |u0
                :type :expr
                :at 1633181525316
                :by |u0
              |x $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633181525316) (:by |u0)
                  |j $ {} (:text |1417176009000) (:type :leaf) (:at 1633181525316) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |parse-time) (:type :leaf) (:at 1633181525316) (:by |u0)
                      |j $ {} (:text "||2014-11-28 21:00:09 +09:00") (:type :leaf) (:at 1633181525316) (:by |u0)
                      |r $ {} (:text "||%Y-%m-%d %H:%M:%S %z") (:type :leaf) (:at 1633181525316) (:by |u0)
                    :type :expr
                    :at 1633181525316
                    :by |u0
                :type :expr
                :at 1633181525316
                :by |u0
              |y $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633181525316) (:by |u0)
                  |j $ {} (:text "||2014-11-28 12:00:09 +0000") (:type :leaf) (:at 1633181525316) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |format-time) (:type :leaf) (:at 1633181525316) (:by |u0)
                      |j $ {} (:text |1417176009000) (:type :leaf) (:at 1633181525316) (:by |u0)
                      |r $ {} (:text "||%Y-%m-%d %H:%M:%S %z") (:type :leaf) (:at 1633181525316) (:by |u0)
                    :type :expr
                    :at 1633181525316
                    :by |u0
                :type :expr
                :at 1633181525316
                :by |u0
            :type :expr
            :at 1633181508087
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633181502356
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633181502356) (:by |u0)
            |j $ {} (:text |calcit.std.test.date) (:type :leaf) (:at 1633181502356) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633181537744) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.date) (:type :leaf) (:at 1633181544672) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181545419) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |parse-time) (:type :leaf) (:at 1633181552779) (:by |u0)
                        |j $ {} (:text |format-time) (:type :leaf) (:at 1633181554153) (:by |u0)
                        |r $ {} (:text |get-time!) (:type :leaf) (:at 1633181563305) (:by |u0)
                      :type :expr
                      :at 1633181545728
                      :by |u0
                  :type :expr
                  :at 1633181537979
                  :by |u0
              :type :expr
              :at 1633181536910
              :by |u0
          :type :expr
          :at 1633181502356
          :by |u0
      |calcit.std.test.json $ {}
        :defs $ {}
          |main! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633181629879) (:by |u0)
              |j $ {} (:text |main!) (:type :leaf) (:at 1633181629879) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633181629879
                :by |u0
              |t $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633182698162) (:by |u0)
                  |j $ {} (:text "|\"%%%% test for json") (:type :leaf) (:at 1633182701816) (:by |u0)
                :type :expr
                :at 1633182698162
                :by |u0
              |u $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633197976808) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |stringify-json) (:type :leaf) (:at 1633197978748) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |[]) (:type :leaf) (:at 1633197981400) (:by |u0)
                          |j $ {} (:text |1) (:type :leaf) (:at 1633197981639) (:by |u0)
                          |r $ {} (:text |2) (:type :leaf) (:at 1633197981958) (:by |u0)
                          |v $ {} (:text |3) (:type :leaf) (:at 1633197982183) (:by |u0)
                          |x $ {} (:text |:a) (:type :leaf) (:at 1633198868517) (:by |u0)
                        :type :expr
                        :at 1633197979285
                        :by |u0
                    :type :expr
                    :at 1633197977182
                    :by |u0
                :type :expr
                :at 1633197974934
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633181735860) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |parse-json) (:type :leaf) (:at 1633181735860) (:by |u0)
                      |j $ {} (:text "||{\"a\": [1, 2], \":b\": 3}") (:type :leaf) (:at 1633181735860) (:by |u0)
                    :type :expr
                    :at 1633181735860
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |{}) (:type :leaf) (:at 1633181735860) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text ||a) (:type :leaf) (:at 1633181735860) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |T $ {} (:text |[]) (:type :leaf) (:at 1633181735860) (:by |u0)
                              |j $ {} (:text |1) (:type :leaf) (:at 1633181735860) (:by |u0)
                              |r $ {} (:text |2) (:type :leaf) (:at 1633181735860) (:by |u0)
                            :type :expr
                            :at 1633181735860
                            :by |u0
                        :type :expr
                        :at 1633181735860
                        :by |u0
                      |r $ {}
                        :data $ {}
                          |T $ {} (:text |:b) (:type :leaf) (:at 1633181735860) (:by |u0)
                          |j $ {} (:text |3) (:type :leaf) (:at 1633181735860) (:by |u0)
                        :type :expr
                        :at 1633181735860
                        :by |u0
                    :type :expr
                    :at 1633181735860
                    :by |u0
                :type :expr
                :at 1633181735860
                :by |u0
              |x $ {}
                :data $ {}
                  |T $ {} (:text |&let) (:type :leaf) (:at 1633181735860) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |data) (:type :leaf) (:at 1633181735860) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |{}) (:type :leaf) (:at 1633181735860) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |T $ {} (:text ||a) (:type :leaf) (:at 1633181735860) (:by |u0)
                              |j $ {} (:text |1) (:type :leaf) (:at 1633181735860) (:by |u0)
                            :type :expr
                            :at 1633181735860
                            :by |u0
                          |r $ {}
                            :data $ {}
                              |T $ {} (:text |:b) (:type :leaf) (:at 1633181735860) (:by |u0)
                              |j $ {} (:text |2) (:type :leaf) (:at 1633181735860) (:by |u0)
                            :type :expr
                            :at 1633181735860
                            :by |u0
                          |v $ {}
                            :data $ {}
                              |T $ {} (:text |:c) (:type :leaf) (:at 1633181735860) (:by |u0)
                              |j $ {} (:text |:k) (:type :leaf) (:at 1633181735860) (:by |u0)
                            :type :expr
                            :at 1633181735860
                            :by |u0
                        :type :expr
                        :at 1633181735860
                        :by |u0
                    :type :expr
                    :at 1633181735860
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |assert=) (:type :leaf) (:at 1633181735860) (:by |u0)
                      |j $ {} (:text |data) (:type :leaf) (:at 1633181735860) (:by |u0)
                      |r $ {}
                        :data $ {}
                          |T $ {} (:text |parse-json) (:type :leaf) (:at 1633181735860) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |D $ {} (:text |w-log) (:type :leaf) (:at 1633198977764) (:by |u0)
                              |T $ {}
                                :data $ {}
                                  |T $ {} (:text |stringify-json) (:type :leaf) (:at 1633181735860) (:by |u0)
                                  |j $ {} (:text |data) (:type :leaf) (:at 1633181735860) (:by |u0)
                                  |r $ {} (:text |true) (:type :leaf) (:at 1633199064959) (:by |u0)
                                :type :expr
                                :at 1633181735860
                                :by |u0
                            :type :expr
                            :at 1633198975983
                            :by |u0
                        :type :expr
                        :at 1633181735860
                        :by |u0
                    :type :expr
                    :at 1633181735860
                    :by |u0
                :type :expr
                :at 1633181735860
                :by |u0
              |y $ {}
                :data $ {}
                  |T $ {} (:text |&let) (:type :leaf) (:at 1633187033835) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |data) (:type :leaf) (:at 1633187033835) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |{}) (:type :leaf) (:at 1633187033835) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |T $ {} (:text ||a) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text |1) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                          |r $ {}
                            :data $ {}
                              |T $ {} (:text |:b) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text |2) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                          |v $ {}
                            :data $ {}
                              |T $ {} (:text |:c) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text |:k) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                        :type :expr
                        :at 1633187033835
                        :by |u0
                    :type :expr
                    :at 1633187033835
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |assert=) (:type :leaf) (:at 1633187033835) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |parse-json) (:type :leaf) (:at 1633187033835) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |T $ {} (:text |stringify-json) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text |data) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                        :type :expr
                        :at 1633187033835
                        :by |u0
                      |r $ {}
                        :data $ {}
                          |T $ {} (:text |{}) (:type :leaf) (:at 1633187033835) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |T $ {} (:text ||a) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text |1) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                          |r $ {}
                            :data $ {}
                              |T $ {} (:text ||b) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text |2) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                          |v $ {}
                            :data $ {}
                              |T $ {} (:text ||c) (:type :leaf) (:at 1633187033835) (:by |u0)
                              |j $ {} (:text ||k) (:type :leaf) (:at 1633187033835) (:by |u0)
                            :type :expr
                            :at 1633187033835
                            :by |u0
                        :type :expr
                        :at 1633187033835
                        :by |u0
                    :type :expr
                    :at 1633187033835
                    :by |u0
                :type :expr
                :at 1633187033835
                :by |u0
            :type :expr
            :at 1633181629879
            :by |u0
          |slurp-cirru-edn $ {}
            :data $ {}
              |T $ {} (:text |defmacro) (:type :leaf) (:at 1633181663658) (:by |u0)
              |j $ {} (:text |slurp-cirru-edn) (:type :leaf) (:at 1633181663658) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |file) (:type :leaf) (:at 1633181663658) (:by |u0)
                :type :expr
                :at 1633181663658
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |with-cpu-time) (:type :leaf) (:at 1633181663658) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |stringify-json) (:type :leaf) (:at 1633181663658) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |first) (:type :leaf) (:at 1633181663658) (:by |u0)
                          |j $ {}
                            :data $ {}
                              |T $ {} (:text |with-cpu-time) (:type :leaf) (:at 1633181663658) (:by |u0)
                              |j $ {}
                                :data $ {}
                                  |T $ {} (:text |parse-cirru) (:type :leaf) (:at 1633181663658) (:by |u0)
                                  |j $ {}
                                    :data $ {}
                                      |T $ {} (:text |read-file) (:type :leaf) (:at 1633181663658) (:by |u0)
                                      |j $ {} (:text |file) (:type :leaf) (:at 1633181663658) (:by |u0)
                                    :type :expr
                                    :at 1633181663658
                                    :by |u0
                                :type :expr
                                :at 1633181663658
                                :by |u0
                            :type :expr
                            :at 1633181663658
                            :by |u0
                        :type :expr
                        :at 1633181663658
                        :by |u0
                      |r $ {} (:text |true) (:type :leaf) (:at 1633181663658) (:by |u0)
                    :type :expr
                    :at 1633181663658
                    :by |u0
                :type :expr
                :at 1633181663658
                :by |u0
            :type :expr
            :at 1633181663658
            :by |u0
          |try-large-json $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633181636524) (:by |u0)
              |j $ {} (:text |try-large-json) (:type :leaf) (:at 1633181636524) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633181636524
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |slurp-cirru-edn) (:type :leaf) (:at 1633181656855) (:by |u0)
                  |j $ {} (:text ||/Users/chen/repo/calcit-lang/apis/docs/apis.cirru) (:type :leaf) (:at 1633181656855) (:by |u0)
                :type :expr
                :at 1633181656855
                :by |u0
            :type :expr
            :at 1633181636524
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633181626356
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633181626356) (:by |u0)
            |j $ {} (:text |calcit.std.test.json) (:type :leaf) (:at 1633181626356) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633181742270) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.json) (:type :leaf) (:at 1633181746103) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181747444) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |parse-json) (:type :leaf) (:at 1633181749646) (:by |u0)
                        |j $ {} (:text |stringify-json) (:type :leaf) (:at 1633181755342) (:by |u0)
                      :type :expr
                      :at 1633181748344
                      :by |u0
                  :type :expr
                  :at 1633181742515
                  :by |u0
              :type :expr
              :at 1633181741419
              :by |u0
          :type :expr
          :at 1633181626356
          :by |u0
      |calcit.std.regex $ {}
        :defs $ {}
          |re-find-all $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168541264) (:by |u0)
              |j $ {} (:text |re-find-all) (:type :leaf) (:at 1633168541264) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |s) (:type :leaf) (:at 1633181360390) (:by |u0)
                  |j $ {} (:text |pattern) (:type :leaf) (:at 1633181361636) (:by |u0)
                :type :expr
                :at 1633168541264
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253314302) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181358829) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181358829) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181358829) (:by |u0)
                        :type :expr
                        :at 1633181358829
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181358829) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181358829) (:by |u0)
                        :type :expr
                        :at 1633181358829
                        :by |u0
                    :type :expr
                    :at 1633181358829
                    :by |u0
                  |r $ {} (:text "|\"re_find_all") (:type :leaf) (:at 1633181367307) (:by |u0)
                  |v $ {} (:text |s) (:type :leaf) (:at 1633181369860) (:by |u0)
                  |x $ {} (:text |pattern) (:type :leaf) (:at 1633181371133) (:by |u0)
                :type :expr
                :at 1633181358829
                :by |u0
            :type :expr
            :at 1633168541264
            :by |u0
          |re-matches $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168527210) (:by |u0)
              |j $ {} (:text |re-matches) (:type :leaf) (:at 1633168527210) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |s) (:type :leaf) (:at 1633181397547) (:by |u0)
                  |j $ {} (:text |pattern) (:type :leaf) (:at 1633181398992) (:by |u0)
                :type :expr
                :at 1633168527210
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253320897) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181393853) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181393853) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181393853) (:by |u0)
                        :type :expr
                        :at 1633181393853
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181393853) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181393853) (:by |u0)
                        :type :expr
                        :at 1633181393853
                        :by |u0
                    :type :expr
                    :at 1633181393853
                    :by |u0
                  |r $ {} (:text "|\"re_matches") (:type :leaf) (:at 1633181403399) (:by |u0)
                  |v $ {} (:text |s) (:type :leaf) (:at 1633181405748) (:by |u0)
                  |x $ {} (:text |pattern) (:type :leaf) (:at 1633181406763) (:by |u0)
                :type :expr
                :at 1633181393853
                :by |u0
            :type :expr
            :at 1633168527210
            :by |u0
          |re-find-index $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168535984) (:by |u0)
              |j $ {} (:text |re-find-index) (:type :leaf) (:at 1633168535984) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |s) (:type :leaf) (:at 1633181376705) (:by |u0)
                  |j $ {} (:text |pattern) (:type :leaf) (:at 1633181377719) (:by |u0)
                :type :expr
                :at 1633168535984
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253317546) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181375127) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181375127) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181375127) (:by |u0)
                        :type :expr
                        :at 1633181375127
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181375127) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181375127) (:by |u0)
                        :type :expr
                        :at 1633181375127
                        :by |u0
                    :type :expr
                    :at 1633181375127
                    :by |u0
                  |r $ {} (:text "|\"re_find_index") (:type :leaf) (:at 1633181381988) (:by |u0)
                  |v $ {} (:text |s) (:type :leaf) (:at 1633181384204) (:by |u0)
                  |x $ {} (:text |pattern) (:type :leaf) (:at 1633181385670) (:by |u0)
                :type :expr
                :at 1633181375127
                :by |u0
            :type :expr
            :at 1633168535984
            :by |u0
          |re-find $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168530433) (:by |u0)
              |j $ {} (:text |re-find) (:type :leaf) (:at 1633168530433) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |s) (:type :leaf) (:at 1633181346336) (:by |u0)
                  |j $ {} (:text |pattern) (:type :leaf) (:at 1633181347718) (:by |u0)
                :type :expr
                :at 1633168530433
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253310212) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181336074) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181336074) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181336074) (:by |u0)
                        :type :expr
                        :at 1633181336074
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181336074) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181336074) (:by |u0)
                        :type :expr
                        :at 1633181336074
                        :by |u0
                    :type :expr
                    :at 1633181336074
                    :by |u0
                  |r $ {} (:text "|\"re_find") (:type :leaf) (:at 1633181352127) (:by |u0)
                  |v $ {} (:text |s) (:type :leaf) (:at 1633181353487) (:by |u0)
                  |x $ {} (:text |pattern) (:type :leaf) (:at 1633181354508) (:by |u0)
                :type :expr
                :at 1633181336074
                :by |u0
            :type :expr
            :at 1633168530433
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633168360570
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633168360570) (:by |u0)
            |j $ {} (:text |calcit.std.regex) (:type :leaf) (:at 1633168360570) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633181165895) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.$meta) (:type :leaf) (:at 1633181165895) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181165895) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181165895) (:by |u0)
                      :type :expr
                      :at 1633181165895
                      :by |u0
                  :type :expr
                  :at 1633181165895
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.util) (:type :leaf) (:at 1633181165895) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181165895) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181165895) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181165895) (:by |u0)
                      :type :expr
                      :at 1633181165895
                      :by |u0
                  :type :expr
                  :at 1633181165895
                  :by |u0
              :type :expr
              :at 1633181165895
              :by |u0
          :type :expr
          :at 1633168360570
          :by |u0
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
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253274875) (:by |u0)
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
                  |s $ {}
                    :data $ {}
                      |T $ {} (:text |either) (:type :leaf) (:at 1631166907802) (:by |u0)
                      |j $ {} (:text |dir) (:type :leaf) (:at 1631166907802) (:by |u0)
                      |r $ {} (:text "|\"./") (:type :leaf) (:at 1631166907802) (:by |u0)
                    :type :expr
                    :at 1631166907802
                    :by |u0
                  |t $ {} (:text |command) (:type :leaf) (:at 1631164907902) (:by |u0)
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
                    |T $ {} (:text |calcit.std.util) (:type :leaf) (:at 1633181115150) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630234680982) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630234680982) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181119954) (:by |u0)
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
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253257459) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1631164877698) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1631164877698) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1631164877698) (:by |u0)
                        :type :expr
                        :at 1631164877698
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1631164877698) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1631164877698) (:by |u0)
                        :type :expr
                        :at 1631164877698
                        :by |u0
                    :type :expr
                    :at 1631164877698
                    :by |u0
                  |r $ {} (:text "|\"read_dir") (:type :leaf) (:at 1631164877698) (:by |u0)
                  |v $ {} (:text |name) (:type :leaf) (:at 1631164877698) (:by |u0)
                :type :expr
                :at 1631164877698
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
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253266538) (:by |u0)
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
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253268620) (:by |u0)
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
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253263271) (:by |u0)
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
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.util) (:type :leaf) (:at 1633181140100) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181140100) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181140100) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181140100) (:by |u0)
                      :type :expr
                      :at 1633181140100
                      :by |u0
                  :type :expr
                  :at 1633181140100
                  :by |u0
              :type :expr
              :at 1630175118985
              :by |u0
          :type :expr
          :at 1630171366222
          :by |u0
      |calcit.std.test.regex $ {}
        :defs $ {}
          |main! $ {}
            :data $ {}
              |yyT $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |[]) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||1) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||2) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |v $ {} (:text ||34) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find-all) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||1a2a34) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d+) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yT $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {} (:text |false) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-matches) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||a) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yb $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {} (:text "|\"4") (:type :leaf) (:at 1633199660020) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find) (:type :leaf) (:at 1633199649649) (:by |u0)
                      |j $ {} (:text ||a4) (:type :leaf) (:at 1633199652201) (:by |u0)
                      |r $ {} (:text ||\d) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yj $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {} (:text |1) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find-index) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||a1) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yr $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {} (:text |-1) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find-index) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||aa) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yv $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |[]) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||1) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||2) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |v $ {} (:text ||3) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find-all) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||123) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yx $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |[]) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||123) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find-all) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||123) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d+) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |yy $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |[]) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||1) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||2) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |v $ {} (:text ||3) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-find-all) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||1a2a3) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d+) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168582795) (:by |u0)
              |j $ {} (:text |main!) (:type :leaf) (:at 1633168582795) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633168582795
                :by |u0
              |t $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633182705467) (:by |u0)
                  |j $ {} (:text "|\"%%%% test for regex") (:type :leaf) (:at 1633182708552) (:by |u0)
                :type :expr
                :at 1633182705467
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633168595067) (:by |u0)
                  |j $ {} (:text "||Test regular expression") (:type :leaf) (:at 1633168585764) (:by |u0)
                :type :expr
                :at 1633168585764
                :by |u0
              |x $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {} (:text |true) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-matches) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||2) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
              |y $ {}
                :data $ {}
                  |T $ {} (:text |assert=) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |j $ {} (:text |true) (:type :leaf) (:at 1633168585764) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |re-matches) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |j $ {} (:text ||23) (:type :leaf) (:at 1633168585764) (:by |u0)
                      |r $ {} (:text ||\d+) (:type :leaf) (:at 1633168585764) (:by |u0)
                    :type :expr
                    :at 1633168585764
                    :by |u0
                :type :expr
                :at 1633168585764
                :by |u0
            :type :expr
            :at 1633168582795
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633168573382
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633168573382) (:by |u0)
            |j $ {} (:text |calcit.std.test.regex) (:type :leaf) (:at 1633168573382) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633168597870) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.regex) (:type :leaf) (:at 1633168600867) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633168602637) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |re-matches) (:type :leaf) (:at 1633168611196) (:by |u0)
                        |j $ {} (:text |re-find-index) (:type :leaf) (:at 1633168614856) (:by |u0)
                        |n $ {} (:text |re-find) (:type :leaf) (:at 1633168633294) (:by |u0)
                        |r $ {} (:text |re-find-all) (:type :leaf) (:at 1633168618578) (:by |u0)
                      :type :expr
                      :at 1633168608131
                      :by |u0
                  :type :expr
                  :at 1633168598503
                  :by |u0
              :type :expr
              :at 1633168596580
              :by |u0
          :type :expr
          :at 1633168573382
          :by |u0
      |calcit.std.date $ {}
        :defs $ {}
          |get-time! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168502797) (:by |u0)
              |j $ {} (:text |get-time!) (:type :leaf) (:at 1633168502797) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633168502797
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253286256) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633168770408) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633168770408) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633168770408) (:by |u0)
                        :type :expr
                        :at 1633168770408
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633168770408) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633168770408) (:by |u0)
                        :type :expr
                        :at 1633168770408
                        :by |u0
                    :type :expr
                    :at 1633168770408
                    :by |u0
                  |r $ {} (:text "|\"now_bang") (:type :leaf) (:at 1633181993466) (:by |u0)
                :type :expr
                :at 1633168770408
                :by |u0
            :type :expr
            :at 1633168502797
            :by |u0
          |parse-time $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168493152) (:by |u0)
              |j $ {} (:text |parse-time) (:type :leaf) (:at 1633168493152) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |time) (:type :leaf) (:at 1633181254551) (:by |u0)
                  |j $ {} (:text |format) (:type :leaf) (:at 1633181255231) (:by |u0)
                :type :expr
                :at 1633168493152
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253289856) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181255929) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181255929) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181255929) (:by |u0)
                        :type :expr
                        :at 1633181255929
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181255929) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181255929) (:by |u0)
                        :type :expr
                        :at 1633181255929
                        :by |u0
                    :type :expr
                    :at 1633181255929
                    :by |u0
                  |r $ {} (:text "|\"parse_time") (:type :leaf) (:at 1633181261272) (:by |u0)
                  |v $ {} (:text |time) (:type :leaf) (:at 1633181264402) (:by |u0)
                  |x $ {} (:text |format) (:type :leaf) (:at 1633181265382) (:by |u0)
                :type :expr
                :at 1633181255929
                :by |u0
            :type :expr
            :at 1633168493152
            :by |u0
          |format-time $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168497249) (:by |u0)
              |j $ {} (:text |format-time) (:type :leaf) (:at 1633168497249) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |time) (:type :leaf) (:at 1633181223261) (:by |u0)
                  |b $ {} (:text |?) (:type :leaf) (:at 1633181977855) (:by |u0)
                  |j $ {} (:text |format) (:type :leaf) (:at 1633181224266) (:by |u0)
                :type :expr
                :at 1633168497249
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253280420) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181205882) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181205882) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181205882) (:by |u0)
                        :type :expr
                        :at 1633181205882
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181205882) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181205882) (:by |u0)
                        :type :expr
                        :at 1633181205882
                        :by |u0
                    :type :expr
                    :at 1633181205882
                    :by |u0
                  |r $ {} (:text "|\"format_time") (:type :leaf) (:at 1633181229605) (:by |u0)
                  |v $ {} (:text |time) (:type :leaf) (:at 1633181240264) (:by |u0)
                  |x $ {} (:text |format) (:type :leaf) (:at 1633181241023) (:by |u0)
                :type :expr
                :at 1633181205882
                :by |u0
            :type :expr
            :at 1633168497249
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633168354404
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633168354404) (:by |u0)
            |j $ {} (:text |calcit.std.date) (:type :leaf) (:at 1633168354404) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633168760266) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.$meta) (:type :leaf) (:at 1633168760630) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633168760630) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633168760630) (:by |u0)
                      :type :expr
                      :at 1633168760630
                      :by |u0
                  :type :expr
                  :at 1633168760630
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.util) (:type :leaf) (:at 1633181151756) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181151756) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181151756) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181151756) (:by |u0)
                      :type :expr
                      :at 1633181151756
                      :by |u0
                  :type :expr
                  :at 1633181151756
                  :by |u0
              :type :expr
              :at 1633168759503
              :by |u0
          :type :expr
          :at 1633168354404
          :by |u0
      |calcit.std.json $ {}
        :defs $ {}
          |stringify-json $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168514525) (:by |u0)
              |j $ {} (:text |stringify-json) (:type :leaf) (:at 1633168514525) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |data) (:type :leaf) (:at 1633181304978) (:by |u0)
                  |b $ {} (:text |?) (:type :leaf) (:at 1633181971377) (:by |u0)
                  |j $ {} (:text |colon?) (:type :leaf) (:at 1633181309855) (:by |u0)
                :type :expr
                :at 1633168514525
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253302295) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181303734) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181303734) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181303734) (:by |u0)
                        :type :expr
                        :at 1633181303734
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181303734) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181303734) (:by |u0)
                        :type :expr
                        :at 1633181303734
                        :by |u0
                    :type :expr
                    :at 1633181303734
                    :by |u0
                  |r $ {} (:text "|\"stringify_json") (:type :leaf) (:at 1633186337203) (:by |u0)
                  |v $ {} (:text |data) (:type :leaf) (:at 1633181320287) (:by |u0)
                  |x $ {} (:text |colon?) (:type :leaf) (:at 1633181322417) (:by |u0)
                :type :expr
                :at 1633181303734
                :by |u0
            :type :expr
            :at 1633168514525
            :by |u0
          |parse-json $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633168511255) (:by |u0)
              |j $ {} (:text |parse-json) (:type :leaf) (:at 1633168511255) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |s) (:type :leaf) (:at 1633181287593) (:by |u0)
                :type :expr
                :at 1633168511255
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253299123) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1633181276583) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |T $ {} (:text |or-current-path) (:type :leaf) (:at 1633181276583) (:by |u0)
                          |j $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181276583) (:by |u0)
                        :type :expr
                        :at 1633181276583
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1633181276583) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181276583) (:by |u0)
                        :type :expr
                        :at 1633181276583
                        :by |u0
                    :type :expr
                    :at 1633181276583
                    :by |u0
                  |r $ {} (:text "|\"parse_json") (:type :leaf) (:at 1633184660110) (:by |u0)
                  |v $ {} (:text |s) (:type :leaf) (:at 1633181297499) (:by |u0)
                :type :expr
                :at 1633181276583
                :by |u0
            :type :expr
            :at 1633168511255
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633168388260
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633168388260) (:by |u0)
            |j $ {} (:text |calcit.std.json) (:type :leaf) (:at 1633168388260) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633181160126) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.$meta) (:type :leaf) (:at 1633181160126) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181160126) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1633181160126) (:by |u0)
                      :type :expr
                      :at 1633181160126
                      :by |u0
                  :type :expr
                  :at 1633181160126
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.util) (:type :leaf) (:at 1633181160126) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181160126) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181160126) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181160126) (:by |u0)
                      :type :expr
                      :at 1633181160126
                      :by |u0
                  :type :expr
                  :at 1633181160126
                  :by |u0
              :type :expr
              :at 1633181160126
              :by |u0
          :type :expr
          :at 1633168388260
          :by |u0
      |calcit.std.test $ {}
        :defs $ {}
          |run-tests $ {}
            :data $ {}
              |yT $ {}
                :data $ {}
                  |T $ {} (:text |regex/main!) (:type :leaf) (:at 1633181825110) (:by |u0)
                :type :expr
                :at 1633150013372
                :by |u0
              |T $ {} (:text |defn) (:type :leaf) (:at 1633150011172) (:by |u0)
              |j $ {} (:text |run-tests) (:type :leaf) (:at 1633150008092) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633150008092
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |fs/main!) (:type :leaf) (:at 1633150016087) (:by |u0)
                :type :expr
                :at 1633150013372
                :by |u0
              |w $ {}
                :data $ {}
                  |T $ {} (:text |json/main!) (:type :leaf) (:at 1633184626490) (:by |u0)
                :type :expr
                :at 1633184626490
                :by |u0
              |x $ {}
                :data $ {}
                  |T $ {} (:text |date/main!) (:type :leaf) (:at 1633181819102) (:by |u0)
                :type :expr
                :at 1633150013372
                :by |u0
            :type :expr
            :at 1633150008092
            :by |u0
          |main! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633149996242) (:by |u0)
              |j $ {} (:text |main!) (:type :leaf) (:at 1633149996242) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633149996242
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |run-tests) (:type :leaf) (:at 1633150004371) (:by |u0)
                :type :expr
                :at 1633150002066
                :by |u0
            :type :expr
            :at 1633149996242
            :by |u0
          |reload! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633149998862) (:by |u0)
              |j $ {} (:text |reload!) (:type :leaf) (:at 1633149998862) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633149998862
                :by |u0
            :type :expr
            :at 1633149998862
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633149625774
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633149625774) (:by |u0)
            |j $ {} (:text |calcit.std.test) (:type :leaf) (:at 1633149625774) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633149975596) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.test.fs) (:type :leaf) (:at 1633149981735) (:by |u0)
                    |j $ {} (:text |:as) (:type :leaf) (:at 1633149982715) (:by |u0)
                    |r $ {} (:text |fs) (:type :leaf) (:at 1633149984197) (:by |u0)
                  :type :expr
                  :at 1633149976294
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.test.date) (:type :leaf) (:at 1633181791700) (:by |u0)
                    |j $ {} (:text |:as) (:type :leaf) (:at 1633149982715) (:by |u0)
                    |r $ {} (:text |date) (:type :leaf) (:at 1633181793307) (:by |u0)
                  :type :expr
                  :at 1633149976294
                  :by |u0
                |v $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.test.regex) (:type :leaf) (:at 1633181795555) (:by |u0)
                    |j $ {} (:text |:as) (:type :leaf) (:at 1633149982715) (:by |u0)
                    |r $ {} (:text |regex) (:type :leaf) (:at 1633181797342) (:by |u0)
                  :type :expr
                  :at 1633149976294
                  :by |u0
                |x $ {}
                  :data $ {}
                    |T $ {} (:text |calcit.std.test.json) (:type :leaf) (:at 1633181803641) (:by |u0)
                    |j $ {} (:text |:as) (:type :leaf) (:at 1633149982715) (:by |u0)
                    |r $ {} (:text |json) (:type :leaf) (:at 1633181805611) (:by |u0)
                  :type :expr
                  :at 1633149976294
                  :by |u0
              :type :expr
              :at 1633149974572
              :by |u0
          :type :expr
          :at 1633149625774
          :by |u0
      |calcit.std.util $ {}
        :defs $ {}
          |get-dylib-ext $ {}
            :data $ {}
              |T $ {} (:text |defmacro) (:type :leaf) (:at 1630231418304) (:by |u0)
              |j $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181058353) (:by |u0)
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
          |or-current-path $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630245583936) (:by |u0)
              |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181131099) (:by |u0)
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
          :at 1633181044360
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633181044360) (:by |u0)
            |j $ {} (:text |calcit.std.util) (:type :leaf) (:at 1633181044360) (:by |u0)
          :type :expr
          :at 1633181044360
          :by |u0
      |calcit.std.test.fs $ {}
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
                  |b $ {} (:text "|\"dirs:") (:type :leaf) (:at 1633252168827) (:by |u0)
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
              |t $ {}
                :data $ {}
                  |T $ {} (:text |println) (:type :leaf) (:at 1633182664163) (:by |u0)
                  |j $ {} (:text "|\"%%%% test for fs") (:type :leaf) (:at 1633182672402) (:by |u0)
                :type :expr
                :at 1633182663238
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
                      |D $ {} (:text |>) (:type :leaf) (:at 1633182642813) (:by |u0)
                      |T $ {}
                        :data $ {}
                          |D $ {} (:text |count) (:type :leaf) (:at 1633182646850) (:by |u0)
                          |T $ {}
                            :data $ {}
                              |T $ {} (:text |read-file!) (:type :leaf) (:at 1630176262288) (:by |u0)
                              |j $ {} (:text "|\"README.md") (:type :leaf) (:at 1630245682315) (:by |u0)
                            :type :expr
                            :at 1630176241192
                            :by |u0
                        :type :expr
                        :at 1633182643577
                        :by |u0
                      |j $ {} (:text |1000) (:type :leaf) (:at 1633182648511) (:by |u0)
                    :type :expr
                    :at 1633182641636
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
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1630174670374
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1630174670374) (:by |u0)
            |j $ {} (:text |calcit.std.test.fs) (:type :leaf) (:at 1630174670374) (:by |u0)
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
