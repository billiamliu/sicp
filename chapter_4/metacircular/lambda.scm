(define (lambda? exp)
  (tagged-list? exp 'lambda))

(define (lambda-parameters exp) (cadr exp))

(define (lambda-body exp) (cddr exp))

(define (make-lambda params body)
  (cons 'lambda (cons params body)))


