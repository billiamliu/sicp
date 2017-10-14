(define (cond? exp) (tagged-list? exp 'cond))
(define (if? exp) (tagged-list? exp 'if))
(define (cond-extended? clause)
  (eq? (cadr clause) '=>))

(define (eval-if exp env)
  (if (true? (eval (if-predicate exp) env))
    (eval (if-consequent exp) env)
    (eval (if-alternative exp) env)))

(define (if-predicate exp) (cadr exp))

(define (if-consequent exp) (caddr exp)) ;; (if (true) <consequent> <alternate>)

(define (if-alternative exp)
  (if (not (null? (cdddr exp)))
    (cadddr exp)
    #f))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))
(define (expand-clauses clauses)
  (if (null? clauses)
    #f ;; no else clause
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (error "ELSE clause isn't last: COND->IF" clauses))
        (make-if (cond-predicate first)
                 (sequence->exp (cond-actions first))
                 (expand-clauses rest))))))

(define (cond-actions clause)
  (if (cond-extended? clause)
    (list (caddr clause) (car clause))
    (cdr clause)))

(define (analyze-if exp)
  (let ((pproc (analyze (if-predicate exp)))
        (cproc (analyze (if-consequent exp)))
        (aproc (analyze (if-alternative exp))))
    (lambda (env succeed fail)
      (pproc env
             ; success predicate
             (lambda (pred-value fail2)
               (if (true? pred-value)
                 (cproc env succeed fail2)
                 (aproc env succeed fail2)))
             ; failing predicate
             fail))))
