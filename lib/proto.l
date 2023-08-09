

(de merge_protos (Defs Lst)
  (mapcar '((Def)
    (or (assoc (car Def) Lst) Def)
  ) Defs)
)

(de proto_fun (Proto Fun)
  (setq @Proto Proto)
  (conc 
    (list 
      (car Fun)
      (fill '(setq Proto '@Proto))
    )
    (cdr Fun)
  )
)

(de process_funs (Args)
  (setq Proto (car Args) Lst (cdr Args))

  (list
    (list 'proto Proto)
    (mapcar '((Pr)
      (list (car Pr) (if (lst? (cdr Pr)) (proto_fun Proto (cadr Pr) ) (cdr Pr)))
    ) Lst)
  )
)

(de proto @
  (setq Protos (rest))
      (proto 
        (append
          (head -3 Proto)
          (merge_protos 
            (tail 1 Proto) 
            (car (tail 2 Proto))
          )
        )
      )
)

(when *Dbg
  (setq Default 
    '(Default .
      ((fun1  ((Arg) (list 'Default 'fun1 Arg Proto)))
      (fun2  ((Arg) (list 'Default 'fun2 Arg Proto)))
      (fun3  ((Arg) (list 'Default 'fun3 Arg Proto)))
      (fun4  ((Arg) (list 'Default 'fun4 Arg Proto)))
      (fun5  ((Arg) (list 'Default 'fun5 Arg Proto)))
    ))
  )
  (setq Top 
    '(Top .
      ((fun2  ((Arg) (list 'Top 'fun2 Arg Proto)))
      (fun5  ((Arg) (list 'Top 'fun5 Arg Proto)))
    ))
  )
  (setq Foo
    '(Foo .
      ((fun1  ((Arg) (list 'Foo 'fun1 Arg Proto)))
      (fun3  ((Arg) (list 'Foo 'fun3 Arg Proto)))
    )
  ))
)
