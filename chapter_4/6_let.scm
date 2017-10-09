(define (sugar)
  (let ((x (+ 1 1))
        (y (+ 3 3)))
    (newline)
    (display x)
    (newline)
    (display y)))

(define (underlying)
  ((lambda (x y) (newline) (display x) (newline) (display y))
   (+ 1 1) (+ 3 3)))

;;

(define (make-lambda params body)
  (cons 'lambda (cons params body)))

;; (let ((x (+ 1 1)) (y (+ 3 3))) (display (+ x y)))
(define (let->lambda exp) 
   (cons (make-lambda (map car (cadr exp)) (cddr exp)) 
         (map cadr (cadr exp)))) 

(let->lambda '(let ((x (+ 1 1)) (y (+ 3 3))) (display (+ x y))))
;; ((lambda (x y) (display (+ x y))) (+ 1 1) (+ 3 3))
