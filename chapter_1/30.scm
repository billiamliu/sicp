(define (sum-recur term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
    (iter a 0))

(define (cube n) (* n n n))

(define (inc x) (+ x 1))

(sum-recur cube 0 inc 3)
