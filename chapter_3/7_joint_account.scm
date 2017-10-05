(define (make-account password balance)
  ;; instance variable
  (define passwords (list password))

  (define (member-of? x set)
    (not (false? (member x set))))
  (define (adjoin x set)
    (if (member-of? x set)
      set
      (cons x set)))

  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient Funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (join new-pass)
    (if (not (member-of? new-pass passwords))
      (begin (set! passwords (adjoin new-pass passwords)) #t)
      "Password Already Exists"))

  (lambda (pass m)
    (if (member-of? pass passwords)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'join) join)
            (else (error "Unknown request" m)))
      (lambda args "Incorrect Password"))))

;; driver

(define acc (make-account 'hello 111))
((acc 'hello 'withdraw) 11)

(define (make-joint acct old-pass new-pass)
  ((acct old-pass 'join) new-pass)
  acct)

(define acc2 (make-joint acc 'hello 'world))
((acc2 'world 'withdraw) 1)
