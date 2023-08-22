
(de pf Args
  (let (
    @Proto (head -1 Args)
    @Fun (pick '((P)(eval ( append '(get) P (list (last Args) )  ) ) ) (reverse @Proto))
    @Self ( last @Proto) )

    (when (> (length @Proto) 1)
      (setq @Super (append '(pf) (head -1 @Proto) (list (last Args)) ) ) ) #(last Args) is a (quote . fun) cons pair

    (if (pair @Fun)
      (insert 2 @Fun (fill '(setq Proto '@Proto Self '@Self Super '@Super) ) )
      @Fun  ) ) )

(when *Dbg
  (setq things '(
    (Default . (
        (fun1 . ((Arg) (list 'Default 'fun1 Arg Proto)))
        (fun2 . ((Arg) (list 'Default 'fun2 Arg Proto)))
        (fun3 . ((Arg) (list 'Default 'fun3 Arg Proto)))
        (fun4 . ((Arg) (list 'Default 'fun4 Arg Proto)))
        (fun5 . ((Arg) (list 'Default 'fun5 Arg Proto))) 
        (val1 . V1)
        (val2 . V2)) )
    (Top . (
        (fun2 . ((Arg) (list 'Top 'fun2 Arg Proto)))
        (fun5 . ((Arg) (list 'Top 'fun5 Arg Proto)))
        (Missing . ((Arg) (list 'Top Meth Arg Proto)))
        (val1 . TV1)))
    (Foo . (
        (fun1 . ((Arg) (list 'Foo 'fun1 Arg Proto)))
        (fun3 . ((Arg) (list 'Foo 'fun3 Arg Proto)))
        (fun4 . ((Arg) ((eval Super) Arg))))) ) )   
  (test '(Default fun4 asdf ((things 'Default))) ((pf (things 'Default) (things 'Foo) 'fun4 ) 'asdf) )
  (test 'TV1 (pf (things 'Default) (things 'Top) 'val1) ) )
