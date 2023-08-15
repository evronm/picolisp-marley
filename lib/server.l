
(setq *Port 4200)
(setq P (port *Port))

(loop
  (setq *Sock (listen P))
  (!)
  (make (while (in *Sock (line T)) (link @)))
  
  (close *Sock) 
)


