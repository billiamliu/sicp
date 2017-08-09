(define (sq-list-1 items)
  (if (null? items)
    ()
    (cons
      (* (car items) (car items))
      (sq-list-1 (cdr items)))))

(define (sq-list-2 items)
  (map (lambda (x) (* x x)) items))

(sq-list-1 (list 1 2 3 4 5))
(sq-list-2 (list 1 2 3 4 5))
