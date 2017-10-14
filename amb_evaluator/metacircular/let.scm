(define (let? exp)
  (tagged-list? exp 'let))

(define (let-vars exp) (map car (cadr exp)))
(define (let-inits exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))
(define (let->combination expr)
   (cons (make-lambda (let-vars expr) (let-body expr))
         (let-inits expr)))

(define (make-lambda params body)
  (cons 'lambda (cons params body)))

(define (make-let assigns body)
  (append (list 'let assigns) body))

(define (let*->nested-lets exp) 
  (define (iter assigns body)
    (if (null? assigns)
      body
      (list (make-let (list (car assigns))
                      (iter (cdr assigns) body)))))
  (car (iter (cadr exp) (cddr exp))))

(define (analyze-let exp)
  (analyze (let->combination exp)))
