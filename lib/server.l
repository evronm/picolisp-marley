
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
(!)

(de respond (Stat Body)
  (case Stat
    (200 (out *Sock (prinl "HTTP/1.1 200 OK\n" "Server: Marley\n" "Content-Type: text/html; charset=UTF-8\n\n" "<!doctype html>\n" Body)))
    (401 (out *Sock (prinl "HTTP/1.1 401 Unauthorized\n" "WWW-Authenticate: Basic realm=\"Please Log In\"\n")))
  )
)
(loop
  (setq *Sock (listen P))
  (setq Headers (make (while (in *Sock (line T)) (link @))))
  (respond 200 (pack "<pre>" (mapcar '((H) (list H "\n")) Headers) "</pre>"))
  
  (close *Sock) 
)

