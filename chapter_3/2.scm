(define (monitor proc)
  (let ((count 0))
    (lambda args
      (cond ((eq? (car args) 'how-many-calls?) count)
            ((eq? (car args) 'reset-counter) (set! count 0))
            (else (begin
                    (set! count (+ count 1))
                    (apply proc args)))))))

(define (square n) (* n n))

(define mf (monitor square))

(mf 3)
(mf 7)
(mf 'how-many-calls?)
(mf 'reset-counter)
(mf 11)
(mf 'how-many-calls?)
