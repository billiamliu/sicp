(define (each proc items)
  (cond ((null? items) #t)
        (else (proc (car items))
              (each proc (cdr items)))))

(each
  (lambda (x) (newline) (display x))
  (list 123 234 345))
