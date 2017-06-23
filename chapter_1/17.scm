(define (mult a b)
  (if (= b 0)
    0
    (+ a (mult a (- b 1)))))

(mult 3 5)

(define (double n)
  (+ n n))

(define (half n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (mult-iter a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (mult-iter a (half b))))
        (else (+ a (mult-iter a (- b 1))))))

(mult-iter 3 5)
