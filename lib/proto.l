(de pf Args
  (let 
    (@Proto (head -1 Args) 
    @Fun (get_fun Args) 
    @Self (car (tail 2 Args)) 
    @Super (append '(get_fun) (head -2 Args) (tail 1 Args)))
    (insert 2 (get @Self @Fun) 
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

(de get_fun Args
  (let (Proto (head -1 Args) Fun_nm (car (tail 1 Args)))
   (pick '((Sym) ( get Sym Fun_nm)) (reverse Proto))
  )
)


(when *Dbg
  (putl 'Default 
    '(
      (((Arg) (list 'Default 'fun1 Arg Proto)) . fun1)
      (((Arg) (list 'Default 'fun2 Arg Proto)) . fun2)
      (((Arg) (list 'Default 'fun3 Arg Proto)) . fun3)
      (((Arg) (list 'Default 'fun4 Arg Proto)) . fun4)
      (((Arg) (list 'Default 'fun5 Arg Proto)) . fun5)
    )
  )
  (putl 'Top 
    '(
      (((Arg) (list 'Top 'fun2 Arg Proto)) . fun2)
      (((Arg) (list 'Top 'fun5 Arg Proto)) . fun5)
      (((Arg) (list 'Top 'fun5 Arg Proto)) . Missing)
    )
  )
  (putl 'Foo
    '(
      (((Arg) (list 'Foo 'fun1 Arg Proto)) . fun1)
      (((Arg) (list 'Foo 'fun3 Arg Proto)) . fun3)
    )
  )
  ~(assert (= 
    (pf Default Foo fun2)  
    '((setq Proto '(Default Foo) Self 'Foo Super '(get_fun Default fun2)))))
)
