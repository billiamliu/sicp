(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube n)
  (* n n n))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y ii) (f (+ a (* ii h))))
  (define (inc jj) (+ jj 1))
  (define (term kk)
    (* (cond ((or (= kk 0) (= kk n)) 1)
             ((odd? kk) 4)
             ((even? kk) 2))
       (y kk)))
  (*
    (/ h 3.0)
    (sum term 0 inc n)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
