(symbols 'rst 'r 'sqlite 'util 'pico)

(local) ('+Rest)

(de config (k)
  (cdr (assoc k *CONFIG))
)

(put *Indexes T 'id)

(de get_index (Ent)
  (or (get '*Indexes Ent) (get '*Indexes T))
)
(de process_req ()
)

(de current_user () 
  ()
)



(when *Dbg

)
