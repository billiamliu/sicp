(define (tagged-list? exp tag)
  (if (pair? exp)
    (eq? (car exp) tag)
    #f))

(define input
  (let* ((x 3)
         (y (+ x 2))
         (z (+ x y 5)))
    (display 1)
    (* x z)))

(define output
  (let ((x 3))
    (let ((y (+ x 2)))
      (let ((z (+ x y 5)))
        (display 1) (* x z)))))

(define (make-let assigns body)
  (append (list 'let assigns) body))

(define (let*->nested-lets exp) 
  (define (iter assigns body)
    (if (null? assigns)
      body
      (list (make-let (list (car assigns))
                (iter (cdr assigns) body)))))
  (car (iter (cadr exp) (cddr exp))))

(let*->nested-lets '(let* ((x 3) (y (+ x 5))) (* x y) (display 1) #t))
