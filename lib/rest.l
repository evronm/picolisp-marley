(load 'lib/cgi.l)
(symbols 'rst 'cgi 'util 'pico)


(de process_req ()
  (or 
    (setq Thing (assoc (car *Path) things) )
    (quit "Not found.")
  )
  ((pf (list (assoc 'thing *DEFAULTS) Thing) *Verb) (car *Path))
)

(de authn (Un Pw)
)

(de Authz (Un Verb Noun))

(de current_user () 
  ()
)



(when *Dbg

)
