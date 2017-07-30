(define (make-rat-2 n d)
  (if (or (and (< n 0) (< d 0)) (and (> n 0) (> d 0)))
    (cons (abs n) (abs d))
    (cons (abs n) (- (abs d)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(make-rat 3 7)
(make-rat -3 7)
(make-rat 3 -7)
(make-rat -3 -7)
