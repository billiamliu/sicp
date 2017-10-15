(define (make-binding var val)
  (cons var val))

(define (binding-variable binding)
  (car binding))

(define (binding-value binding)
  (cdr binding))

(define (binding-in-frame var frame)
  (assoc var frame))

(define (extend var val frame)
  (cons (make-binding var val) frame))
