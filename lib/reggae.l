(de reggae @
  (list "[" (rest) "]"))

(de resource (Ty Props . @)
  (append '("[" ) (list Ty) '(",") (props Props) '(",") (when (car (rest)) (mapcar 'resource (rest))) '("]")) )

(de props @
  (list "{" (glue "," (mapcar '((Kv) (list (car Kv) ":" "\"" (cdr Kv) "\"")) (car (rest)))) "}"))

(de lnk (Title Desc Url . @)
  (resource 'link (list (cons 'title Title) (cons 'description Desc) (cons 'url Url)) (rest))) 

(when *Dbg
  (test "[link,{title:\"foo\",description:\"bar\",url:\"http://example.com\"},]", (pack (lnk 'foo 'bar 'http://example.com)))

)
