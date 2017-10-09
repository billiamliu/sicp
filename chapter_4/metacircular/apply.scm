(define (application? exp) (pair? exp))

(define (apply proc args)
  (cond ((primitive-procedure? proc) (apply-primitive-procedure proc args))
        ((compound-procedure? proc)
         (eval-sequence
           (procedure-body proc)
           (extend-environment
             (procedure-parameters proc)
             args
             (procedure-environment proc))))
        (else
          (error "Unknown procedure type -- APPLY" proc))))

