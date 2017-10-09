(define (eval-and exps) ;; .. env)
  (cond ((null? exps) #t)
        ((true? (eval (car exps))) (eval-and (cdr exps)))
        (else #f)))

(define (eval-or exps) ;; .. env)
  (cond ((null? exps) #f)
        ((true? (eval (car exps))) #t)
        (else (eval-or (cdr exps)))))

