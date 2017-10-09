(define (definition? exp)
  (tagged-list? exp 'define))

(define (eval-definition exp env)
  (define-variable!
    (definition-variable exp)
    (eval (definition-value exp) env)
    env)
  'ok)

;; eg. (define foo 123)
;; eg. (define (bar baz) (+ baz 1)) -> (define bar (lambda (baz) (+ baz 1)))
(define (definition-variable exp)
  (if (symbol? (cadr exp))
    (caddr exp)
    (make-lambda
      (cdadr exp) ;; formal parameters
      (cddr exp)))) ;; body

