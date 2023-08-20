#(load 'lib/cgi.l)
(load 'lib/server.l)
(symbols 'rst 'serv 'sqlite 'util 'pico)

(de conf (Lst)
  (if (= 1 (length Lst))
    (assoc (car Lst) *DEFAULTS)
    (assoc (car Lst) (conf (cdr Lst)))
  )
)

(de confv (Lst)
  (cdr (conf Lst))
)

(setq pico~*SQL (get_db (confv '(db_fn))))
(finish (sqlite3_close *SQL))

(de authn (Un Pw)
  (prinl Un "\n" Pw)
  T
)

(de Authz (Un Verb Path)
)

(de process_req (Verb Path Qs Post User)
  (default Path (conf '(default_path)))
  (or 
    (and 
      (setq Fn (car Path))
      (match (append '(@foo) '(.) '(@ext)) (chop Fn))
      (if  (member (pack @ext) '(html htmx css js png gif))
        (if (info (pack "static/" Fn)) 
          (respond 200 (in (append '(echo) (pack (conf '(static_dir)) Fn )) (till)))
          (respond 404)
        )
        (respond 403)
      )
    )
    (respond 200 ((pf (list (conf '(thing)) (assoc (car Path) things)) Verb) (cdr Path)))
    (respond 404)
  )
  
)

(when *Dbg

)
