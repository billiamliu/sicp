(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))

;; sequential eval it would be 16 (a was 1, then 5)
;; simultaneous eval it would be 20 (a was 5)

;; but simultaneous eval esp. with name clash is 
;; generally difficult to implement, thus
;; interpreter throws an error rather than giving
;; a false result
