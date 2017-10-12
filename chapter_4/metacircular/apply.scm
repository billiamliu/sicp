(define (application? exp) (pair? exp))

(define (apply proc args env)
  (cond ((primitive-procedure? proc)
         (apply-primitive-procedure
           proc
           (list-of-arg-values args env)))
        ((compound-procedure? proc)
         (eval-sequence
           (procedure-body proc)
           (extend-environment
             (procedure-parameters proc)
             (list-of-delayed-args args env)
             (procedure-environment proc))))
        (else
          (error "Unknown procedure type -- APPLY" proc))))

(define (list-of-arg-values exps env)
  (if (no-operands? exps)
    '()
    (cons (actual-value (first-operand exps) env)
          (list-of-arg-values (rest-operands exps)
                              env))))

(define (list-of-delayed-args exps env)
  (if (no-operands? exps)
    '()
    (cons (delay-it (first-operand exps) env)
          (list-of-delayed-args (rest-operands exps)
                                env))))

(define (make-procedure params body env)
  (list 'procedure params body env))

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))

(define (compound-procedure? proc)
  (tagged-list? proc 'procedure))

(define (procedure-parameters proc) (cadr proc))

(define (procedure-body proc) (caddr proc))

(define (procedure-environment proc) (cadddr proc))
