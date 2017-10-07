(define (memoized-delay proc)
  (let ((ran? #f)
        (result #f))
    (lambda ()
      (if ran?
        result
        (begin (set! result (proc))
               (set! ran? #t)
               result)))))

(define (force promise) (promise))

(define (cons-stream a b) (cons a (delay b)))

(define (stream-enumerate-interval low high)
  (if (> low high)
    '()
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(define (display-line x) (newline) (display x))

(define (display-stream s)
  (stream-for-each display-line s))
