(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

(define one (cons 1 1))

(define three (cons 1 (cons 2 (cons 3 '()))))

(define four (cons 1 (cons one one)))

(define pre-seven (cons one one))
(define seven (cons pre-seven pre-seven))

(define infinite (cons 1 (cons 2 (cons 3 '()))))
(set-cdr! (cddr infinite) infinite)

(count-pairs three)
(count-pairs four)
(count-pairs seven)
(count-pairs infinite)
