(define (let? exp)
  (tagged-list? exp 'let))

(define (let->combination exp)
  (cons (make-lambda (map car (cadr exp)) (cddr exp))
        (map cadr (cadr exp))))

