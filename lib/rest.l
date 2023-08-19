#(load 'lib/cgi.l)
(load 'lib/server.l)
(symbols 'rst 'serv 'sqlite 'util 'pico)

(de conf @
  (if (= 1 (length (rest)))
    (assoc (car (rest)) *DEFAULTS)
    (assoc (next) (conf (rest)))
  )
)

(de confv @
  (cdr (conf (car (rest))))
)

(setq pico~*SQL (get_db (confv 'db_fn)))
(finish (sqlite3_close *SQL))

(de authn (Un Pw)
  (prinl Un "\n" Pw)
  T
)

(de process_req (Verb Path Qs Post User)
  (if (= NIL Path)
  )
  (or 
    (! respond 200 ((pf (list (conf 'thing) (assoc (car Path) things)) Verb) (cdr Path)))
    (respond 404)
  )
  
)


(de Authz (Un Verb Path))




(when *Dbg

)
