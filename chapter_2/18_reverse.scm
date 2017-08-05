(define (append list1 list2)
   (if (null? list1)
       list2
       (cons (car list1) (append (cdr list1) list2))))

(define (reverse li)
  (if (null? li)
    li
    (append (reverse (cdr li))
          (list (car li)))))

(reverse (list 1 2 3 4 5))
