(define (same-parity . l)
  (if (even? (car l))
    (filter even? (cdr l))
    (filter odd? (cdr l))))

(same-parity 1 2 3 4 5)
(same-parity 2 2 3 4 5)
