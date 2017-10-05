(define first-argument '())
(define (f n)
  (if (null? first-argument)
    (begin (set! first-argument n) n)
    0))

(+ (f 0) (f 1))
;; (+ (f 0) (f 1))
