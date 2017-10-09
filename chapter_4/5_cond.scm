(define (cond-extended? clause)
  (eq? (cadr clause) '=>))

(define (cond-actions clause)
  (if (cond-extended? clause)
    (list (caddr clause) (car clause))
    (cdr clause)))

;; test
(cond-actions '((assoc 'b ((a 0) (b 1))) => display))
;Value 13: (display
;            (assoc (quote b) ((a 0) (b 1)))
;          )
