(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (product-recur term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (inc x) (+ x 1))
(define (double x) (* x 2))

(product double 1 inc 2)
(product-recur double 1 inc 2)

(define (factorial n)
  (product (lambda (x) x) 1 inc n))

(factorial 5)

(define (square x) (* x x))

; TODO use _product_ to computer approximations to PI
