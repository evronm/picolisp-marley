#(symbols 'util 'pico)
(load "lib/plursing.l")



(de pw_hash (Pw Salt)
  (pipe (out (list 'argon2 Salt '-r) (prin Pw)) (read))
)

(de sc (Str Sep)
  (split (chop Str) Sep)
)

(de capitalize (Str)
  (let s (chop Str)
    (pack (uppc (car s)) (cdr s))
  )
)

(de camelize (Str)
  (pack (mapcar 'capitalize (sc Str "_") ))
)

(de to_cls_nm (Str)
  (pack "+" (camelize Str))
)



(de surr (Str Surr)
  (let (Close (
    case Surr
      ("(" . ")")
      ("[" . "]")
      ("{" "}")
      (T Surr)
  )) 
    (pack Surr Str Close)
  )
)


(when *Dbg
  ~(assert (= 'cbc25a53074d0702178e1f0cb015c2a4667f6af5b6ba1ba9289b289afaa7ca26 (pw_hash 'password '12345678)))
  ~(assert (= "xasdfx" (surr "asdf" "x")))
  ~(assert (= "(asdf)" (surr "asdf" "(")))
  ~(assert (= "[asdf]" (surr "asdf" "[")))
  ~(assert (= "{asdf}" (surr "asdf" "{")))

  ~(assert (= "+AsdfXxx" (to_cls_nm 'asdf_xxx)))


)

