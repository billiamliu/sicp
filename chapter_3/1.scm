(define (make-accumulator initial)
  (lambda (amount)
    (set! initial (+ initial amount))
    initial))

(define A (make-accumulator 1))
(A 11)
(A 111)
