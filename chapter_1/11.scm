(define (recursive n)
  (if (< n 3)
    n
    (+ (recursive (- n 1)) (* 2 (recursive (- n 2))) (* 3 (recursive (- n 3))))))

(recursive 5)

(define (iterative count) 
   (define (iter a b c count) 
     (if (< count 3) 
         a 
         (iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))) 
   (if (< count 3) 
       count
       (iter 2 1 0 count))) 

(iterative 5)
