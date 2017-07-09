(define tolerance 0.01)
(define (close-enough? x y)
  (< (abs (- x y)) tolerance))

(define (fixed-point f initial-guess)
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try initial-guess))

(fixed-point (lambda (y) (/ (log 1000) (log y))) 17)

; NOTE average damped
(fixed-point (lambda (y) (/ (+ y (/ (log 1000) (log y))) 2)) 17)
