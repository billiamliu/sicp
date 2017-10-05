(define (make-wallet balance)
  (lambda (amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient Funds")))

(define w1 (make-wallet 100))

(symbol? (w1 50))
(number? (w1 10))
(w1 10)
