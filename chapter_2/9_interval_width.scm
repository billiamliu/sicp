(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (width-of i) (/(- (upper-bound i) (lower-bound i)) 2))

(define int-1 (make-interval 3 11.1))
(define int-2 (make-interval 7 33.3))

(define (add-interval-half x y)
  (let ((p1 (lower-bound x))
        (p2 (lower-bound y))
        (w1 (width-of x))
        (w2 (width-of y)))
  (make-interval (+ p1 p2)
                 (+ (+ p1 p2) (* 2 (+ w1 w2))))))


(add-interval int-1 int-2)
(add-interval-half int-1 int-2)

; TODO still need example to show it's not the case for mul and div
