(de reggae @
  (list "[" (rest) "]"))

(de resource (Ty Props . @)
  (append '("[" ) (list Ty) '(",") (props Props) '(",") (mapcar 'resource (rest)) '("]")) )

(de props @
  (list "{" (mapcar '((Kv) (list (car Kv) ":" (cdr Kv) ",")) (car (rest))) "}"))

(de lnk (Title Desc Url . @)
  (resource 'link (list (cons 'title Title) (cons 'description Desc) (cons 'url Url)) (rest))) 

(if *Dbg

)
