(load 'lib/cgi.l)
(symbols 'rst 'r 'sqlite 'util 'pico)

(setq *DEFAULTS
  '(
    (db_fn . DB))
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

(de merge_defaults (Defs Lst)
  (mapcar '((Def)
    (or (assoc (car Def) Lst) Def)
  ) Defs)
)
(de get_config (K Tbl)
  (or 
    (cdr (assoc K (cdr (assoc Tbl *CONFIG))) )
    (cdr (assoc K (cdr (assoc NIL *CONFIG))) )
    (cdr (assoc K *DEFAULTS))
    (quit "Configuration not found" K Tbl)
  )
)

(de get_noun (Nm)
  (or 
    (merge_defaults (cdr (assoc 'table *DEFAULTS)) (assoc Nm nouns))
    (quit "Noun not found" Nm)
  )
)

(de process_req ()

)


(de current_user () 
  ()
)



(when *Dbg

)
