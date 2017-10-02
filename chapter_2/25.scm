((lambda (x) (car (cdr (car (cdr (cdr x)))))) (list 1 3 (list 5 7) 9))
((lambda (x) (car (car x))) (list (list 7)))
((lambda (x) (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x)))))))))))))
  (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
