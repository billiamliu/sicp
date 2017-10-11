((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
        1
        (* k (ft ft (- k 1)))))))
 10)

(define (f x)
  (define (even? n)
    (if (= n 0)
      #t
      (odd? (- n 1))))
  (define (odd? n)
    (if (= n 0)
      #f
      (even? (- n 1))))
  (even? x))

(define (g x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) #t (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) #f (ev? ev? od? (- n 1))))))
(f 6)
(g 6)
