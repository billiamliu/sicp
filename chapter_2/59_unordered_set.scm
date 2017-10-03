(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (intersection set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection (cdr set1) set2)))
        (else (intersection (cdr set1) set2))))

(define (union set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2) (union (cdr set1) set2))
        (else (union (cdr set1) (cons (car set1) set2)))))

(define my-set (list 1 2 3 4))
(define my-set-odd (list 1 3 5 7 9))
(define my-set-even (list 2 4 6 8))

(element-of-set? 3 my-set)
(adjoin-set 10 my-set)
(intersection my-set my-set-odd)
(union my-set my-set-odd)
