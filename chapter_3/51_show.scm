(define (stream-interval lo hi)
  (if (> lo hi)
    '()
    (cons-stream
      lo
      (stream-interval (+ lo 1) hi))))

(define (display-line thing) (newline) (display thing))
(define (show x) (display-line x) x)
(define x (stream-map show (stream-interval 0 10)))
(stream-ref x 5) ;; 0 1 2 3 4 5
(stream-ref x 7) ;; 6 7 (because delay memoizes)

