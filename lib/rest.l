#(load 'lib/cgi.l)
(load 'lib/server.l)
(symbols 'rst 'serv 'util 'pico)

(de authn (Un Pw)
  (prinl Un Pw)
  T
)

(de process_req (Verb Path Qs Post User)
  (respond 200 (pack "<pre>\nVerb: " Verb "\nPath: " Path "\nQs:" Qs "\nPost" Post "\nUser:" User "</pre>"))
  #(or 
  #  (setq Thing (assoc (car Path) things) )
  #  (quit "Not found.")
  #)
  #((pf (list (assoc 'thing *DEFAULTS) Thing) Verb) (car Path))
)


(de Authz (Un Verb Path))




(when *Dbg

)
