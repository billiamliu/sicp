(define (make-point x y)
  (lambda (f) (f x y)))

(define (x-point p)
  (p (lambda (x y) x)))

(define (y-point p)
  (p (lambda (x y) y)))

(define (make-segment a b)
  (lambda (f) (f a b)))

(define (start-segment s)
  (s (lambda (a b) a)))

(define (end-segment s)
  (s (lambda (a b) b)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(print-point (make-point 11 33))

(define (average a b)
  (/ (+ a b) 2))

(define (mid-segment s)
  (let ((s-x (x-point (start-segment s)))
        (s-y (y-point (start-segment s)))
        (e-x (x-point (end-segment s)))
        (e-y (y-point (end-segment s))))
    (make-point
      (average s-x e-x) (average s-y e-y))))

(define seg
  (make-segment
    (make-point 0 0)
    (make-point 10 10)))

(print-point (mid-segment seg))
