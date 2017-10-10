(define (let? exp)
  (tagged-list? exp 'let))

(define (let->combination exp)
  (cons (make-lambda (map car (cadr exp)) (cddr exp))
        (map cadr (cadr exp))))

(define (make-lambda params body)
  (cons 'lambda (cons params body)))

;; (let ((x (+ 1 1)) (y (+ 3 3))) (display (+ x y)))
(define (let->lambda exp) 
   (cons (make-lambda (map car (cadr exp)) (cddr exp)) 
         (map cadr (cadr exp)))) 

(define (make-let assigns body)
  (append (list 'let assigns) body))

(define (let*->nested-lets exp) 
  (define (iter assigns body)
    (if (null? assigns)
      body
      (list (make-let (list (car assigns))
                (iter (cdr assigns) body)))))
  (car (iter (cadr exp) (cddr exp))))
