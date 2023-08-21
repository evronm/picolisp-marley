
(de pf Args
  (let (
    @Proto (head -1 Args)
    @Fun (pick '((P)(get (eval P) (cdr (last Args) )  ) ) (reverse @Proto))
    @Self ( last @Proto) )

    (when (> (length @Proto) 1)
      (setq @Super (append '(pf) (head -1 @Proto) (list (last Args)) ) ) ) #(last Args) is a (quote . fun) cons pair

    (if (pair @Fun)
      (insert 2 @Fun (fill '(setq Proto '@Proto Self @Self Super '@Super) ) )
      @Fun  ) ) )

(when *Dbg
  (setq things '(
    (Default . (
        (fun1 . ((Arg) (list 'Default 'fun1 Arg Proto)))
        (fun2 . ((Arg) (list 'Default 'fun2 Arg Proto)))
        (fun3 . ((Arg) (list 'Default 'fun3 Arg Proto)))
        (fun4 . ((Arg) (list 'Default 'fun4 Arg Proto)))
        (fun5 . ((Arg) (list 'Default 'fun5 Arg Proto))) ) )
    (Top . (
        (fun2 . ((Arg) (list 'Top 'fun2 Arg Proto)))
        (fun5 . ((Arg) (list 'Top 'fun5 Arg Proto)))
        (Missing . ((Arg) (list 'Top Meth Arg Proto) ) )))
    (Foo . (
        (fun1 . ((Arg) (list 'Foo 'fun1 Arg Proto)))
        (fun3 . ((Arg) (list 'Foo 'fun3 Arg Proto))) ) ) )  
        (fun4 . ((Arg) (Super Args))))

  (test '(Default fun1 asdf ((get things 'Default))) ((pf  (get things 'Default) 'fun1) 'asdf) ) 
  (test '(Top fun2 asdf ((get things 'Default) (get things 'Top))) ((pf  (get things 'Default) (get things 'Top) 'fun2) 'asdf) )
  (test '(Foo fun3 x ((get things 'Default) (get things 'Foo))) ((pf  (get things 'Default) (get things 'Foo) 'fun3) 'x) )
  (test '(Top fun2 asdf ((get things 'Default) (get things 'Top) (get things 'Foo))) ((pf  (get things 'Default) (get things 'Top) (get things 'Foo) 'fun2) 'asdf)) 
  (test '(Default fun4 asdf ((get things 'Default) (get things 'Top) (get things 'Foo))) ((pf (get things 'Default) (get things 'Top) (get things 'Foo) 'fun4) 'asdf)) )
