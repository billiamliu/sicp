(define (append list1 list2)
   (if (null? list1)
       list2
       (cons (car list1) (append (cdr list1) list2))))

(define (reverse li)
  (if (null? li)
    li
    (append (reverse (cdr li))
          (list (car li)))))

(define (deep-reverse li)
  (cond ((null? li) li)
        ((list? (car li))
         (append (deep-reverse (cdr li))
                 (list (deep-reverse (car li)))))
        (else (append (deep-reverse (cdr li))
                      (list (car li))))))

(reverse (list 1 2 3 4 5))

(define x (list (list 1 2) (list 3 4)))

(reverse x)
(deep-reverse x)
