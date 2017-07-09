(define (accumulate combiner filter null-value term a next b)
  (if (> a b)
    null-value
    (combiner (if (filter a)
                (term a)
                null-value)
              (accumulate combiner filter null-value term (next a) next b))))

(define (acc-recur combiner filter null term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (combiner
              result
              (if (filter a)
                (term a)
                null)))))
  (iter a null))

(accumulate + even? 0 (lambda (x) (* x x)) 0 (lambda (x) (+ x 1)) 7)
(acc-recur + even? 0 (lambda (x) (* x x)) 0 (lambda (x) (+ x 1)) 7)
