(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low 
          (enumerate-interval 
            (+ low 1) 
            high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (nested n)
  (accumulate append '()
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(define (prime? n)
  (define (is-not-divisible-by-smaller i m)
    (cond ((= i 1) #t)
      (else (cond ((= (remainder m i) 0) #f)
              (else (is-not-divisible-by-smaller (- i 1) m))))))
  (is-not-divisible-by-smaller (- n 1) n))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                 (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))))

(prime-sum-pairs 6)
