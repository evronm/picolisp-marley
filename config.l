
(setq *DEFAULTS
  '(
    (db_fn . DB)
    (thing . 
      (
        (table . (() (! any (car Self))))
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
