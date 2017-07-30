(define (cons x y)
  (lambda (m) (m x y)))

(define (car x)
  (x (lambda (p q) p)))

(define (cdr x)
  (x (lambda (p q) q)))

(define pair (cons 3 7))
(car pair)
(cdr pair)
