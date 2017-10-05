;; regular list
(define spec (list 1 2 3 4 5))

;; infinite loop starting from 0 (value 1)
(define loop-0 (list 1 2 3 4 5))
(set-cdr! (cddddr loop-0) loop-0)

;; infinite loop starting from 1 (value 2)
(define loop-1 (list 1 2 3 4 5))
(set-cdr! (cddddr loop-1) (cdr loop-1))

;; helper
(define (safe-cdr l)
  (if (pair? l)
    (cdr l)
    '()))

(define (has-cycle-in-first? ll)
  (define (iter p1 p2)
    (cond ((or (null? p1) (null? p2)) #f)
          ((eq? p1 (safe-cdr p2)) #t)
          (else (iter p1 (safe-cdr p2)))))
  (iter ll ll))

(has-cycle-in-first? spec)
(has-cycle-in-first? loop-0)

(define (has-cycle? ll)
  (define (iter p1 p2)
    (cond ((or (null? p1) (null? p2)) #f)
          ((eq? p1 (safe-cdr p2)) #t)
          (else (iter (safe-cdr p1) (safe-cdr (safe-cdr p2))))))
  (iter (safe-cdr ll) (safe-cdr (safe-cdr ll))))

(has-cycle? spec)
(has-cycle? loop-0)
(has-cycle? loop-1)
