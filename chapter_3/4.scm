(define (make-account password balance)
  (define (call-cops)
    (newline)
    (display "I'M A COP YOU IDIOT"))
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient Funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((failed-attempts 0))
    (lambda (pass m)
      (if (eq? pass password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request" m)))
        (begin
          (set! failed-attempts (+ failed-attempts 1))
          (if (>= failed-attempts 3) (call-cops) '())
          (lambda args "Incorrect Password"))))))

(define acc (make-account 'hello 111))
((acc 'hello 'withdraw) 11)
((acc 'wat 'withdraw) 11)
((acc 'wat 'withdraw) 11)
((acc 'wat 'withdraw) 11)
((acc 'wat 'withdraw) 11)
