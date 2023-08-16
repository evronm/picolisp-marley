(load "lib/util.l")
(symbols 'util 'pico)

(setq *Port 4200)
(setq P (port *Port))
(setq *Char64 `'(chop "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" ) )
(de decode64 (S)
   (let S (chop S)
      (pack
         (make
            (while S
               (let
                  (A (dec (index (++ S) *Char64))
                     B (dec (index (++ S) *Char64))
                     C (dec (index (++ S) *Char64))
                     D (dec (index (++ S) *Char64)) )
                  (link
                     (char (| (>> -2 A) (>> 4 B))) )
                  (and
                     C
                     (link
                        (char
                           (| (>> -4 (& B 15)) (>> 2 C)) ) )
                     D
                     (link
                        (char (| (>> -6 (& C 3)) D)) ) ) ) ) ) ) ) )

(de respond (Stat Body)
  (case Stat
    (200 (out *Sock (prinl "HTTP/1.1 200 OK\n" "Server: Marley\n" "Content-Type: text/html; charset=UTF-8\n\n" "<!doctype html>\n" Body)))
    (401 (out *Sock (prinl "HTTP/1.1 401 Unauthorized\n" "WWW-Authenticate: Basic realm=\"Please Log In\"\n")))
  )
)

(de authn (Un Pw)
  (prinl Un Pw)
  T
)

(loop
  (setq *Sock (listen P))
  (setq Req (make (while (in *Sock (line T)) (link @))))
  (setq Verb (pack (car (sc (car Req) " "))))
  (setq Headers (mapcar '((H) (let (F (sc H ":")) (cons (pack (car F)) (pack (cdr F))))) (cdr Req)))
  (if (setq Unpw (pack (tail 1 (sc (cdr (assoc "Authorization" Headers)) " "))))
    (if (authn (mapcar 'pack (sc (decode64 Unpw) ":")))
      (respond 200 (pack "<pre>" (mapcar '((H) (list H "\n")) Headers) "</pre>"))
      (respond 401)
    )
    (respond 401)
    
  )
  
  
  (close *Sock) 
)
