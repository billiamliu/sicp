(define (foldr proc init seq)
  (if (null? seq)
    init
    (proc (car seq)
          (foldr proc init (cdr seq)))))

(define (flatmap proc seq)
  (foldr append '() (map proc seq)))

(define (permutations s)
  (if (null? s)
    '(())
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (permutations (remove-item x s))))
             s)))

(define (remove-item item seq)
  (filter (lambda (x) (not (= x item))) seq))

(define (xor a b)
  (or
    (and a (not b))
    (and b (not a))))

(define (perf-test . args)
  ; make variadic
  (define iter '())
  (define thunk '())
  (if (null? (cdr args))
    (begin
      (set! iter 100)
      (set! thunk (car args)))
    (begin
      (set! iter (car args))
      (set! thunk (cadr args))))
  (define runs iter)

  (with-timings
    (lambda ()
      (define (run)
        (if (= 0 iter)
          (thunk) ; return result
          (begin
            (set! iter (- iter 1))
            (thunk)
            (run))))
      (run))
    (lambda (run-time gc-time real-time)
      (newline)
      (display ";Iterations: ") (display runs)
      (newline)
      (display ";Run Time:   ") (display run-time)
      (newline)
      (display ";GC Time:    ") (display gc-time)
      (newline)
      (display ";Thunk return:")
      )))
