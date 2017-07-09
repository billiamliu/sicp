(define tolerance 0.0001)
(define (close-enough? x y)
  (< (abs (- x y)) tolerance))

(define (fixed-point f initial-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try initial-guess))

(fixed-point cos 1.0)

(fixed-point (lambda (y) (+ (/ 1 y) 1)) 1.0)
