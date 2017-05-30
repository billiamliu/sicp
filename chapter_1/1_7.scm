(define (sqrt-iter guess x)
  (if (small-enough? guess (improve guess x))
    (improve guess x)
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  ;; original book implementation
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (small-enough? x y)
  (< (abs (- x y)) 0.001))

(sqrt 9)
(sqrt 1000000)
(sqrt 0.000001)
