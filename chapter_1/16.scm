(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (expt-recur b n)
  (cond ((= n 0) 1)
        ((even? n) (square (expt-recur b (/ n 2))))
        (else (* b (expt-recur b (- n 1))))))

(expt-recur 2 4)

(define (expt-iter-run b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter-run (square b) (/ n 2) a))
        (else (expt-iter-run b (- n 1) (* a b)))))

(define (expt-iter b n)
  (expt-iter-run b n 1))

(expt-iter 2 4)
