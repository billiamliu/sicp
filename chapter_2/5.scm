(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (exponent-of n b)
  (define (iter remain result)
    (if (= 0 (remainder remain b))
      (iter (/ remain b) (+ result 1))
      result))
  (iter n 0))

(define (car n)
  (exponent-of n 2))

(define (cdr n)
  (exponent-of n 3))

(define test (cons 7 13))
(car test)
(cdr test)
