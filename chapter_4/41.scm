(load "util.scm")

(define (invalid p)
  (let ((baker (first p))
        (cooper (second p))
        (fletcher (third p))
        (miller (fourth p))
        (smith (fifth p)))
    (and (not (= baker 5))
         (not (= cooper 1))
         (not (= fletcher 5))
         (not (= fletcher 1))
         (> miller cooper)
         (not (= (abs (- smith fletcher)) 1))
         (not (= (abs (- fletcher cooper)) 1)))))

(map list
     '(baker cooper fletcher miller smith)
     (car (filter invalid (permutations '(1 2 3 4 5)))))
