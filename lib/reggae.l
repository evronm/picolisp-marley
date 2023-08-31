(load '@lib/json.l)
(de reggae @
  (glue "," (mapcar '((Arg) (packJson Arg))  (rest)) ) )

(de mesg (Titl Msg)
  (list "msg" Titl Msg))

(de url (Url Titl Desc)
  (list "url" Url Titl Desc)
)







(when *Dbg

  (test "[\"msg\", \"asdf\", \"zxcv zxcv\"]", (reggae (mesg "asdf" "zxcv zxcv")))

)
