(define (begin? exp) (tagged-list? 'begin))

(define (begin-actions exp) (cdr exp))

(define (make-begin seq) (cons 'begin seq))

