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

(define (make-procedure params body env)
  (list 'procedure params body env))

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))

(define (compound-procedure? proc)
  (tagged-list? proc 'procedure))

(define (procedure-parameters proc) (cadr proc))

(define (procedure-body proc) (caddr proc))

(define (procedure-environment proc) (cadddr proc))

(define (analyze-application exp)
  (let ((fproc (analyze (operator exp)))
        (aprocs (map analyze (operands exp))))
    (lambda (env)
      (execute-application (fproc env)
                           (map (lambda (aproc) (aproc env))
                                aprocs)))))
(define (execute-application proc args)
  (cond ((primitive-procedure? proc)
         (apply-primitive-procedure proc args))
        ((compound-procedure? proc)
         (display "_-_- COMPOUND PROC?")
         ;(display ((procedure-body proc) 123))
         ((procedure-body proc)
          (extend-environment (procedure-parameters proc)
                              args
                              (procedure-environment proc))))
        (else
          (error
            "Unknown procedure type -- EXEC APPLICATION"
            proc))))
