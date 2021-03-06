(define (make-account password balance)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient Funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (lambda (pass m)
    (if (eq? pass password)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request" m)))
      (lambda args "Incorrect Password"))))

(define acc (make-account 'hello 111))
((acc 'hello 'withdraw) 11)
((acc 'wat 'withdraw) 11)
