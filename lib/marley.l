
(load "lib/proto.l")
(load "lib/util.l")
(load "lib/sqlite.l")
(load "lib/rest.l")
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

