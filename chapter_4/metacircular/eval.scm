(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((let? exp) (eval (let->combination exp) env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp)
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (actual-value (operator exp) env)
                (operands exp)
                env))
        (else
          (error "Unknown expression type -- ANALYZE" exp))))

(define (actual-value exp env)
  (force-it (eval exp env)))

(define (analyze-self-evaluating exp) (lambda (env) exp))

(define (self-evaluating? exp)
  (cond ((number? exp) #t)
        ((string? exp) #t)
        (else #f)))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

;; returns the list of operand values of an expression
(define (list-of-values exps env) ;; example (<operand>addend <operand>augend)
  (if (no-operands? exps)
    '()
    (cons (eval (first-operand exps) env) ;; eval (and apply) to extract the value of the first operand
          (list-of-values (rest-operands exps) env)))) ;; recurse
