(define (double n)
   (+ n n))

(define (half n)
   (/ n 2))

(define (even? n)
   (= (remainder n 2) 0))

(define (mult-iter-run a b x)
  (cond ((= b 0) 0)
        ((= b 1) (+ a x))
        ((even? b) (mult-iter-run (double a) (half b) x))
        (else (mult-iter-run a (- b 1) (+ a x)))))

(define (mult-iter a b)
  (mult-iter-run a b 0))

(mult-iter 3 5)
(mult-iter 4 6)
