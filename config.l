(symbols 'util 'sqlite 'pico) #need to figure out why this is needed...
(setq *DEFAULTS
  '(
    (db_fn . DB)
    (default_path . "index.htmx")
    (static_dir . "static/")
    (no_authn . 
      (
        (get . ((user new) ""))
        (post . ((user)))
      )
    )
    (thing . 
      (
        (table . (() (any (car Self))))
        (columns . (() (get_col_names ((pf Proto 'list_sql)))))
        (list_sql . (() (pack "select * from " ((pf Proto 'table)) ";")))
        (list . ((Params) (sqlite~q pico~*SQL ((pf Proto 'list_sql)))))
        (perms . 754)
        (index . id)
        (users_tbl . users)
        (groups_tbl . groups)
        (owner_col . user_id)
        (group_col . group_id)
        (get . ((Args) 
           (case (car Args)
            (NIL ((pf Proto 'list)))
            ("new" ((pf Proto 'new)))
           )
        ))
        (post . "post")
        (put . "put")
        (delete . "delete")
      )
    )
  )
)
