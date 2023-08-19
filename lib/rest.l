#(load 'lib/cgi.l)
(load 'lib/server.l)
(symbols 'rst 'serv 'sqlite 'util 'pico)

(de conf Args
  (if (= 1 (length Args))
    (assoc (cdar Args) *DEFAULTS)
    (assoc (cdar Args) (eval (append '(conf) (cdr Args))))
  )
)

(de confv Args
  (cdr (eval (append '(conf) Args)))
)

(setq pico~*SQL (get_db (confv 'db_fn)))
(finish (sqlite3_close *SQL))

(de authn (Un Pw)
  (prinl Un "\n" Pw)
  T
)

(de Authz (Un Verb Path)
)

(de process_req (Verb Path Qs Post User)
  (when (= NIL Path)
    (setq Path '(index.htmx))
  )

  (or 
    (and 
      (setq Fn (car Path))
      (match (append '(@foo) '(.) '(@ext)) (chop Fn))
      (member (pack @ext) '(html htmx css js png gif))
      (if (info (pack "misc/" Fn)) 
        (respond 200 (in (append '(echo) (pack "misc/" Fn )) (till)))
        (respond 404)
      )
    )
    (respond 200 ((pf (list (conf 'thing) (assoc (car Path) things)) Verb) (cdr Path)))
    (respond 404)
  )
  
)

(when *Dbg

)
