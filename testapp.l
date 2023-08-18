
(load "lib/sqlite.l")
(load "lib/proto.l")
(load "lib/util.l")
(load "config.l")
(load "lib/rest.l")
(symbols 'rst  'sqlite 'serv 'util 'pico)


(setq things
  '(
    (users .
      (      
        (criteria . (type . ""))
      )
    )
    (vendors .
      (
        (table . "users")
        (criteria . (type = v))
        (ownder_col . "id")
        (post . ((Args) (list "post" Args "vendor")))
        (put` . ((Args) (list "put" Args "vendor")))
        (delete . ((Args) (list "delete" Args "vendor")))
      )
    )
    (providers .
      (
        (table . "users")
        (criteria . (type = p))
        (ownder_col . "id")
        (get . ((Args) (list "get" Args "pro")))
        (post . ((Args) (list "post" Args "pro")))
        (put` . ((Args) (list "put" Args "pro")))
        (delete . ((Args) (list "delete" Args "pro")))
      )
    )
    (services .
      (
        (perms . 744)
        (owner_col . vendor_id)
      )
    )
    (itineraries . () )
  )
)

#(start authn process_req) 
