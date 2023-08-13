(load 'lib/cgi.l)
(symbols 'rst 'cgi 'util 'pico)

(setq *DEFAULTS
  '(
    (db_fn . DB)
    (table . 
      (
        (perms . 754)
        (index . id)
        (users_tbl . users)
        (groups_tbl . groups)
        (owner_col . user_id)
        (group_col . group_id)
        (get . ((Args) (list Proto Args 'get) ))
        (post . "post")
        (put . "put")
        (delete . "delete")
      )
    )
  )
)

(de process_req ()
  (or 
    (intern (car *Path) "things")
    (quit "Not found.")
  )
  (eval (list 'pf (any (car *Path)) (any *Verb)))
)

(de authn (Un Pw)
)

(de Authz (Un Verb Noun))

(de current_user () 
  ()
)



(when *Dbg

)
