(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items '()))

(define (my-square-list items)
  (define (iter things)
    (if (null? things)
      '()
      (cons (square (car things)) (iter (cdr things)))))
  (iter items))

(square-list (list 1 2 3 4 5))
(my-square-list (list 1 2 3 4 5))
