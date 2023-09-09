
(load "lib/proto.l")
(load "lib/util.l")
(load "lib/sqlite.l")
(load "lib/server.l")
(load "config.l")

#(symbols 'marley 'util 'rst 'sqlite 'pico)

(de conf (Lst)
  (if (= 1 (length Lst))
    (assoc (car Lst) *DEFAULTS)
    (assoc (car Lst) (conf (cdr Lst)))))

(de confv (Lst)
  (cdr (conf Lst)))

(setq *SQL (get_db (confv '(db_fn))))
(finish (sqlite3_close *SQL))

(de authn (Un Pw)
  (prinl Un "\n" Pw)
  T
)

(de Authz (Un Verb Path)
)

(de process_req (Verb Path Qs Post User)
  (default Path (confv '(default_path)))
  (or 
    (and 
      (setq Fn (car Path))
      (match (append '(@foo) '(.) '(@ext)) (chop Fn))
      (if  (member (pack @ext) '(html htmx css js png gif))
        (if ( info (pack (confv '(static_dir)) Fn)) 
          (respond 200 (in (pack (confv '(static_dir)) Fn ) (till)))
          (respond 404))
        (respond 403)))
    (if (setq thing (get things (intern (car Path))))
      (respond 200 ((pf (*DEFAULTS 'thing) (things (intern (car Path))) (intern Verb) ) (cdr Path)) )
      (respond 404))
    (respond 404)))

(when *Dbg

)
