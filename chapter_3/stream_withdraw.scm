(define (make-simple-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))

(define x (make-simple-withdraw 1111))
(x 11)
(x 111)

(define (stream-withdraw balance withdraw-stream)
  (cons-stream
    balance
    (stream-withdraw (- balance (stream-car withdraw-stream))
                     (stream-cdr withdraw-stream))))

(stream-ref (stream-withdraw 1111 (cons-stream 11 (cons-stream 111 '()))) 2)
