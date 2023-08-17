#(load 'lib/cgi.l)
(load 'lib/server.l)
(symbols 'rst 'serv 'util 'pico)

(de authn (Un Pw)
  (prinl Un Pw)
  T
)

(de process_req (Verb Path Qs Post User)
  (or 
#    (setq Thing (assoc (car Path) things) )
    (respond 200 ((pf (list (assoc 'thing *DEFAULTS) (assoc (car Path) things)) Verb) (cdr Path)))
    (respond 404)
  )
  
)


(de Authz (Un Verb Path))




(when *Dbg

)
