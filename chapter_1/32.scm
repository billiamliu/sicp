(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (acc-recur combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))


(accumulate + 0 (lambda (x) (* x x)) 0 (lambda (x) (+ x 1)) 5)
(acc-recur + 0 (lambda (x) (* x x)) 0 (lambda (x) (+ x 1)) 5)
