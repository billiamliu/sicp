(define (negate operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (if (stream-null? (qeval (negated-query operands)
                               (singleton-stream frame)))
        (singleton-stream frame)
        the-empty-stream))
    frame-stream))

(put 'not 'qeval negate)

(define (lisp-value call frame-stream)
  (stream-flatmap
    (lambda (frame)
      (if (execute
            (instantiate
              call
              frame
              (lambda (v f)
                (error "Unknown pat var -- LISP-VALUE" v))))
        (singleton-stream frame)
        the-empty-stream))
    frame-stream))

(put 'lisp-value 'eqval lisp-value)

(define (always-true ignore frame-stream) frame-stream)

(put 'always-true 'qeval always-true)
