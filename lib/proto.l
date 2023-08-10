(de pf Args
  (let (@Proto (head -1 Args) @Fun (car (tail 1 Args)) @Self (car (tail 2 Args))) 
    (insert 2 (get @Self @Fun) 
      (fill 
        '(setq 
          Proto '@Proto 
          Self '@Self
          Super '(get (car (tail 1 Proto)) @Fun) 
        )
      )
    )
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
    )
  )
  (putl 'Foo
    '(
      (((Arg) (list 'Foo 'fun1 Arg Proto)) . fun1)
      (((Arg) (list 'Foo 'fun3 Arg Proto)) . fun3)
    )
  )
)
