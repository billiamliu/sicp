(define (minus-interval x y)
  (make-interval (- (max (lower-bound x)
                         (lower-bound y))
                    (min (lower-bound x)
                         (lower-bound y)))
                 (- (max (upper-bound x)
                         (upper-bound y))
                    (max (upper-bound x)
                         (upper-bound y)))))

