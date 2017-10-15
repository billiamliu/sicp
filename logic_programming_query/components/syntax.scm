(define (type exp)
  (if (pair? exp)
    (car exp)
    (error "Unknown expression -- TYPE" exp)))

(define (contents exp)
  (if (pair? exp)
    (cdr exp)
    (error "Unknown expression -- CONTENTS" exp)))

(define (assertion-to-be-added? exp)
  (eq? (type exp) 'assert!))

(define (add-assertion-body exp)
  (car (contents exp)))
