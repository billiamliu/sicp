(define (one-three x y z) 

  (define (square n) (* n n))

  (define (sum-of-squares aa bb) (+ (square aa) (square bb)))

  (define one (sum-of-squares x y))
  (define two (sum-of-squares y z))
  (define three (sum-of-squares x z))

  (cond ((and (> one two) (> one three)) one)
        ((and (> two one) (> two three)) two)
        ((and (> three one) (> three two)) three)
        )
  )
