(define (early-def x)
  (define (even? n)
    (if (= n 0)
      #t
      (odd? (- n 1))))
  (define (odd? n)
    (if (= n 0)
      #f
      (even? (- n 1))))
  (if (< x 0)
    (display "doesn't handle negative number")
    (begin
      (newline)
      (display "is even? ") (display (even? x))
      (newline)
      (display "is odd ") (display (odd? x)))))

(early-def 5)
(early-def -1)

(define (premature x)
  (h x)
  (define (h n)
    (+ n 1))
  (h (h x)))

(premature 5)
