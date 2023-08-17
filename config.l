
(setq *DEFAULTS
  '(
    (db_fn . DB)
    (thing . 
      (
        (table . (() (any (car Self))))
        (columns . (() (prinl 'columns)))
        (list . ((Params) 'list))
        (perms . 754)
        (index . id)
        (users_tbl . users)
        (groups_tbl . groups)
        (owner_col . user_id)
        (group_col . group_id)
        (get . ((Args) 
           (case (car Args)
            (NIL ((pf Proto 'list)))
           )
        ))
        (post . "post")
        (put . "put")
        (delete . "delete")
      )
    )
  )
)
