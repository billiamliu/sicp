(load "util.scm")
(load "amb.scm")

;; using permutations 

(define (betty-s kitty betty)
  (xor (= kitty 2) (= betty 3)))
(define (ethel-s ethel joan)
  (xor (= ethel 1) (= joan 2)))
(define (joan-s joan ethel)
  (xor (= joan 3) (= ethel 5)))
(define (kitty-s kitty mary)
  (xor (= kitty 2) (= mary 4)))
(define (mary-s mary betty)
  (xor (= mary 4) (= betty 1)))

(define (invalid p)
  (let ((betty (first p))
        (ethel (second p))
        (joan (third p))
        (kitty (fourth p))
        (mary (fifth p)))
    (and (betty-s kitty betty)
         (ethel-s ethel joan)
         (joan-s joan ethel)
         (kitty-s kitty mary)
         (mary-s mary betty))))

;; using amb

(define (distinct? items)
  (cond ((null? items) #t)
        ((null? (cdr items)) #t)
        ((member (car items) (cdr items)) #f)
        (else (distinct? (cdr items)))))

(define (liars)
  (let ((betty (amb 1 2 3 4 5))
        (ethel (amb 1 2 3 4 5))
        (joan (amb 1 2 3 4 5))
        (kitty (amb 1 2 3 4 5))
        (mary (amb 1 2 3 4 5)))
    (require (distinct? (list betty ethel joan kitty mary)))
    (require (betty-s kitty betty))
    (require (ethel-s ethel joan))
    (require (joan-s joan ethel))
    (require (kitty-s kitty mary))
    (require (mary-s mary betty))
    (list (list 'betty betty)
          (list 'ethel ethel)
          (list 'joan joan)
          (list 'kitty kitty)
          (list 'mary mary))))

(perf-test 10 (lambda ()
             (map list
                  '(betty ethel joan kitty mary)
                  (car (filter invalid (permutations '(1 2 3 4 5)))))))
(perf-test 10 (lambda () (liars)))