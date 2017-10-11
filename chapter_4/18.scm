(define (test a b)
  (define x (+ a a))
  (define y (+ x b))
  (* x y))

(define (test-2 a b)
  (let ((x '*unassigned*)
        (y '*unassigned))
    (set! x (+ a a))
    (set! y (+ x b))
    (* x y)))

(define (test-2-lambda a b)
  ((lambda (x y)
     (set! x (+ a a))
     (set! y (+ x b))
     (* x y))
   '*unassigned*
   '*unassigned*
   ))

(define (test-3 a b)
  (let ((x '*unassigned*)
        (y '*unassigned*))
    (let ((x-e (+ a a))
          (y-e (+ x b)))
      (set! x x-e)
      (set! y y-e)
      (* x y))))

(define (test-3-lambda a b)
  ((lambda (x y)
     ((lambda (x-e y-e)
        (set! x x-e) ;; evaluation of x-e is still unassigned
        (set! y y-e))
      (+ a a)
      (+ x b))
     (* x y))
   '*unassigned*
   '*unassigned*))


(test 3 7)
(test-2 3 7)
(test-2-lambda 3 7)
(test-3 3 7)
(test-3-lambda 3 7)
