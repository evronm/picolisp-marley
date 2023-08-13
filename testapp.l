
(load "config.l")
(load "lib/proto.l")
(load "lib/util.l")
(load "lib/sqlite.l")
(load "lib/rest.l")
(symbols 'things 'rst 'cgi 'sqlite 'util 'pico)

(setq users 
  '(      
    (criteria . (type . ""))
  )
)
(setq vendors 
  '(
    (table . "users")
    (criteria . (type = v))
    (ownder_col . "id")
    (get . ((Args) (list "get" Args "vendor")))
    (post . ((Args) (list "post" Args "vendor")))
    (put` . ((Args) (list "put" Args "vendor")))
    (delete . ((Args) (list "delete" Args "vendor")))
  )
)
(setq providers 
  '(
    (table . "users")
    (criteria . (type = p))
    (ownder_col . "id")
    (get . ((Args) (list "get" Args "pro")))
    (post . ((Args) (list "post" Args "pro")))
    (put` . ((Args) (list "put" Args "pro")))
    (delete . ((Args) (list "delete" Args "pro")))
  )
)
(setq services  
  '(
    (perms . 744)
    (owner_col . vendor_id)
  )
)
(setq itineraries '() )

(process_req)
