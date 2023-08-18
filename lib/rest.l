#(load 'lib/cgi.l)
(load 'lib/server.l)
(symbols 'rst 'serv 'sqlite 'util 'pico)

(de conf (K)
  (assoc K *DEFAULTS)
)

(de confv (K)
  (cdr (conf K))
)

(setq pico~*SQL (get_db (confv 'db_fn)))
(finish (sqlite3_close *SQL))

(de authn (Un Pw)
  (prinl Un "\n" Pw)
  T
)

(de process_req (Verb Path Qs Post User)
  (or 
    (respond 200 ((pf (list (conf 'thing) (assoc (car Path) things)) Verb) (cdr Path)))
    (respond 404)
  )
  
)


(de Authz (Un Verb Path))




(when *Dbg

)
