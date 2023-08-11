(de pf Args
  (let 
    (@Proto (head -1 Args) 
    @Fun (get_fun Args) 
    @Self (car (tail 2 Args)) 
    @Super (append '(get_fun) (head -2 Args) (tail 1 Args)))
    (insert 2 @Fun
      (fill 
        '(setq 
          Proto '@Proto 
          Self '@Self
          Super '@Super
        )
      )
    )
  )
)

(de get_fun (Args)
  (let (Proto (head -1 Args) Fun_nm (car (tail 1 Args)))
   (pick '((Sym) (cdr (assoc Fun_nm (val Sym)))) (reverse Proto))
  )
)


(when *Dbg
  (setq Default 
    '(
      (fun1 . ((Arg) (list 'Default 'fun1 Arg Proto)))
      (fun2 . ((Arg) (list 'Default 'fun2 Arg Proto)))
      (fun3 . ((Arg) (list 'Default 'fun3 Arg Proto)))
      (fun4 . ((Arg) (list 'Default 'fun4 Arg Proto)))
      (fun5 . ((Arg) (list 'Default 'fun5 Arg Proto)))
    )
  )
  (setq Top 
    '(
      (fun2 . ((Arg) (list 'Top 'fun2 Arg Proto)))
      (fun5 . ((Arg) (list 'Top 'fun5 Arg Proto)))
      (Missing . ((Arg) (list 'Top 'fun5 Arg Proto)))
    )
  )
  (setq Foo
    '(
      (fun1 . ((Arg) (list 'Foo 'fun1 Arg Proto)))
      (fun3 . ((Arg) (list 'Foo 'fun3 Arg Proto)))
    )
  )
  ~(assert (=  ((pf Default Foo fun1) 'asdf) '(Foo fun1 asdf (Default Foo))))
  ~(assert (=  ((pf Top Foo fun2) 'xxxx) '(Top fun2 xxxx (Top Foo))))
  ~(assert (=  ((pf Default Top Foo fun3) 'ffff) '(Foo fun3 ffff (Default Top Foo))))
)
