;; sync map
(define (map proc items)
  (if (null? items)
    '()
    (cons (proc (car items))
          (maps proc (cdr items)))))

;; simple stream map
(define (steam-simple-map proc s)
  (if (stream-null? s)
    '()
    (cons-stream
      (proc (stream-car s))
      (stream-map proc (stream-cdr s)))))

;; general stream map
(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
    '()
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map
             (cons proc (map stream-cdr argstreams))))))
