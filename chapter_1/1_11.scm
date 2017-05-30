
(define (recursive n)
  (if (< n 3)
    n
    (+ (recursive (- n 1)) (* 2(recursive (- n 2))) (* 2 (recursive (- n 3))))))

(recursive 5)

(define (iterative n)
  (define (iter result counter)
    (if (< counter 3)
      result
      ())) ;; TODO



