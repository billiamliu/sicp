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

;---------

(define (perimeter rec)
  (* 2 (+ (leng rec) (widt rec))))

(define (area rec)
  (* (leng rec) (widt rec)))

(define (leng rec)
  (rec (lambda (l w) l)))

(define (widt rec)
  (rec (lambda (l w) w)))

(define (rec-1 l w)
  (lambda (f) (f l w)))

(perimeter (rec-1 3 7))
(area (rec-1 3 7))

(define (rec-2 a b)
  (let ((w (abs (- (x-point a) (x-point b))))
        (l (abs (- (y-point a) (y-point b)))))
    (lambda (f) (f w l))))

(define a (make-point 0 0))
(define b (make-point 4 8))
(define a-rec (rec-2 a b))

(perimeter a-rec)
(area a-rec)
