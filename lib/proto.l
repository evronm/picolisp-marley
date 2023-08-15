(de pf (Proto Fun)
  (let 
    (
      @Proto Proto
      @Fun (get_fun Proto Fun) 
      @Self (car (tail 1 Proto)) 
      @Super (append '(get_fun) (head -1 Proto) (tail 1 Args))
    )
    
  (!)
    (if (lst? @Fun)
      (insert 2 @Fun (fill '(setq Proto '@Proto Self '@Self Super '@Super)))
      @Fun
    )
  )
)

(de get_fun (Proto Fun)
  (or 
    (pick '((Sym) (cdr (assoc Fun Sym))) (reverse Proto))
    (when (not (member 'Missing Proto))
      (let (Fun (get_fun (append Proto '(Missing))) @Fun Fun)
        (insert 2 Fun (fill '(setq Meth '@Fun))) 
      )
    )
 )
)


#{(when *Dbg
  (setq things '(
    (Default .
      (
        (fun1 . ((Arg) (list 'Default 'fun1 Arg Proto)))
        (fun2 . ((Arg) (list 'Default 'fun2 Arg Proto)))
        (fun3 . ((Arg) (list 'Default 'fun3 Arg Proto)))
        (fun4 . ((Arg) (list 'Default 'fun4 Arg Proto)))
        (fun5 . ((Arg) (list 'Default 'fun5 Arg Proto)))
      )
    )
    (Top .
      (
        (fun2 . ((Arg) (list 'Top 'fun2 Arg Proto)))
        (fun5 . ((Arg) (list 'Top 'fun5 Arg Proto)))
        (Missing . ((Arg) (list 'Top Meth Arg Proto)))
      )
    )
    (Foo .
      (
        (fun1 . ((Arg) (list 'Foo 'fun1 Arg Proto)))
        (fun3 . ((Arg) (list 'Foo 'fun3 Arg Proto)))
      )
    ))
  )
  ~(assert (= ((pf (list (assoc 'Default things)) 'fun1) 'asdf) '(Default fun1 asdf ((Default (fun1 (Arg) (list 'Default 'fun1 Arg Proto)) (fun2 (Arg) (list 'Default 'fun2 Arg Proto)) (fun3 (Arg) (list 'Default 'fun3 Arg Proto)) (fun4 (Arg) (list 'Default 'fun4 Arg Proto)) (fun5 (Arg) (list 'Default 'fun5 Arg Proto)))))))
  ~(assert (= ((pf (list (assoc 'Default things) (assoc 'Foo things)) 'fun1) 'asdf) '(Foo fun1 asdf ((Default (fun1 (Arg) (list 'Default 'fun1 Arg Proto)) (fun2 (Arg) (list 'Default 'fun2 Arg Proto)) (fun3 (Arg) (list 'Default 'fun3 Arg Proto)) (fun4 (Arg) (list 'Default 'fun4 Arg Proto)) (fun5 (Arg) (list 'Default 'fun5 Arg Proto))) (Foo (fun1 (Arg) (list 'Foo 'fun1 Arg Proto)) (fun3 (Arg) (list 'Foo 'fun3 Arg Proto)))))))
)}#
