(define (count-pairs x)
  (let ((visited '()))
    (define (iter x)
      (if (or (not (pair? x)) (memq x visited))
        0
        (begin
          (set! visited (cons x visited))
          (+ (iter (car x))
             (iter (cdr x))
             1))))
    (iter x)))

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
