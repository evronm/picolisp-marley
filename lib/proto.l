(de pf (Proto Fun)
  (insert 2 Fun (fill '(setq Proto 'Proto)))
)

(de process_funs (Args)
  (setq Proto (car Args) Lst (cdr Args))

  (list
    (cons 'proto Proto)
    (mapcar '((Pr)
      (list (car Pr) (if (lst? (cdr Pr)) (pf (car Proto) (cadr Pr) ) (cdr Pr)))
    ) Lst)
  )
)

(de merge_protos (Defs Lst)
  (cons
    (append (car Defs) (car Lst))
    (mapcar '((Def) (or (assoc (car Def) Lst) Def)) (cdr Defs))
  )
)

(de proto @
  (use Acc
    (setq Acc (next))
    (while (args) 
      (setq Acc (merge_protos Acc (next) ))
    )
  )
)

(when *Dbg
  (setq Default 
    '((Default) .
      ((fun1  ((Arg) (list 'Default 'fun1 Arg Proto)))
      (fun2  ((Arg) (list 'Default 'fun2 Arg Proto)))
      (fun3  ((Arg) (list 'Default 'fun3 Arg Proto)))
      (fun4  ((Arg) (list 'Default 'fun4 Arg Proto)))
      (fun5  ((Arg) (list 'Default 'fun5 Arg Proto)))
    ))
  )
  (setq Top 
    '((Top) .
      ((fun2  ((Arg) (list 'Top 'fun2 Arg Proto)))
      (fun5  ((Arg) (list 'Top 'fun5 Arg Proto)))
    ))
  )
  (setq Foo
    '((Foo) .
      ((fun1  ((Arg) (list 'Foo 'fun1 Arg Proto)))
      (fun3  ((Arg) (list 'Foo 'fun3 Arg Proto)))
    )
  ))
)
