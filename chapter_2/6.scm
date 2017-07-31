(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define inc (lambda (x) (+ x 1)))

(define add (lambda (m n)
              (lambda (f) (lambda (x) ((m f) ((n f) x))))))

(define mul (lambda (m n)
              (lambda (f) (lambda (x) ((m (n f)) x)))))

(define pow (lambda (m n)
              (lambda (f) (lambda (x) (((n m) f) x)))))

((one inc) 0) ; => 1
(((add one two) inc) 0) ; => 3
(((mul two two) inc) 0) ; => 4

(define three (add one two))
(((pow two three) inc) 0) ; => 8
