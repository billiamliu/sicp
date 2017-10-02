(define (fringe tree)
  (cond ((null? tree) tree)
        ((pair? (car tree))
         (append (fringe (car tree)) (fringe (cdr tree))))
        (else tree)))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
(fringe (list x x))
