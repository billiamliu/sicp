(define (p) (p))

(define (test)
  (cond ((= 1 1) #t)
        ((p) #f)))

(test)

(define (test-2 foo bar)
  (list (p) foo bar))

