
{} (:package |calcit.std)
  :configs $ {} (:init-fn |calcit.std.test/main!) (:port 6001) (:reload-fn |calcit.std.test/reload!) (:version |0.2.5)
    :modules $ []
  :entries $ {}
  :files $ {}
    |calcit.std.date $ %{} :FileEntry
      :defs $ {}
        |Date $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636967181600) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636967184614) (:by |u0) (:text |defrecord!)
              |j $ %{} :Leaf (:at 1636967181600) (:by |u0) (:text |Date)
              |r $ %{} :Expr (:at 1636967181600) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967201359) (:by |u0) (:text |:now)
                  |j $ %{} :Leaf (:at 1636967255234) (:by |u0) (:text |get-time!)
              |t $ %{} :Expr (:at 1636967296013) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967297005) (:by |u0) (:text |:parse)
                  |j $ %{} :Leaf (:at 1636967299018) (:by |u0) (:text |parse-time)
              |u $ %{} :Expr (:at 1636967303839) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967308435) (:by |u0) (:text |:timestamp)
                  |j $ %{} :Leaf (:at 1636967311738) (:by |u0) (:text |get-timestamp)
              |v $ %{} :Expr (:at 1636967257838) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967261665) (:by |u0) (:text |:add)
                  |j $ %{} :Leaf (:at 1636967268260) (:by |u0) (:text |add-duration)
              |x $ %{} :Expr (:at 1636967268790) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967269860) (:by |u0) (:text |:format)
                  |j $ %{} :Leaf (:at 1636967272136) (:by |u0) (:text |format-time)
              |y $ %{} :Expr (:at 1636967321046) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967323323) (:by |u0) (:text |:from-ymd)
                  |j $ %{} :Leaf (:at 1636967326637) (:by |u0) (:text |from-ymd)
              |yT $ %{} :Expr (:at 1636967328016) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967329600) (:by |u0) (:text |:from-ywd)
                  |j $ %{} :Leaf (:at 1636967331703) (:by |u0) (:text |from-ywd)
              |yj $ %{} :Expr (:at 1636967339101) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967342266) (:by |u0) (:text |:extract)
                  |j $ %{} :Leaf (:at 1636967344062) (:by |u0) (:text |extract-time)
        |add-duration $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636966236963) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636966236963) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636966236963) (:by |u0) (:text |add-duration)
              |r $ %{} :Expr (:at 1636966236963) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636966267425) (:by |u0) (:text |date)
                  |j $ %{} :Leaf (:at 1636966242904) (:by |u0) (:text |n)
                  |r $ %{} :Leaf (:at 1636966247454) (:by |u0) (:text |k)
              |v $ %{} :Expr (:at 1636967728074) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1685292572645) (:by |u0) (:text |%::)
                  |L $ %{} :Leaf (:at 1636967729484) (:by |u0) (:text |Date)
                  |P $ %{} :Leaf (:at 1685292574826) (:by |u0) (:text |:date)
                  |T $ %{} :Expr (:at 1636966254514) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636966254514) (:by |u0) (:text |&call-dylib-edn)
                      |j $ %{} :Expr (:at 1636966254514) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636966254514) (:by |u0) (:text |get-dylib-path)
                          |j $ %{} :Leaf (:at 1636966254514) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                      |r $ %{} :Leaf (:at 1636966261964) (:by |u0) (:text "|\"add_duration")
                      |v $ %{} :Expr (:at 1636967722334) (:by |u0)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1636967725923) (:by |u0) (:text |nth)
                          |T $ %{} :Leaf (:at 1636966269212) (:by |u0) (:text |date)
                          |j $ %{} :Leaf (:at 1636967726909) (:by |u0) (:text |1)
                      |x $ %{} :Leaf (:at 1636966264462) (:by |u0) (:text |n)
                      |y $ %{} :Leaf (:at 1636966265224) (:by |u0) (:text |k)
        |extract-time $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636560278671) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636560278671) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636560458454) (:by |u0) (:text |extract-time)
              |n $ %{} :Expr (:at 1636560289998) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636560291416) (:by |u0) (:text |x)
              |p $ %{} :Expr (:at 1636560292500) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636560292500) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636560292500) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636560292500) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636560292500) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636560461828) (:by |u0) (:text "|\"extract_time")
                  |v $ %{} :Expr (:at 1636967761072) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1636967762505) (:by |u0) (:text |nth)
                      |T $ %{} :Leaf (:at 1636560295035) (:by |u0) (:text |x)
                      |j $ %{} :Leaf (:at 1636967764117) (:by |u0) (:text |1)
        |format-time $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633168497249) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633168497249) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633168497249) (:by |u0) (:text |format-time)
              |r $ %{} :Expr (:at 1633168497249) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181223261) (:by |u0) (:text |time)
                  |b $ %{} :Leaf (:at 1633181977855) (:by |u0) (:text |?)
                  |j $ %{} :Leaf (:at 1633181224266) (:by |u0) (:text |format)
              |v $ %{} :Expr (:at 1633181205882) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253280420) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220768381) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220768675) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220771306) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1633181229605) (:by |u0) (:text "|\"format_time")
                  |v $ %{} :Expr (:at 1636967739083) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1636967741706) (:by |u0) (:text |nth)
                      |T $ %{} :Leaf (:at 1633181240264) (:by |u0) (:text |time)
                      |j $ %{} :Leaf (:at 1636967744890) (:by |u0) (:text |1)
                  |x $ %{} :Leaf (:at 1633181241023) (:by |u0) (:text |format)
        |from-ymd $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636792849064) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636792849064) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636792849064) (:by |u0) (:text |from-ymd)
              |r $ %{} :Expr (:at 1636792859991) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636792866053) (:by |u0) (:text |y)
                  |b $ %{} :Leaf (:at 1636792866286) (:by |u0) (:text |m)
                  |f $ %{} :Leaf (:at 1636792866663) (:by |u0) (:text |d)
              |v $ %{} :Expr (:at 1636968106841) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1685292757658) (:by |u0) (:text |tag-match)
                  |T $ %{} :Expr (:at 1636792859991) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636792859991) (:by |u0) (:text |&call-dylib-edn)
                      |j $ %{} :Expr (:at 1636792859991) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636792859991) (:by |u0) (:text |get-dylib-path)
                          |j $ %{} :Leaf (:at 1636792859991) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                      |r $ %{} :Leaf (:at 1636792874467) (:by |u0) (:text "|\"from_ymd")
                      |v $ %{} :Leaf (:at 1636792877119) (:by |u0) (:text |y)
                      |x $ %{} :Leaf (:at 1636792877393) (:by |u0) (:text |m)
                      |y $ %{} :Leaf (:at 1636792877794) (:by |u0) (:text |d)
                  |j $ %{} :Expr (:at 1636968109561) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968110518) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968113327) (:by |u0) (:text |:single)
                          |j $ %{} :Leaf (:at 1636968113748) (:by |u0) (:text |d)
                      |j $ %{} :Expr (:at 1636968114228) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1685292532289) (:by |u0) (:text |%::)
                          |j $ %{} :Leaf (:at 1636968116179) (:by |u0) (:text |Date)
                          |n $ %{} :Leaf (:at 1685292535029) (:by |u0) (:text |:date)
                          |r $ %{} :Leaf (:at 1636968116550) (:by |u0) (:text |d)
                  |r $ %{} :Expr (:at 1636968117650) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968118512) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968158769) (:by |u0) (:text |:ambiguous)
                          |j $ %{} :Leaf (:at 1636968159396) (:by |u0) (:text |a)
                          |r $ %{} :Leaf (:at 1636968159794) (:by |u0) (:text |b)
                      |j $ %{} :Expr (:at 1636968160579) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968168002) (:by |u0) (:text |raise)
                          |j $ %{} :Expr (:at 1636968168672) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636968169186) (:by |u0) (:text |str)
                              |j $ %{} :Leaf (:at 1636968175747) (:by |u0) (:text "|\"ambiguous: ")
                              |r $ %{} :Leaf (:at 1636968176381) (:by |u0) (:text |a)
                              |v $ %{} :Leaf (:at 1636968177920) (:by |u0) (:text "|\" ")
                              |x $ %{} :Leaf (:at 1636968179607) (:by |u0) (:text |b)
                  |v $ %{} :Expr (:at 1636968182303) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968185013) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968190530) (:by |u0) (:text |:none)
                      |j $ %{} :Expr (:at 1636968192705) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968195147) (:by |u0) (:text |raise)
                          |j $ %{} :Leaf (:at 1636968200201) (:by |u0) (:text "|\"cannot construct")
                  |x $ %{} :Expr (:at 1636968204139) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636968204584) (:by |u0) (:text |_)
                      |j $ %{} :Expr (:at 1636968205155) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968205753) (:by |u0) (:text |raise)
                          |j $ %{} :Leaf (:at 1636968209667) (:by |u0) (:text "|\"unreachable!")
        |from-ywd $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636792882847) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636792884055) (:by |u0) (:text |from-ywd)
              |r $ %{} :Expr (:at 1636792882847) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |y)
                  |j $ %{} :Leaf (:at 1636792885472) (:by |u0) (:text |w)
                  |r $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |d)
              |v $ %{} :Expr (:at 1636967753455) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1685292761880) (:by |u0) (:text |tag-match)
                  |T $ %{} :Expr (:at 1636792882847) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |&call-dylib-edn)
                      |j $ %{} :Expr (:at 1636792882847) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |get-dylib-path)
                          |j $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                      |r $ %{} :Leaf (:at 1636792888828) (:by |u0) (:text "|\"from_ywd")
                      |v $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |y)
                      |x $ %{} :Leaf (:at 1636792887436) (:by |u0) (:text |w)
                      |y $ %{} :Leaf (:at 1636792882847) (:by |u0) (:text |d)
                  |j $ %{} :Expr (:at 1636968332320) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968333293) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968334717) (:by |u0) (:text |:single)
                          |j $ %{} :Leaf (:at 1636968335770) (:by |u0) (:text |d)
                      |j $ %{} :Expr (:at 1636968336677) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1685292540377) (:by |u0) (:text |%::)
                          |b $ %{} :Leaf (:at 1636968345339) (:by |u0) (:text |Date)
                          |f $ %{} :Leaf (:at 1685292542748) (:by |u0) (:text |:date)
                          |j $ %{} :Leaf (:at 1636968338015) (:by |u0) (:text |d)
                  |r $ %{} :Expr (:at 1636968346328) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968347088) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968350727) (:by |u0) (:text |:ambiguous)
                          |j $ %{} :Leaf (:at 1636968352508) (:by |u0) (:text |a)
                          |r $ %{} :Leaf (:at 1636968352896) (:by |u0) (:text |b)
                      |j $ %{} :Expr (:at 1636968353590) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968356344) (:by |u0) (:text |raise)
                          |j $ %{} :Expr (:at 1636968356701) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636968357817) (:by |u0) (:text |str)
                              |j $ %{} :Leaf (:at 1636968369625) (:by |u0) (:text "|\"ambiguous: ")
                              |r $ %{} :Leaf (:at 1636968359500) (:by |u0) (:text |a)
                              |t $ %{} :Leaf (:at 1636968361351) (:by |u0) (:text "|\" ")
                              |v $ %{} :Leaf (:at 1636968359916) (:by |u0) (:text |b)
                  |v $ %{} :Expr (:at 1636968371191) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968375873) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968376732) (:by |u0) (:text |:none)
                      |j $ %{} :Expr (:at 1636968377724) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968381510) (:by |u0) (:text |raise)
                          |j $ %{} :Leaf (:at 1636968396361) (:by |u0) (:text "|\"cannot construct")
                  |x $ %{} :Expr (:at 1636968397704) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636968399546) (:by |u0) (:text |_)
                      |j $ %{} :Expr (:at 1636968399870) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968403443) (:by |u0) (:text |raise)
                          |j $ %{} :Leaf (:at 1636968407933) (:by |u0) (:text "|\"unreachable!")
        |get-time! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633168502797) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633168502797) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633168502797) (:by |u0) (:text |get-time!)
              |r $ %{} :Expr (:at 1633168502797) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1636967668354) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1685292584740) (:by |u0) (:text |%::)
                  |L $ %{} :Leaf (:at 1636967678741) (:by |u0) (:text |Date)
                  |P $ %{} :Leaf (:at 1685292586795) (:by |u0) (:text |:date)
                  |T $ %{} :Expr (:at 1633168770408) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633253286256) (:by |u0) (:text |&call-dylib-edn)
                      |b $ %{} :Expr (:at 1635220782278) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1635220782559) (:by |u0) (:text |get-dylib-path)
                          |j $ %{} :Leaf (:at 1635220784327) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                      |r $ %{} :Leaf (:at 1633181993466) (:by |u0) (:text "|\"now_bang")
        |get-timestamp $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636967154593) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636967154593) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636967154593) (:by |u0) (:text |get-timestamp)
              |r $ %{} :Expr (:at 1636967156785) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967156785) (:by |u0) (:text |date)
              |v $ %{} :Expr (:at 1636967156785) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967156785) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636967156785) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636967156785) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636967156785) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636967168461) (:by |u0) (:text "|\"get_timestamp")
                  |v $ %{} :Expr (:at 1636967715139) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1636967716897) (:by |u0) (:text |nth)
                      |T $ %{} :Leaf (:at 1636967156785) (:by |u0) (:text |date)
                      |j $ %{} :Leaf (:at 1636967717888) (:by |u0) (:text |1)
        |parse-time $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633168493152) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633168493152) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633168493152) (:by |u0) (:text |parse-time)
              |r $ %{} :Expr (:at 1633168493152) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181254551) (:by |u0) (:text |time)
                  |j $ %{} :Leaf (:at 1633181255231) (:by |u0) (:text |format)
              |v $ %{} :Expr (:at 1636967697950) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1685292595409) (:by |u0) (:text |%::)
                  |L $ %{} :Leaf (:at 1636967700672) (:by |u0) (:text |Date)
                  |P $ %{} :Leaf (:at 1685292597705) (:by |u0) (:text |:date)
                  |T $ %{} :Expr (:at 1633181255929) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633253289856) (:by |u0) (:text |&call-dylib-edn)
                      |b $ %{} :Expr (:at 1635220791280) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1635220790930) (:by |u0) (:text |get-dylib-path)
                          |j $ %{} :Leaf (:at 1635220793173) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                      |r $ %{} :Leaf (:at 1633181261272) (:by |u0) (:text "|\"parse_time")
                      |v $ %{} :Leaf (:at 1633181264402) (:by |u0) (:text |time)
                      |x $ %{} :Leaf (:at 1633181265382) (:by |u0) (:text |format)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633168354404) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633168354404) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633168354404) (:by |u0) (:text |calcit.std.date)
            |r $ %{} :Expr (:at 1633168759503) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633168760266) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633168760630) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633168760630) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1633168760630) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633168760630) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1633168760630) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1633181151756) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181151756) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1633181151756) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633181151756) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220775131) (:by |u0) (:text |get-dylib-path)
    |calcit.std.fs $ %{} :FileEntry
      :defs $ {}
        |append-file! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1679453818235) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1679453818235) (:by |u0) (:text |defn)
              |b $ %{} :Leaf (:at 1679453818235) (:by |u0) (:text |append-file!)
              |h $ %{} :Expr (:at 1679453827292) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text |name)
                  |b $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text |content)
              |l $ %{} :Expr (:at 1679453827292) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1679453827292) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text |get-dylib-path)
                      |b $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |h $ %{} :Leaf (:at 1679453834365) (:by |u0) (:text "|\"append_file")
                  |l $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text |name)
                  |o $ %{} :Leaf (:at 1679453827292) (:by |u0) (:text |content)
        |check-write-file! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636559397887) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636559401158) (:by |u0) (:text |check-write-file!)
              |r $ %{} :Expr (:at 1636559397887) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |name)
                  |j $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |content)
              |v $ %{} :Expr (:at 1636559397887) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636559397887) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636559404373) (:by |u0) (:text "|\"check_write_file")
                  |v $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |name)
                  |x $ %{} :Leaf (:at 1636559397887) (:by |u0) (:text |content)
        |create-dir! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636552743342) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636552743342) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636552743342) (:by |u0) (:text |create-dir!)
              |r $ %{} :Expr (:at 1636552746319) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636552746319) (:by |u0) (:text |name)
              |v $ %{} :Expr (:at 1636552746319) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636552746319) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636552746319) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636552746319) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636552746319) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636552755308) (:by |u0) (:text "|\"create_dir")
                  |v $ %{} :Leaf (:at 1636552746319) (:by |u0) (:text |name)
        |create-dir-all! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636552822494) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636552822494) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636552822494) (:by |u0) (:text |create-dir-all!)
              |r $ %{} :Expr (:at 1636552824361) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636552824361) (:by |u0) (:text |name)
              |v $ %{} :Expr (:at 1636552824361) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636552824361) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636552824361) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636552824361) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636552824361) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636552908780) (:by |u0) (:text "|\"create_dir_all")
                  |v $ %{} :Leaf (:at 1636552824361) (:by |u0) (:text |name)
        |glob! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1673542966298) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1673542966298) (:by |u0) (:text |defn)
              |b $ %{} :Leaf (:at 1673542966298) (:by |u0) (:text |glob!)
              |l $ %{} :Expr (:at 1673542969091) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1673542969091) (:by |u0) (:text |name)
              |o $ %{} :Expr (:at 1673542969091) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1673542969091) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1673542969091) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1673542969091) (:by |u0) (:text |get-dylib-path)
                      |b $ %{} :Leaf (:at 1673542969091) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |h $ %{} :Leaf (:at 1673543522071) (:by |u0) (:text "|\"glob_call")
                  |l $ %{} :Leaf (:at 1673542969091) (:by |u0) (:text |name)
        |path-exists? $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630219258753) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630219258753) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1630219258753) (:by |u0) (:text |path-exists?)
              |r $ %{} :Expr (:at 1630219268038) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630219268038) (:by |u0) (:text |name)
              |v $ %{} :Expr (:at 1630219268038) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253263271) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220806002) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220806407) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220808067) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1630219282714) (:by |u0) (:text "|\"path_exists")
                  |v $ %{} :Leaf (:at 1630219268038) (:by |u0) (:text |name)
        |read-dir! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630224735170) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630224735170) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1630224735170) (:by |u0) (:text |read-dir!)
              |r $ %{} :Expr (:at 1630224735170) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630224746580) (:by |u0) (:text |name)
              |v $ %{} :Expr (:at 1631164877698) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253257459) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220814122) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220814427) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220816762) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1631164877698) (:by |u0) (:text "|\"read_dir")
                  |v $ %{} :Leaf (:at 1631164877698) (:by |u0) (:text |name)
        |read-file! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630171370222) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630171370222) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1630171370222) (:by |u0) (:text |read-file!)
              |r $ %{} :Expr (:at 1630171370222) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630171376091) (:by |u0) (:text |name)
              |v $ %{} :Expr (:at 1630171376690) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253268620) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220823192) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220823513) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220825098) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |n $ %{} :Leaf (:at 1630176304763) (:by |u0) (:text "|\"read_file")
                  |r $ %{} :Leaf (:at 1630171465347) (:by |u0) (:text |name)
        |read-file-by-line! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1688447271554) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1688447271554) (:by |u0) (:text |defn)
              |b $ %{} :Leaf (:at 1688447422938) (:by |u0) (:text |read-file-by-line!)
              |h $ %{} :Expr (:at 1688447278540) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1688447278540) (:by |u0) (:text |name)
                  |b $ %{} :Leaf (:at 1688447303653) (:by |u0) (:text |cb)
              |l $ %{} :Expr (:at 1688447278540) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1688448703272) (:by |u0) (:text |&blocking-dylib-edn-fn)
                  |b $ %{} :Expr (:at 1688447278540) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1688447278540) (:by |u0) (:text |get-dylib-path)
                      |b $ %{} :Leaf (:at 1688447278540) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |h $ %{} :Leaf (:at 1688447428492) (:by |u0) (:text "|\"read_file_by_line")
                  |l $ %{} :Leaf (:at 1688447278540) (:by |u0) (:text |name)
                  |o $ %{} :Leaf (:at 1688447312392) (:by |u0) (:text |cb)
        |rename! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636553285707) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636553285707) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636553285707) (:by |u0) (:text |rename!)
              |r $ %{} :Expr (:at 1636553287371) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636553291902) (:by |u0) (:text |from)
                  |j $ %{} :Leaf (:at 1636553292213) (:by |u0) (:text |to)
              |v $ %{} :Expr (:at 1636553287371) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636553287371) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636553287371) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636553287371) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636553287371) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636553366268) (:by |u0) (:text "|\"rename_path")
                  |v $ %{} :Leaf (:at 1636553295788) (:by |u0) (:text |from)
                  |x $ %{} :Leaf (:at 1636553296107) (:by |u0) (:text |to)
        |walk-dir! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1672681238594) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1672681238594) (:by |u0) (:text |defn)
              |b $ %{} :Leaf (:at 1672681286894) (:by |u0) (:text |walk-dir!)
              |h $ %{} :Expr (:at 1672681246880) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1672681246880) (:by |u0) (:text |name)
              |l $ %{} :Expr (:at 1672681246880) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1672681246880) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1672681246880) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1672681246880) (:by |u0) (:text |get-dylib-path)
                      |b $ %{} :Leaf (:at 1672681246880) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |h $ %{} :Leaf (:at 1672681289573) (:by |u0) (:text "|\"walk_dir")
                  |l $ %{} :Leaf (:at 1672681246880) (:by |u0) (:text |name)
        |write-file! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630171482098) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630171482098) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1630171482098) (:by |u0) (:text |write-file!)
              |r $ %{} :Expr (:at 1630171482098) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630171486803) (:by |u0) (:text |name)
                  |j $ %{} :Leaf (:at 1630171487824) (:by |u0) (:text |content)
              |v $ %{} :Expr (:at 1630171491979) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253266538) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220844025) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220844329) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220846470) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |n $ %{} :Leaf (:at 1630176312321) (:by |u0) (:text "|\"write_file")
                  |r $ %{} :Leaf (:at 1630171491979) (:by |u0) (:text |name)
                  |v $ %{} :Leaf (:at 1630171494451) (:by |u0) (:text |content)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1630171366222) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1630171366222) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1630171366222) (:by |u0) (:text |calcit.std.fs)
            |r $ %{} :Expr (:at 1630175118985) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1630175119637) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1630175120856) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1630175125976) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1630175127717) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1630175128076) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1630175130627) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1633181140100) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181140100) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1633181140100) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633181140100) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220832816) (:by |u0) (:text |get-dylib-path)
    |calcit.std.hash $ %{} :FileEntry
      :defs $ {}
        |md5 $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635220490864) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635220490864) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635220490864) (:by |u0) (:text |md5)
              |r $ %{} :Expr (:at 1635220498556) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635220498556) (:by |u0) (:text |s)
              |v $ %{} :Expr (:at 1635220498556) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635220498556) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220734199) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220737683) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220739344) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1635220504848) (:by |u0) (:text "|\"md5")
                  |v $ %{} :Leaf (:at 1635220498556) (:by |u0) (:text |s)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1635220487680) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1635220487680) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1635220487680) (:by |u0) (:text |calcit.std.hash)
            |r $ %{} :Expr (:at 1635220595836) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1635220595836) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1635220595836) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635220595836) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1635220595836) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635220595836) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220595836) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1635220595836) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635220595836) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1635220595836) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635220595836) (:by |u0)
                      :data $ {}
                        |r $ %{} :Leaf (:at 1635220746259) (:by |u0) (:text |get-dylib-path)
    |calcit.std.json $ %{} :FileEntry
      :defs $ {}
        |parse-json $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633168511255) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633168511255) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633168511255) (:by |u0) (:text |parse-json)
              |r $ %{} :Expr (:at 1633168511255) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181287593) (:by |u0) (:text |s)
              |v $ %{} :Expr (:at 1633181276583) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253299123) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220856435) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220856713) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220857947) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1633184660110) (:by |u0) (:text "|\"parse_json")
                  |v $ %{} :Leaf (:at 1633181297499) (:by |u0) (:text |s)
        |stringify-json $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633168514525) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633168514525) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633168514525) (:by |u0) (:text |stringify-json)
              |r $ %{} :Expr (:at 1633168514525) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181304978) (:by |u0) (:text |data)
                  |b $ %{} :Leaf (:at 1633181971377) (:by |u0) (:text |?)
                  |j $ %{} :Leaf (:at 1633181309855) (:by |u0) (:text |colon?)
              |v $ %{} :Expr (:at 1633181303734) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253302295) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220866916) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220867182) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220869351) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1633186337203) (:by |u0) (:text "|\"stringify_json")
                  |v $ %{} :Leaf (:at 1633181320287) (:by |u0) (:text |data)
                  |x $ %{} :Leaf (:at 1633181322417) (:by |u0) (:text |colon?)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633168388260) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633168388260) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633168388260) (:by |u0) (:text |calcit.std.json)
            |r $ %{} :Expr (:at 1633181160126) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633181160126) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633181160126) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181160126) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1633181160126) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633181160126) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1633181160126) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1633181160126) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181160126) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1633181160126) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633181160126) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220862556) (:by |u0) (:text |get-dylib-path)
    |calcit.std.path $ %{} :FileEntry
      :defs $ {}
        |join-path $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636556313098) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636556313098) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636556313098) (:by |u0) (:text |join-path)
              |r $ %{} :Expr (:at 1636556313098) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636556322663) (:by |u0) (:text |&)
                  |j $ %{} :Leaf (:at 1636556323221) (:by |u0) (:text |xs)
              |v $ %{} :Expr (:at 1636556328855) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636556328855) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636556328855) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636556328855) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636556328855) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636556336521) (:by |u0) (:text "|\"join_path")
                  |v $ %{} :Leaf (:at 1636556337922) (:by |u0) (:text |&)
                  |x $ %{} :Leaf (:at 1636556339654) (:by |u0) (:text |xs)
        |path-basename $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636558665896) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636558665896) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636558665896) (:by |u0) (:text |path-basename)
              |r $ %{} :Expr (:at 1636558674612) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636558678743) (:by |u0) (:text |x)
              |v $ %{} :Expr (:at 1636558674612) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636558674612) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636558674612) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636558674612) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636558674612) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636558783396) (:by |u0) (:text "|\"path_basename")
                  |v $ %{} :Leaf (:at 1636558690631) (:by |u0) (:text |x)
        |path-dirname $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636558650046) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636558650046) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636558650046) (:by |u0) (:text |path-dirname)
              |r $ %{} :Expr (:at 1636558695026) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636558695026) (:by |u0) (:text |x)
              |v $ %{} :Expr (:at 1636558695026) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636558695026) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636558695026) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636558695026) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636558695026) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636558787441) (:by |u0) (:text "|\"path_dirname")
                  |v $ %{} :Leaf (:at 1636558695026) (:by |u0) (:text |x)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1636556244867) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1636556244867) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1636556244867) (:by |u0) (:text |calcit.std.path)
            |r $ %{} :Expr (:at 1636556291572) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1636556291572) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1636556291572) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1636556291572) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1636556291572) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636556291572) (:by |u0) (:text |get-dylib-path)
    |calcit.std.process $ %{} :FileEntry
      :defs $ {}
        |execute! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630233671273) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630233671273) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1630233687823) (:by |u0) (:text |execute!)
              |v $ %{} :Expr (:at 1630233691235) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630233700999) (:by |u0) (:text |command)
                  |b $ %{} :Leaf (:at 1630233702596) (:by |u0) (:text |?)
                  |j $ %{} :Leaf (:at 1630233701886) (:by |u0) (:text |dir)
              |w $ %{} :Expr (:at 1630234479391) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630234480547) (:by |u0) (:text |assert)
                  |j $ %{} :Leaf (:at 1630234486571) (:by |u0) (:text "|\"command in list")
                  |r $ %{} :Expr (:at 1630234493500) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1630234495001) (:by |u0) (:text |and)
                      |T $ %{} :Expr (:at 1630234488772) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1630234491417) (:by |u0) (:text |list?)
                          |j $ %{} :Leaf (:at 1630234492926) (:by |u0) (:text |command)
                      |j $ %{} :Expr (:at 1630234495683) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1630234498652) (:by |u0) (:text |every?)
                          |j $ %{} :Leaf (:at 1630234500190) (:by |u0) (:text |command)
                          |r $ %{} :Leaf (:at 1630234501757) (:by |u0) (:text |string?)
              |x $ %{} :Expr (:at 1630233743657) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633253274875) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220881209) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220881501) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220883082) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1630233743657) (:by |u0) (:text "|\"execute_command")
                  |s $ %{} :Expr (:at 1631166907802) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1631166907802) (:by |u0) (:text |either)
                      |j $ %{} :Leaf (:at 1631166907802) (:by |u0) (:text |dir)
                      |r $ %{} :Leaf (:at 1631166907802) (:by |u0) (:text "|\"./")
                  |t $ %{} :Leaf (:at 1631164907902) (:by |u0) (:text |command)
        |on-ctrl-c $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635175970470) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635175970470) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635175975229) (:by |u0) (:text |on-ctrl-c)
              |r $ %{} :Expr (:at 1635175970470) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635176036328) (:by |u0) (:text |f)
              |v $ %{} :Expr (:at 1635176024086) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635176033216) (:by |u0) (:text |&call-dylib-edn-fn)
                  |b $ %{} :Expr (:at 1635220895031) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220895334) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220896873) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1635176045304) (:by |u0) (:text "|\"on_ctrl_c")
                  |v $ %{} :Leaf (:at 1635176047010) (:by |u0) (:text |f)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1630233659635) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1630233659635) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1630233659635) (:by |u0) (:text |calcit.std.process)
            |r $ %{} :Expr (:at 1630234563918) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1630234563918) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1630234563918) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1630234563918) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1630234563918) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1630234563918) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1630234563918) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1630234680982) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181115150) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1630234680982) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1630234680982) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220886442) (:by |u0) (:text |get-dylib-path)
    |calcit.std.rand $ %{} :FileEntry
      :defs $ {}
        |nanoid! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633344066690) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633344066690) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633344066690) (:by |u0) (:text |nanoid!)
              |r $ %{} :Expr (:at 1633344069288) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344069288) (:by |u0) (:text |?)
                  |j $ %{} :Leaf (:at 1633344289875) (:by |u0) (:text |size)
                  |r $ %{} :Leaf (:at 1633344291909) (:by |u0) (:text |chars)
              |v $ %{} :Expr (:at 1633344069288) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344069288) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220913739) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220914029) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220915717) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1633344271797) (:by |u0) (:text "|\"call_nanoid")
                  |v $ %{} :Leaf (:at 1633344294685) (:by |u0) (:text |size)
                  |x $ %{} :Leaf (:at 1633344296969) (:by |u0) (:text |chars)
        |rand $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633343988409) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633343988409) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633343988409) (:by |u0) (:text |rand)
              |v $ %{} :Expr (:at 1633344011182) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1633344028427) (:by |u0) (:text |?)
                  |T $ %{} :Leaf (:at 1633344023646) (:by |u0) (:text |from)
                  |j $ %{} :Leaf (:at 1633344025484) (:by |u0) (:text |to)
              |x $ %{} :Expr (:at 1633344011182) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344011182) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220922099) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220922368) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220923924) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1633344036924) (:by |u0) (:text "|\"rand")
                  |v $ %{} :Leaf (:at 1633344033560) (:by |u0) (:text |from)
                  |x $ %{} :Leaf (:at 1633344033993) (:by |u0) (:text |to)
        |rand-between $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633344347956) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633344352367) (:by |u0) (:text |rand-between)
              |r $ %{} :Expr (:at 1633344347956) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |x)
                  |j $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |y)
              |v $ %{} :Expr (:at 1633344347956) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |&+)
                  |j $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |x)
                  |r $ %{} :Expr (:at 1633344347956) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |rand)
                      |j $ %{} :Expr (:at 1633344347956) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |&-)
                          |j $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |y)
                          |r $ %{} :Leaf (:at 1633344347956) (:by |u0) (:text |x)
        |rand-hex-color! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636711454257) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636711454257) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636711454257) (:by |u0) (:text |rand-hex-color!)
              |r $ %{} :Expr (:at 1636711454257) (:by |u0)
                :data $ {}
              |x $ %{} :Expr (:at 1636711461043) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636711461043) (:by |u0) (:text |&call-dylib-edn)
                  |j $ %{} :Expr (:at 1636711461043) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636711461043) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1636711461043) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1636711475178) (:by |u0) (:text "|\"rand_hex_color")
        |rand-int $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633343990667) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633343990667) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633343990667) (:by |u0) (:text |rand-int)
              |v $ %{} :Expr (:at 1633344047273) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344047273) (:by |u0) (:text |?)
                  |j $ %{} :Leaf (:at 1633344047273) (:by |u0) (:text |from)
                  |r $ %{} :Leaf (:at 1633344047273) (:by |u0) (:text |to)
              |x $ %{} :Expr (:at 1633344047273) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344047273) (:by |u0) (:text |&call-dylib-edn)
                  |b $ %{} :Expr (:at 1635220935737) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220935987) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635220937473) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1633344056421) (:by |u0) (:text "|\"rand_int")
                  |v $ %{} :Leaf (:at 1633344047273) (:by |u0) (:text |from)
                  |x $ %{} :Leaf (:at 1633344047273) (:by |u0) (:text |to)
        |rand-nth $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633344324018) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |rand-nth)
              |r $ %{} :Expr (:at 1633344324018) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |xs)
              |v $ %{} :Expr (:at 1633344324018) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |if)
                  |j $ %{} :Expr (:at 1633344324018) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |&list:empty?)
                      |j $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |xs)
                  |r $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |nil)
                  |v $ %{} :Expr (:at 1633344324018) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |get)
                      |j $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |xs)
                      |r $ %{} :Expr (:at 1633344324018) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |rand-int)
                          |j $ %{} :Expr (:at 1633344324018) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |&-)
                              |j $ %{} :Expr (:at 1633344324018) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |&list:count)
                                  |j $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |xs)
                              |r $ %{} :Leaf (:at 1633344324018) (:by |u0) (:text |1)
        |rand-shift $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633344336110) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633344340034) (:by |u0) (:text |rand-shift)
              |r $ %{} :Expr (:at 1633344336110) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |x)
                  |j $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |y)
              |v $ %{} :Expr (:at 1633344336110) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |&+)
                  |j $ %{} :Expr (:at 1633344336110) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |&-)
                      |j $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |x)
                      |r $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |y)
                  |r $ %{} :Expr (:at 1633344336110) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |rand)
                      |j $ %{} :Expr (:at 1633344336110) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |&*)
                          |j $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |2)
                          |r $ %{} :Leaf (:at 1633344336110) (:by |u0) (:text |y)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633343497577) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633343497577) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633343497577) (:by |u0) (:text |calcit.std.rand)
            |r $ %{} :Expr (:at 1633343524902) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633343524902) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633343524902) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633343524902) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1633343524902) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633343524902) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1633343524902) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1633343524902) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633343524902) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1633343524902) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633343524902) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220911694) (:by |u0) (:text |get-dylib-path)
    |calcit.std.test $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633149996242) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633149996242) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633149996242) (:by |u0) (:text |main!)
              |r $ %{} :Expr (:at 1633149996242) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1633150002066) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633150004371) (:by |u0) (:text |run-tests)
              |x $ %{} :Expr (:at 1635220521494) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635220524841) (:by |u0) (:text |try-demos)
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633149998862) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633149998862) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633149998862) (:by |u0) (:text |reload!)
              |r $ %{} :Expr (:at 1633149998862) (:by |u0)
                :data $ {}
              |t $ %{} :Expr (:at 1716103875013) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1716103875013) (:by |u0) (:text |run-tests)
              |v $ %{} :Expr (:at 1635313996363) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635313997339) (:by |u0) (:text |println)
                  |j $ %{} :Leaf (:at 1635314003548) (:by |u0) (:text "|\"reload not handled yet")
        |run-tests $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633150008092) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633150011172) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633150008092) (:by |u0) (:text |run-tests)
              |r $ %{} :Expr (:at 1633150008092) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1633150013372) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633150016087) (:by |u0) (:text |fs/main!)
              |w $ %{} :Expr (:at 1633184626490) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633184626490) (:by |u0) (:text |json/main!)
              |x $ %{} :Expr (:at 1633150013372) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181819102) (:by |u0) (:text |date/main!)
              |yj $ %{} :Expr (:at 1633344371856) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633345267244) (:by |u0) (:text |random/main!)
              |yr $ %{} :Expr (:at 1636556898410) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636556897610) (:by |u0) (:text |test-path)
        |test-path $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1636556278883) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1636556278883) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1636556278883) (:by |u0) (:text |test-path)
              |r $ %{} :Expr (:at 1636556278883) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1636556835439) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636556837796) (:by |u0) (:text |assert=)
                  |b $ %{} :Leaf (:at 1636556846790) (:by |u0) (:text ||a/b)
                  |j $ %{} :Expr (:at 1636556839255) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636556838961) (:by |u0) (:text |join-path)
                      |j $ %{} :Leaf (:at 1636556840287) (:by |u0) (:text ||a)
                      |r $ %{} :Leaf (:at 1636556841109) (:by |u0) (:text ||b)
              |x $ %{} :Expr (:at 1636556835439) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636556837796) (:by |u0) (:text |assert=)
                  |b $ %{} :Leaf (:at 1636556852752) (:by |u0) (:text ||a)
                  |j $ %{} :Expr (:at 1636556839255) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636556838961) (:by |u0) (:text |join-path)
                      |j $ %{} :Leaf (:at 1636556840287) (:by |u0) (:text ||a)
              |y $ %{} :Expr (:at 1636556835439) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636556837796) (:by |u0) (:text |assert=)
                  |b $ %{} :Leaf (:at 1636556860169) (:by |u0) (:text ||a/b/c)
                  |j $ %{} :Expr (:at 1636556839255) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636556838961) (:by |u0) (:text |join-path)
                      |j $ %{} :Leaf (:at 1636556840287) (:by |u0) (:text ||a)
                      |r $ %{} :Leaf (:at 1636556855893) (:by |u0) (:text ||b)
                      |v $ %{} :Leaf (:at 1636556856420) (:by |u0) (:text ||c)
              |yT $ %{} :Expr (:at 1636558713421) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636558714690) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1636558717986) (:by |u0) (:text ||a/b)
                  |r $ %{} :Expr (:at 1636558719193) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636558722042) (:by |u0) (:text |path-dirname)
                      |j $ %{} :Leaf (:at 1636558740368) (:by |u0) (:text "|\"a/b/c")
              |yj $ %{} :Expr (:at 1636558713421) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636558714690) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1636558747037) (:by |u0) (:text ||c)
                  |r $ %{} :Expr (:at 1636558719193) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636558727537) (:by |u0) (:text |path-basename)
                      |j $ %{} :Leaf (:at 1636558742874) (:by |u0) (:text "|\"a/b/c")
        |try-ctrlc! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635176069456) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635176069456) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635176069456) (:by |u0) (:text |try-ctrlc!)
              |r $ %{} :Expr (:at 1635176069456) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1635176094735) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635176095021) (:by |u0) (:text |on-ctrl-c)
                  |j $ %{} :Expr (:at 1635176095688) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635176097240) (:by |u0) (:text |fn)
                      |j $ %{} :Expr (:at 1635176097521) (:by |u0)
                        :data $ {}
                      |r $ %{} :Expr (:at 1635176097985) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1635176099563) (:by |u0) (:text |println)
                          |j $ %{} :Leaf (:at 1635176102382) (:by |u0) (:text "|\"TODO handler...")
        |try-demos $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635220535726) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635220535726) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635220535726) (:by |u0) (:text |try-demos)
              |r $ %{} :Expr (:at 1635220535726) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1635220553494) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1635220554631) (:by |u0) (:text |println)
                  |T $ %{} :Expr (:at 1635220537122) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220551836) (:by |u0) (:text |md5)
                      |j $ %{} :Leaf (:at 1635220552915) (:by |u0) (:text "|\"")
              |x $ %{} :Expr (:at 1635220555195) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635220557115) (:by |u0) (:text |println)
                  |j $ %{} :Expr (:at 1635220559694) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220560883) (:by |u0) (:text |md5)
                      |j $ %{} :Leaf (:at 1635220563892) (:by |u0) (:text "|\"5")
        |try-time! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635179674423) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635179674423) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635179674423) (:by |u0) (:text |try-time!)
              |r $ %{} :Expr (:at 1635179674423) (:by |u0)
                :data $ {}
              |t $ %{} :Expr (:at 1635179928880) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635179930593) (:by |u0) (:text |set-timeout)
                  |j $ %{} :Leaf (:at 1635179934230) (:by |u0) (:text |4000)
                  |r $ %{} :Expr (:at 1635179934944) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635179935216) (:by |u0) (:text |fn)
                      |j $ %{} :Expr (:at 1635179935542) (:by |u0)
                        :data $ {}
                      |r $ %{} :Expr (:at 1635179936611) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1635179938238) (:by |u0) (:text |println)
                          |j $ %{} :Leaf (:at 1635179943685) (:by |u0) (:text "|\"doing")
              |v $ %{} :Expr (:at 1635179697159) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635179697446) (:by |u0) (:text |set-interval)
                  |j $ %{} :Leaf (:at 1635179702510) (:by |u0) (:text |2000)
                  |r $ %{} :Expr (:at 1635179702798) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635179703361) (:by |u0) (:text |fn)
                      |j $ %{} :Expr (:at 1635179703713) (:by |u0)
                        :data $ {}
                      |r $ %{} :Expr (:at 1635179704101) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1635179705950) (:by |u0) (:text |println)
                          |j $ %{} :Leaf (:at 1635179710631) (:by |u0) (:text "|\"DO Do Do")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633149625774) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633149625774) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633149625774) (:by |u0) (:text |calcit.std.test)
            |r $ %{} :Expr (:at 1633149974572) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633149975596) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633149976294) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633149981735) (:by |u0) (:text |calcit.std.test.fs)
                    |j $ %{} :Leaf (:at 1633149982715) (:by |u0) (:text |:as)
                    |r $ %{} :Leaf (:at 1633149984197) (:by |u0) (:text |fs)
                |r $ %{} :Expr (:at 1633149976294) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181791700) (:by |u0) (:text |calcit.std.test.date)
                    |j $ %{} :Leaf (:at 1633149982715) (:by |u0) (:text |:as)
                    |r $ %{} :Leaf (:at 1633181793307) (:by |u0) (:text |date)
                |x $ %{} :Expr (:at 1633149976294) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181803641) (:by |u0) (:text |calcit.std.test.json)
                    |j $ %{} :Leaf (:at 1633149982715) (:by |u0) (:text |:as)
                    |r $ %{} :Leaf (:at 1633181805611) (:by |u0) (:text |json)
                |y $ %{} :Expr (:at 1633149976294) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633345264563) (:by |u0) (:text |calcit.std.test.rand)
                    |j $ %{} :Leaf (:at 1633149982715) (:by |u0) (:text |:as)
                    |r $ %{} :Leaf (:at 1633344489931) (:by |u0) (:text |random)
                |yT $ %{} :Expr (:at 1635176080511) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635176084579) (:by |u0) (:text |calcit.std.process)
                    |j $ %{} :Leaf (:at 1635176086277) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635176086502) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635176089357) (:by |u0) (:text |on-ctrl-c)
                |yj $ %{} :Expr (:at 1635179681831) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635179685665) (:by |u0) (:text |calcit.std.time)
                    |j $ %{} :Leaf (:at 1635179686874) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635179687274) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635179690816) (:by |u0) (:text |set-timeout)
                        |j $ %{} :Leaf (:at 1635179692802) (:by |u0) (:text |set-interval)
                |yr $ %{} :Expr (:at 1635179681831) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635220542678) (:by |u0) (:text |calcit.std.hash)
                    |j $ %{} :Leaf (:at 1635179686874) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635179687274) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220545022) (:by |u0) (:text |md5)
                |yv $ %{} :Expr (:at 1636556824900) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1636556828953) (:by |u0) (:text |calcit.std.path)
                    |j $ %{} :Leaf (:at 1636556829912) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1636556830120) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1636556831915) (:by |u0) (:text |join-path)
                        |j $ %{} :Leaf (:at 1636558769054) (:by |u0) (:text |path-dirname)
                        |r $ %{} :Leaf (:at 1636558771914) (:by |u0) (:text |path-basename)
    |calcit.std.test.date $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633181508087) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633181508087) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633181508087) (:by |u0) (:text |main!)
              |r $ %{} :Expr (:at 1633181508087) (:by |u0)
                :data $ {}
              |t $ %{} :Expr (:at 1633182683895) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633182683895) (:by |u0) (:text |println)
                  |b $ %{} :Leaf (:at 1716103908711) (:by |u0) (:text |&newline)
                  |j $ %{} :Leaf (:at 1716103904425) (:by |u0) (:text "|\"%%%% test date")
              |u $ %{} :Expr (:at 1633182723200) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1716103889740) (:by |u0) (:text |println)
                  |b $ %{} :Leaf (:at 1716103891623) (:by |u0) (:text "|\"GET TIME")
                  |j $ %{} :Expr (:at 1633182726288) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633182726288) (:by |u0) (:text |get-time!)
              |v $ %{} :Expr (:at 1633181525316) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |echo)
                  |j $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text ||time:)
                  |r $ %{} :Expr (:at 1633181525316) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |format-time)
                      |j $ %{} :Expr (:at 1633181525316) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |get-time!)
                      |r $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text "||%Y-%m-%d %H:%M:%S %z")
              |x $ %{} :Expr (:at 1633181525316) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |1417176009000)
                  |r $ %{} :Expr (:at 1636967821164) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1636967828492) (:by |u0) (:text |get-timestamp)
                      |T $ %{} :Expr (:at 1633181525316) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |parse-time)
                          |j $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text "||2014-11-28 21:00:09 +09:00")
                          |r $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text "||%Y-%m-%d %H:%M:%S %z")
              |y $ %{} :Expr (:at 1633181525316) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1636966386825) (:by |u0) (:text |;)
                  |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text "||2014-11-28 12:00:09 +0000")
                  |r $ %{} :Expr (:at 1633181525316) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |format-time)
                      |j $ %{} :Expr (:at 1636967839382) (:by |u0)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1685292559916) (:by |u0) (:text |%::)
                          |L $ %{} :Leaf (:at 1636967840920) (:by |u0) (:text |Date)
                          |P $ %{} :Leaf (:at 1685292562723) (:by |u0) (:text |:date)
                          |T $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text |1417176009000)
                      |r $ %{} :Leaf (:at 1633181525316) (:by |u0) (:text "||%Y-%m-%d %H:%M:%S %z")
              |yT $ %{} :Expr (:at 1636560373324) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1636560396903) (:by |u0) (:text |w-log)
                  |T $ %{} :Expr (:at 1636560333749) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636560450226) (:by |u0) (:text |extract-time)
                      |j $ %{} :Expr (:at 1636560340981) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636560343889) (:by |u0) (:text |get-time!)
              |yj $ %{} :Expr (:at 1636792902806) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636794766178) (:by |u0) (:text |w-log)
                  |j $ %{} :Expr (:at 1636792906061) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636792911335) (:by |u0) (:text |from-ymd)
                      |j $ %{} :Leaf (:at 1636792913348) (:by |u0) (:text |2021)
                      |r $ %{} :Leaf (:at 1636792914526) (:by |u0) (:text |11)
                      |v $ %{} :Leaf (:at 1636792915596) (:by |u0) (:text |11)
              |yr $ %{} :Expr (:at 1636792902806) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636794770646) (:by |u0) (:text |w-log)
                  |j $ %{} :Expr (:at 1636792906061) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636792918623) (:by |u0) (:text |from-ywd)
                      |j $ %{} :Leaf (:at 1636792913348) (:by |u0) (:text |2021)
                      |r $ %{} :Leaf (:at 1636793165469) (:by |u0) (:text |45)
                      |v $ %{} :Leaf (:at 1636793961759) (:by |u0) (:text |6)
              |yu $ %{} :Expr (:at 1641266583675) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1641266583675) (:by |u0) (:text |w-log)
                  |j $ %{} :Expr (:at 1641266611249) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1641266620376) (:by |u0) (:text |.format)
                      |T $ %{} :Expr (:at 1641266583675) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1641266583675) (:by |u0) (:text |from-ywd)
                          |j $ %{} :Leaf (:at 1641266583675) (:by |u0) (:text |2022)
                          |r $ %{} :Leaf (:at 1641267566820) (:by |u0) (:text |1)
                          |v $ %{} :Leaf (:at 1641267569648) (:by |u0) (:text |2)
                      |j $ %{} :Leaf (:at 1641266622730) (:by |u0) (:text "|\"%Y-%m-%d %H-%M")
              |yv $ %{} :Expr (:at 1636966457977) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1636968777507) (:by |u0) (:text |let)
                  |L $ %{} :Expr (:at 1636968778304) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1636968778523) (:by |u0)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1636968779283) (:by |u0) (:text |d)
                          |T $ %{} :Expr (:at 1636966460846) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636966460846) (:by |u0) (:text |from-ymd)
                              |j $ %{} :Leaf (:at 1636966460846) (:by |u0) (:text |2021)
                              |r $ %{} :Leaf (:at 1636966460846) (:by |u0) (:text |11)
                              |v $ %{} :Leaf (:at 1636966460846) (:by |u0) (:text |11)
                  |T $ %{} :Expr (:at 1636966575165) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1636966575678) (:by |u0) (:text |do)
                      |L $ %{} :Expr (:at 1636968513393) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636968514194) (:by |u0) (:text |println)
                          |j $ %{} :Leaf (:at 1636968515970) (:by |u0) (:text "|\"single....")
                      |T $ %{} :Expr (:at 1636966563837) (:by |u0)
                        :data $ {}
                          |5 $ %{} :Leaf (:at 1636968536328) (:by |u0) (:text |;)
                          |D $ %{} :Leaf (:at 1636966565366) (:by |u0) (:text |assert=)
                          |L $ %{} :Leaf (:at 1636966570981) (:by |u0) (:text "|\"2021-11-12")
                          |T $ %{} :Expr (:at 1636966304868) (:by |u0)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636966305884) (:by |u0) (:text |->)
                              |L $ %{} :Leaf (:at 1636966468453) (:by |u0) (:text |d)
                              |T $ %{} :Expr (:at 1636966290693) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636968464258) (:by |u0) (:text |.add)
                                  |r $ %{} :Leaf (:at 1636966296934) (:by |u0) (:text |1)
                                  |v $ %{} :Leaf (:at 1636966298231) (:by |u0) (:text |:days)
                              |j $ %{} :Expr (:at 1636966306681) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636966313853) (:by |u0) (:text |format-time)
                                  |j $ %{} :Leaf (:at 1636966550201) (:by |u0) (:text "|\"%Y-%m-%d")
                      |j $ %{} :Expr (:at 1636966563837) (:by |u0)
                        :data $ {}
                          |5 $ %{} :Leaf (:at 1636968485793) (:by |u0) (:text |;)
                          |D $ %{} :Leaf (:at 1636966565366) (:by |u0) (:text |assert=)
                          |L $ %{} :Leaf (:at 1636966638958) (:by |u0) (:text "|\"2021-11-11 01-00")
                          |T $ %{} :Expr (:at 1636966304868) (:by |u0)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636966305884) (:by |u0) (:text |->)
                              |L $ %{} :Leaf (:at 1636966468453) (:by |u0) (:text |d)
                              |T $ %{} :Expr (:at 1636966290693) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636968466641) (:by |u0) (:text |.add)
                                  |r $ %{} :Leaf (:at 1636966296934) (:by |u0) (:text |1)
                                  |v $ %{} :Leaf (:at 1636966621777) (:by |u0) (:text |:hours)
                              |j $ %{} :Expr (:at 1636966306681) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636966313853) (:by |u0) (:text |format-time)
                                  |j $ %{} :Leaf (:at 1636966613145) (:by |u0) (:text "|\"%Y-%m-%d %H-%M")
                      |r $ %{} :Expr (:at 1636966563837) (:by |u0)
                        :data $ {}
                          |5 $ %{} :Leaf (:at 1636968483673) (:by |u0) (:text |;)
                          |D $ %{} :Leaf (:at 1636966565366) (:by |u0) (:text |assert=)
                          |L $ %{} :Leaf (:at 1636966671917) (:by |u0) (:text "|\"2021-11-11 00-01")
                          |T $ %{} :Expr (:at 1636966304868) (:by |u0)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636966305884) (:by |u0) (:text |->)
                              |L $ %{} :Leaf (:at 1636966468453) (:by |u0) (:text |d)
                              |T $ %{} :Expr (:at 1636966290693) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636968468595) (:by |u0) (:text |.add)
                                  |r $ %{} :Leaf (:at 1636966296934) (:by |u0) (:text |1)
                                  |v $ %{} :Leaf (:at 1636966645708) (:by |u0) (:text |:minutes)
                              |j $ %{} :Expr (:at 1636966306681) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636966313853) (:by |u0) (:text |format-time)
                                  |j $ %{} :Leaf (:at 1636966660573) (:by |u0) (:text "|\"%Y-%m-%d %H-%M")
                      |v $ %{} :Expr (:at 1636966563837) (:by |u0)
                        :data $ {}
                          |5 $ %{} :Leaf (:at 1636968482720) (:by |u0) (:text |;)
                          |D $ %{} :Leaf (:at 1636966565366) (:by |u0) (:text |assert=)
                          |L $ %{} :Leaf (:at 1636966930722) (:by |u0) (:text "|\"2021-11-10 16-00")
                          |T $ %{} :Expr (:at 1636966304868) (:by |u0)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1636966305884) (:by |u0) (:text |->)
                              |L $ %{} :Leaf (:at 1636966468453) (:by |u0) (:text |d)
                              |T $ %{} :Expr (:at 1636966290693) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636968472428) (:by |u0) (:text |.add)
                                  |r $ %{} :Leaf (:at 1636966914512) (:by |u0) (:text |-8)
                                  |v $ %{} :Leaf (:at 1636966919505) (:by |u0) (:text |:hours)
                              |j $ %{} :Expr (:at 1636966306681) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1636966313853) (:by |u0) (:text |format-time)
                                  |j $ %{} :Leaf (:at 1636966660573) (:by |u0) (:text "|\"%Y-%m-%d %H-%M")
              |yx $ %{} :Expr (:at 1636967353813) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636967355212) (:by |u0) (:text |println)
                  |j $ %{} :Expr (:at 1636967356675) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636967357100) (:by |u0) (:text |->)
                      |j $ %{} :Expr (:at 1636967361833) (:by |u0)
                        :data $ {}
                          |T $ %{} :Expr (:at 1636967357417) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1636967359457) (:by |u0) (:text |:now)
                              |j $ %{} :Leaf (:at 1636967360227) (:by |u0) (:text |Date)
                      |r $ %{} :Expr (:at 1636967369928) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636967377195) (:by |u0) (:text |.add)
                          |j $ %{} :Leaf (:at 1636967379388) (:by |u0) (:text |1)
                          |r $ %{} :Leaf (:at 1636967391853) (:by |u0) (:text |:hours)
                      |v $ %{} :Expr (:at 1636967381289) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636967382173) (:by |u0) (:text |.add)
                          |j $ %{} :Leaf (:at 1636967382918) (:by |u0) (:text |2)
                          |r $ %{} :Leaf (:at 1636967389756) (:by |u0) (:text |:minutes)
                      |x $ %{} :Expr (:at 1636967394435) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1636967398504) (:by |u0) (:text |.format)
                          |j $ %{} :Leaf (:at 1636967400868) (:by |u0) (:text "|\"%Y-%m-%d %H-%M")
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1641266526980) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1641266526980) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1641266526980) (:by |u0) (:text |reload!)
              |r $ %{} :Expr (:at 1641266526980) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1641266529182) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1641266530491) (:by |u0) (:text |main!)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633181502356) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633181502356) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633181502356) (:by |u0) (:text |calcit.std.test.date)
            |r $ %{} :Expr (:at 1633181536910) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633181537744) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633181537979) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181544672) (:by |u0) (:text |calcit.std.date)
                    |j $ %{} :Leaf (:at 1633181545419) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633181545728) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1633181552779) (:by |u0) (:text |parse-time)
                        |j $ %{} :Leaf (:at 1633181554153) (:by |u0) (:text |format-time)
                        |r $ %{} :Leaf (:at 1633181563305) (:by |u0) (:text |get-time!)
                        |v $ %{} :Leaf (:at 1636560800370) (:by |u0) (:text |extract-time)
                        |x $ %{} :Leaf (:at 1636792939445) (:by |u0) (:text |from-ymd)
                        |y $ %{} :Leaf (:at 1636966283014) (:by |u0) (:text |from-ywd)
                        |yT $ %{} :Leaf (:at 1636966285858) (:by |u0) (:text |add-duration)
                        |yj $ %{} :Leaf (:at 1636967365864) (:by |u0) (:text |Date)
                        |yr $ %{} :Leaf (:at 1636967833659) (:by |u0) (:text |get-timestamp)
    |calcit.std.test.fs $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630174676216) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630174676216) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1630174676216) (:by |u0) (:text |main!)
              |r $ %{} :Expr (:at 1630174676216) (:by |u0)
                :data $ {}
              |t $ %{} :Expr (:at 1633182663238) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633182664163) (:by |u0) (:text |println)
                  |j $ %{} :Leaf (:at 1633182672402) (:by |u0) (:text "|\"%%%% test for fs")
              |v $ %{} :Expr (:at 1630174686386) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630174687985) (:by |u0) (:text |println)
                  |j $ %{} :Leaf (:at 1630174693957) (:by |u0) (:text |calcit-filename)
                  |r $ %{} :Leaf (:at 1630174696531) (:by |u0) (:text |calcit-dirname)
              |x $ %{} :Expr (:at 1630176276151) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1630176279093) (:by |u0) (:text |println)
                  |T $ %{} :Expr (:at 1633182641636) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1633182642813) (:by |u0) (:text |>)
                      |T $ %{} :Expr (:at 1633182643577) (:by |u0)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1633182646850) (:by |u0) (:text |count)
                          |T $ %{} :Expr (:at 1630176241192) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1630176262288) (:by |u0) (:text |read-file!)
                              |j $ %{} :Leaf (:at 1630245682315) (:by |u0) (:text "|\"README.md")
                      |j $ %{} :Leaf (:at 1633182648511) (:by |u0) (:text |1000)
              |xT $ %{} :Expr (:at 1688447533888) (:by |u0)
                :data $ {}
                  |D $ %{} :Leaf (:at 1688447534508) (:by |u0) (:text |let)
                  |T $ %{} :Expr (:at 1688447540723) (:by |u0)
                    :data $ {}
                      |T $ %{} :Expr (:at 1688447541078) (:by |u0)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1688447542675) (:by |u0) (:text |*c)
                          |L $ %{} :Expr (:at 1688447543653) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1688447544552) (:by |u0) (:text |atom)
                              |b $ %{} :Leaf (:at 1688447544778) (:by |u0) (:text |0)
                  |b $ %{} :Expr (:at 1688447547831) (:by |u0)
                    :data $ {}
                      |b $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text |read-file-by-line!)
                      |h $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text "|\"README.md")
                      |l $ %{} :Expr (:at 1688447547831) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text |fn)
                          |b $ %{} :Expr (:at 1688447547831) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text |line)
                          |h $ %{} :Expr (:at 1688447547831) (:by |u0)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1688448734708) (:by |u0) (:text |;)
                              |T $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text |println)
                              |b $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text "|\"readling line:")
                              |h $ %{} :Leaf (:at 1688447547831) (:by |u0) (:text |line)
                          |l $ %{} :Expr (:at 1688447553554) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1688447555421) (:by |u0) (:text |swap!)
                              |b $ %{} :Leaf (:at 1688447557717) (:by |u0) (:text |*c)
                              |h $ %{} :Leaf (:at 1688447559107) (:by |u0) (:text |inc)
                  |h $ %{} :Expr (:at 1688447561189) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1688447561871) (:by |u0) (:text |println)
                      |b $ %{} :Leaf (:at 1688447562879) (:by |u0) (:text "|\"lines")
                      |h $ %{} :Leaf (:at 1688448482279) (:by |u0) (:text |@*c)
              |y $ %{} :Expr (:at 1630219294072) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630219294943) (:by |u0) (:text |println)
                  |j $ %{} :Expr (:at 1630219295597) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630219295880) (:by |u0) (:text |path-exists?)
                      |j $ %{} :Leaf (:at 1630245685393) (:by |u0) (:text "|\"README.md")
                  |r $ %{} :Expr (:at 1630219295597) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630219295880) (:by |u0) (:text |path-exists?)
                      |j $ %{} :Leaf (:at 1630245688251) (:by |u0) (:text "|\"build.js")
              |yT $ %{} :Expr (:at 1630224783367) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630224784483) (:by |u0) (:text |println)
                  |j $ %{} :Expr (:at 1630224785532) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630224790382) (:by |u0) (:text |read-dir!)
                      |j $ %{} :Leaf (:at 1630225166386) (:by |u0) (:text "|\"./")
              |yj $ %{} :Expr (:at 1630234444588) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630234445436) (:by |u0) (:text |println)
                  |b $ %{} :Leaf (:at 1633252168827) (:by |u0) (:text "|\"dirs:")
                  |j $ %{} :Expr (:at 1630234446499) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630234447173) (:by |u0) (:text |execute!)
                      |j $ %{} :Expr (:at 1630234455761) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1630234455628) (:by |u0) (:text |[])
                          |j $ %{} :Leaf (:at 1630234458445) (:by |u0) (:text "|\"ls")
              |yn $ %{} :Expr (:at 1672681402195) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1672681403057) (:by |u0) (:text |println)
                  |b $ %{} :Leaf (:at 1672681507386) (:by |u0) (:text "|\"all paths size:")
                  |h $ %{} :Expr (:at 1672681503255) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1672681504985) (:by |u0) (:text |count)
                      |T $ %{} :Expr (:at 1672681407902) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1672681410762) (:by |u0) (:text |walk-dir!)
                          |b $ %{} :Leaf (:at 1672681495068) (:by |u0) (:text "|\"target")
              |yp $ %{} :Expr (:at 1672681402195) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1672681403057) (:by |u0) (:text |println)
                  |b $ %{} :Leaf (:at 1673544034537) (:by |u0) (:text "|\"rs files:")
                  |h $ %{} :Expr (:at 1672681407902) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1673543371425) (:by |u0) (:text |glob!)
                      |b $ %{} :Leaf (:at 1673544016980) (:by |u0) (:text "|\"src/*.rs")
              |yr $ %{} :Expr (:at 1636552846289) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636552848054) (:by |u0) (:text |create-dir!)
                  |j $ %{} :Leaf (:at 1636552857609) (:by |u0) (:text "|\"target/dir1")
              |yt $ %{} :Expr (:at 1636553383858) (:by |u0)
                :data $ {}
                  |j $ %{} :Leaf (:at 1636553383858) (:by |u0) (:text |rename!)
                  |r $ %{} :Leaf (:at 1636553383858) (:by |u0) (:text "|\"target/dir1")
                  |v $ %{} :Leaf (:at 1636553383858) (:by |u0) (:text "|\"target/dir4")
              |yv $ %{} :Expr (:at 1636552846289) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636552868395) (:by |u0) (:text |create-dir-all!)
                  |j $ %{} :Leaf (:at 1636552865022) (:by |u0) (:text "|\"target/dir2/dir3")
              |yx $ %{} :Expr (:at 1636559421479) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636559425996) (:by |u0) (:text |check-write-file!)
                  |j $ %{} :Leaf (:at 1636559442807) (:by |u0) (:text "|\"target/dir8/dir9/file.text")
                  |r $ %{} :Leaf (:at 1636559447967) (:by |u0) (:text "|\"TODO")
              |z $ %{} :Expr (:at 1636559421479) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1679453992393) (:by |u0) (:text |append-file!)
                  |j $ %{} :Leaf (:at 1636559442807) (:by |u0) (:text "|\"target/dir8/dir9/file.text")
                  |r $ %{} :Expr (:at 1679454021044) (:by |u0)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1679454022300) (:by |u0) (:text |str)
                      |L $ %{} :Leaf (:at 1679454023645) (:by |u0) (:text |&newline)
                      |T $ %{} :Leaf (:at 1679453998007) (:by |u0) (:text "|\"NEWLINE TODO")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1630174670374) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1630174670374) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1630174670374) (:by |u0) (:text |calcit.std.test.fs)
            |r $ %{} :Expr (:at 1630174698487) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1630174699239) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1630174699521) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1630174765731) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1630174767620) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1630174767807) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1630174769568) (:by |u0) (:text |calcit-filename)
                        |j $ %{} :Leaf (:at 1630174774512) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1630176222588) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1630176227478) (:by |u0) (:text |calcit.std.fs)
                    |j $ %{} :Leaf (:at 1630176229782) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1630176230004) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1630176235651) (:by |u0) (:text |read-file!)
                        |b $ %{} :Leaf (:at 1679453988083) (:by |u0) (:text |append-file!)
                        |j $ %{} :Leaf (:at 1630176238637) (:by |u0) (:text |write-file!)
                        |r $ %{} :Leaf (:at 1630219447225) (:by |u0) (:text |path-exists?)
                        |v $ %{} :Leaf (:at 1630224796390) (:by |u0) (:text |read-dir!)
                        |x $ %{} :Leaf (:at 1636552874739) (:by |u0) (:text |create-dir!)
                        |y $ %{} :Leaf (:at 1636552878300) (:by |u0) (:text |create-dir-all!)
                        |yT $ %{} :Leaf (:at 1636553316335) (:by |u0) (:text |rename!)
                        |yj $ %{} :Leaf (:at 1636559452607) (:by |u0) (:text |check-write-file!)
                        |z $ %{} :Leaf (:at 1672681420295) (:by |u0) (:text |walk-dir!)
                        |zD $ %{} :Leaf (:at 1673543378088) (:by |u0) (:text |glob!)
                        |zP $ %{} :Leaf (:at 1688447406097) (:by |u0) (:text |read-file-by-line!)
                |v $ %{} :Expr (:at 1630234432423) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1630234435928) (:by |u0) (:text |calcit.std.process)
                    |j $ %{} :Leaf (:at 1630234437452) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1630234437661) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1630234439968) (:by |u0) (:text |execute!)
    |calcit.std.test.json $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633181629879) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633181629879) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633181629879) (:by |u0) (:text |main!)
              |r $ %{} :Expr (:at 1633181629879) (:by |u0)
                :data $ {}
              |t $ %{} :Expr (:at 1633182698162) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633182698162) (:by |u0) (:text |println)
                  |j $ %{} :Leaf (:at 1633182701816) (:by |u0) (:text "|\"%%%% test for json")
              |u $ %{} :Expr (:at 1633197974934) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633197976808) (:by |u0) (:text |println)
                  |j $ %{} :Expr (:at 1633197977182) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633197978748) (:by |u0) (:text |stringify-json)
                      |j $ %{} :Expr (:at 1633197979285) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633197981400) (:by |u0) (:text |[])
                          |j $ %{} :Leaf (:at 1633197981639) (:by |u0) (:text |1)
                          |r $ %{} :Leaf (:at 1633197981958) (:by |u0) (:text |2)
                          |v $ %{} :Leaf (:at 1633197982183) (:by |u0) (:text |3)
                          |x $ %{} :Leaf (:at 1633198868517) (:by |u0) (:text |:a)
              |v $ %{} :Expr (:at 1633181735860) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |assert=)
                  |j $ %{} :Expr (:at 1633181735860) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |parse-json)
                      |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text "||{\"a\": [1, 2], \":b\": 3}")
                  |r $ %{} :Expr (:at 1633181735860) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |{})
                      |j $ %{} :Expr (:at 1633181735860) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text ||a)
                          |j $ %{} :Expr (:at 1633181735860) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |[])
                              |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |1)
                              |r $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |2)
                      |r $ %{} :Expr (:at 1633181735860) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |:b)
                          |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |3)
              |x $ %{} :Expr (:at 1633181735860) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |&let)
                  |j $ %{} :Expr (:at 1633181735860) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |data)
                      |j $ %{} :Expr (:at 1633181735860) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |{})
                          |j $ %{} :Expr (:at 1633181735860) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text ||a)
                              |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |1)
                          |r $ %{} :Expr (:at 1633181735860) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |:b)
                              |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |2)
                          |v $ %{} :Expr (:at 1633181735860) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |:c)
                              |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |:k)
                  |r $ %{} :Expr (:at 1633181735860) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |assert=)
                      |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |data)
                      |r $ %{} :Expr (:at 1633181735860) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |parse-json)
                          |j $ %{} :Expr (:at 1633198975983) (:by |u0)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1633198977764) (:by |u0) (:text |w-log)
                              |T $ %{} :Expr (:at 1633181735860) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |stringify-json)
                                  |j $ %{} :Leaf (:at 1633181735860) (:by |u0) (:text |data)
                                  |r $ %{} :Leaf (:at 1633199064959) (:by |u0) (:text |true)
              |y $ %{} :Expr (:at 1633187033835) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |&let)
                  |j $ %{} :Expr (:at 1633187033835) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |data)
                      |j $ %{} :Expr (:at 1633187033835) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |{})
                          |j $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text ||a)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |1)
                          |r $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |:b)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |2)
                          |v $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |:c)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |:k)
                  |r $ %{} :Expr (:at 1633187033835) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |assert=)
                      |j $ %{} :Expr (:at 1633187033835) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |parse-json)
                          |j $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |stringify-json)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |data)
                      |r $ %{} :Expr (:at 1633187033835) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |{})
                          |j $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text ||a)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |1)
                          |r $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text ||b)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text |2)
                          |v $ %{} :Expr (:at 1633187033835) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text ||c)
                              |j $ %{} :Leaf (:at 1633187033835) (:by |u0) (:text ||k)
        |slurp-cirru-edn $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633181663658) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |defmacro)
              |j $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |slurp-cirru-edn)
              |r $ %{} :Expr (:at 1633181663658) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |file)
              |v $ %{} :Expr (:at 1633181663658) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |with-cpu-time)
                  |j $ %{} :Expr (:at 1633181663658) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |stringify-json)
                      |j $ %{} :Expr (:at 1633181663658) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |first)
                          |j $ %{} :Expr (:at 1633181663658) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |with-cpu-time)
                              |j $ %{} :Expr (:at 1633181663658) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |parse-cirru)
                                  |j $ %{} :Expr (:at 1633181663658) (:by |u0)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |read-file)
                                      |j $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |file)
                      |r $ %{} :Leaf (:at 1633181663658) (:by |u0) (:text |true)
        |try-large-json $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633181636524) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633181636524) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633181636524) (:by |u0) (:text |try-large-json)
              |r $ %{} :Expr (:at 1633181636524) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1633181656855) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633181656855) (:by |u0) (:text |slurp-cirru-edn)
                  |j $ %{} :Leaf (:at 1633181656855) (:by |u0) (:text ||/Users/chen/repo/calcit-lang/apis/docs/apis.cirru)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633181626356) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633181626356) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633181626356) (:by |u0) (:text |calcit.std.test.json)
            |r $ %{} :Expr (:at 1633181741419) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633181742270) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633181742515) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633181746103) (:by |u0) (:text |calcit.std.json)
                    |j $ %{} :Leaf (:at 1633181747444) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633181748344) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1633181749646) (:by |u0) (:text |parse-json)
                        |j $ %{} :Leaf (:at 1633181755342) (:by |u0) (:text |stringify-json)
    |calcit.std.test.rand $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1633343514818) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1633343514818) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633343514818) (:by |u0) (:text |main!)
              |r $ %{} :Expr (:at 1633343514818) (:by |u0)
                :data $ {}
              |t $ %{} :Expr (:at 1633343549053) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343550017) (:by |u0) (:text |println)
                  |j $ %{} :Leaf (:at 1633345043016) (:by |u0) (:text "|\"%%%%%% test random")
              |v $ %{} :Expr (:at 1633343541829) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343541829) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |0)
                      |r $ %{} :Expr (:at 1633343541829) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |index-of)
                          |j $ %{} :Expr (:at 1633343541829) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |range)
                              |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |10)
                          |r $ %{} :Expr (:at 1633343541829) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |rand-nth)
                              |j $ %{} :Expr (:at 1633343541829) (:by |u0)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |range)
                                  |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |10)
              |x $ %{} :Expr (:at 1633343541829) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |nil)
                  |r $ %{} :Expr (:at 1633343541829) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |rand-nth)
                      |j $ %{} :Expr (:at 1633343541829) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |[])
              |y $ %{} :Expr (:at 1633343541829) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |nil)
                  |r $ %{} :Expr (:at 1633343541829) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |;nil)
                      |j $ %{} :Leaf (:at 1633343541829) (:by |u0) (:text |anything)
              |yj $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |0)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |rand)
                      |v $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |100)
              |yr $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |0)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |rand)
                          |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
                      |v $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
              |yv $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |20)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |rand)
                          |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |20)
                          |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |30)
                      |v $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |30)
              |yx $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text "||try .rand-shift")
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |&let)
                      |j $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |x)
                          |j $ %{} :Expr (:at 1633343565286) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633344851627) (:by |u0) (:text |rand-shift)
                              |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
                              |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |5)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |and)
                          |j $ %{} :Expr (:at 1633343565286) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |>=)
                              |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |x)
                              |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |5)
                          |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                              |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |x)
                              |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |15)
              |yy $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text "||try .rand-between")
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |&let)
                      |j $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |x)
                          |j $ %{} :Expr (:at 1633343565286) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633344889610) (:by |u0) (:text |rand-between)
                              |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
                              |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |5)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |and)
                          |j $ %{} :Expr (:at 1633343565286) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |>=)
                              |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |x)
                              |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |5)
                          |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                              |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |x)
                              |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
              |yyT $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |0)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |rand-int)
                      |v $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |100)
              |yyj $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |0)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |rand-int)
                          |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
                      |v $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |10)
              |yyr $ %{} :Expr (:at 1633343565286) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |assert-detect)
                  |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |identity)
                  |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |<=)
                      |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |20)
                      |r $ %{} :Expr (:at 1633343565286) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |rand-int)
                          |j $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |20)
                          |r $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |30)
                      |v $ %{} :Leaf (:at 1633343565286) (:by |u0) (:text |30)
              |yyx $ %{} :Expr (:at 1633343579462) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343580308) (:by |u0) (:text |println)
                  |j $ %{} :Leaf (:at 1633343583667) (:by |u0) (:text "|\"%%%% test id")
              |yyy $ %{} :Expr (:at 1633343584459) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1633343584459) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1633343584459) (:by |u0) (:text |9)
                  |r $ %{} :Expr (:at 1633343584459) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1633343584459) (:by |u0) (:text |count)
                      |j $ %{} :Expr (:at 1633343584459) (:by |u0)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1633344895870) (:by |u0) (:text |nanoid!)
                          |j $ %{} :Leaf (:at 1633343584459) (:by |u0) (:text |9)
              |yyy5 $ %{} :Expr (:at 1636711583228) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636711583228) (:by |u0) (:text |assert=)
                  |j $ %{} :Leaf (:at 1636711583228) (:by |u0) (:text ||aaaaa)
                  |r $ %{} :Expr (:at 1636711583228) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636711583228) (:by |u0) (:text |nanoid!)
                      |j $ %{} :Leaf (:at 1636711583228) (:by |u0) (:text |5)
                      |r $ %{} :Leaf (:at 1636711583228) (:by |u0) (:text ||a)
              |yyyD $ %{} :Expr (:at 1636711580034) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1636711580034) (:by |u0) (:text |println)
                  |j $ %{} :Expr (:at 1636711580034) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1636711580034) (:by |u0) (:text |rand-hex-color!)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633343510095) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633343510095) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633343510095) (:by |u0) (:text |calcit.std.test.rand)
            |r $ %{} :Expr (:at 1633344429099) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1633344429752) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1633344432023) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1633345248562) (:by |u0) (:text |calcit.std.rand)
                    |j $ %{} :Leaf (:at 1633344439062) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1633344439437) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1633344441073) (:by |u0) (:text |rand)
                        |j $ %{} :Leaf (:at 1633344442462) (:by |u0) (:text |rand-int)
                        |r $ %{} :Leaf (:at 1633344444923) (:by |u0) (:text |rand-shift)
                        |v $ %{} :Leaf (:at 1633344447143) (:by |u0) (:text |rand-nth)
                        |x $ %{} :Leaf (:at 1633344451455) (:by |u0) (:text |rand-between)
                        |y $ %{} :Leaf (:at 1633344907417) (:by |u0) (:text |nanoid!)
                        |yT $ %{} :Leaf (:at 1636711587670) (:by |u0) (:text |rand-hex-color!)
    |calcit.std.time $ %{} :FileEntry
      :defs $ {}
        |set-interval $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635179641143) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635179641143) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635179641143) (:by |u0) (:text |set-interval)
              |r $ %{} :Expr (:at 1635179643672) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635179643672) (:by |u0) (:text |t)
                  |j $ %{} :Leaf (:at 1635179643672) (:by |u0) (:text |cb)
              |v $ %{} :Expr (:at 1635179643672) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635179752229) (:by |u0) (:text |&call-dylib-edn-fn)
                  |b $ %{} :Expr (:at 1635221008204) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635221008473) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635221009985) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1635179651332) (:by |u0) (:text "|\"set_interval")
                  |v $ %{} :Leaf (:at 1635179643672) (:by |u0) (:text |t)
                  |x $ %{} :Leaf (:at 1635179643672) (:by |u0) (:text |cb)
        |set-timeout $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635179602515) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635179602515) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635179602515) (:by |u0) (:text |set-timeout)
              |r $ %{} :Expr (:at 1635179604841) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635179614225) (:by |u0) (:text |t)
                  |j $ %{} :Leaf (:at 1635179616669) (:by |u0) (:text |cb)
              |v $ %{} :Expr (:at 1635179604841) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635179757223) (:by |u0) (:text |&call-dylib-edn-fn)
                  |b $ %{} :Expr (:at 1635221014849) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635221015096) (:by |u0) (:text |get-dylib-path)
                      |j $ %{} :Leaf (:at 1635221016675) (:by |u0) (:text "|\"/dylibs/libcalcit_std")
                  |r $ %{} :Leaf (:at 1635179626283) (:by |u0) (:text "|\"set_timeout")
                  |v $ %{} :Leaf (:at 1635179619080) (:by |u0) (:text |t)
                  |x $ %{} :Leaf (:at 1635179620417) (:by |u0) (:text |cb)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1635179588832) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1635179588832) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1635179588832) (:by |u0) (:text |calcit.std.time)
            |r $ %{} :Expr (:at 1635179663484) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1635179663484) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1635179663484) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635179663484) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1635179663484) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635179663484) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635179663484) (:by |u0) (:text |calcit-dirname)
                |r $ %{} :Expr (:at 1635179663484) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635179663484) (:by |u0) (:text |calcit.std.util)
                    |j $ %{} :Leaf (:at 1635179663484) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635179663484) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635221003887) (:by |u0) (:text |get-dylib-path)
    |calcit.std.util $ %{} :FileEntry
      :defs $ {}
        |get-dylib-ext $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630231398718) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630231418304) (:by |u0) (:text |defmacro)
              |j $ %{} :Leaf (:at 1633181058353) (:by |u0) (:text |get-dylib-ext)
              |r $ %{} :Expr (:at 1630231398718) (:by |u0)
                :data $ {}
              |v $ %{} :Expr (:at 1630231403270) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630231423910) (:by |u0) (:text |case-default)
                  |b $ %{} :Expr (:at 1630231429893) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630231433951) (:by |u0) (:text |&get-os)
                  |j $ %{} :Leaf (:at 1630231427453) (:by |u0) (:text "|\".so")
                  |r $ %{} :Expr (:at 1630231437150) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630231439152) (:by |u0) (:text |:macos)
                      |j $ %{} :Leaf (:at 1630231447585) (:by |u0) (:text "|\".dylib")
                  |v $ %{} :Expr (:at 1630231448478) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630231449901) (:by |u0) (:text |:windows)
                      |j $ %{} :Leaf (:at 1630231461388) (:by |u0) (:text "|\".dll")
        |get-dylib-path $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1635220682827) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1635220682827) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1635220682827) (:by |u0) (:text |get-dylib-path)
              |r $ %{} :Expr (:at 1635220682827) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635220697524) (:by |u0) (:text |p)
              |v $ %{} :Expr (:at 1635220685851) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1635220685851) (:by |u0) (:text |str)
                  |j $ %{} :Expr (:at 1635220685851) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220685851) (:by |u0) (:text |or-current-path)
                      |j $ %{} :Leaf (:at 1635220685851) (:by |u0) (:text |calcit-dirname)
                  |r $ %{} :Leaf (:at 1635220702274) (:by |u0) (:text |p)
                  |v $ %{} :Expr (:at 1635220685851) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1635220685851) (:by |u0) (:text |get-dylib-ext)
        |or-current-path $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1630245582276) (:by |u0)
            :data $ {}
              |T $ %{} :Leaf (:at 1630245583936) (:by |u0) (:text |defn)
              |j $ %{} :Leaf (:at 1633181131099) (:by |u0) (:text |or-current-path)
              |r $ %{} :Expr (:at 1630245582276) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630245585364) (:by |u0) (:text |p)
              |v $ %{} :Expr (:at 1630245585942) (:by |u0)
                :data $ {}
                  |T $ %{} :Leaf (:at 1630245586336) (:by |u0) (:text |if)
                  |j $ %{} :Expr (:at 1630245586894) (:by |u0)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1630245614560) (:by |u0) (:text |blank?)
                      |j $ %{} :Leaf (:at 1630245615061) (:by |u0) (:text |p)
                  |r $ %{} :Leaf (:at 1630245616843) (:by |u0) (:text "|\".")
                  |v $ %{} :Leaf (:at 1630245618366) (:by |u0) (:text |p)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1633181044360) (:by |u0)
          :data $ {}
            |T $ %{} :Leaf (:at 1633181044360) (:by |u0) (:text |ns)
            |j $ %{} :Leaf (:at 1633181044360) (:by |u0) (:text |calcit.std.util)
            |r $ %{} :Expr (:at 1635220717892) (:by |u0)
              :data $ {}
                |T $ %{} :Leaf (:at 1635220717892) (:by |u0) (:text |:require)
                |j $ %{} :Expr (:at 1635220717892) (:by |u0)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1635220717892) (:by |u0) (:text |calcit.std.$meta)
                    |j $ %{} :Leaf (:at 1635220717892) (:by |u0) (:text |:refer)
                    |r $ %{} :Expr (:at 1635220717892) (:by |u0)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1635220717892) (:by |u0) (:text |calcit-dirname)
  :users $ {}
    |u0 $ {} (:avatar nil) (:id |u0) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
