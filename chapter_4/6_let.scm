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

;; (let (<assignments>) <body>)
(define (let->lambda exp)
  (let ((parameters (map car (cadr exp)))
        (body (caddr exp)))
    ((lambda (parameters) body) (map cadr (cadr exp)))))

(let->lambda '(let ((x (+ 1 1)) (y (+ 3 3))) (display (+ x y))))
