(define (definition? exp)
  (tagged-list? exp 'define))

(define (eval-definition exp env)
  (define-variable!
    (definition-variable exp)
    (eval (definition-value exp) env)
    env)
  'ok)

(define (definition-variable exp) 
  (if (symbol? (cadr exp))
    (cadr exp)
    (caadr exp)))

;; eg. (define foo 123)
;; eg. (define (bar baz) (+ baz 1)) -> (define bar (lambda (baz) (+ baz 1)))
(define (definition-value exp)
  (if (symbol? (cadr exp))
    (caddr exp)
    (make-lambda
      (cdadr exp) ;; formal parameters
      (cddr exp)))) ;; body

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             (add-binding-to-frame! var val frame))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))

;; example body
;; ((define x 5) (define y 87) (+ x y))
(define (partition-defines body)
  (define (iter defs bdy remain)
    (if (null? remain)
      (cons defs bdy)
      (if (definition? (car remain))
        (iter (cons (car remain) defs) bdy (cdr remain))
        (iter defs (cons (car remain) bdy) (cdr remain)))))
  (iter '() '() body))

(define (scan-out-defines body)
  (let* ((partitioned (partition-defines body))
         (let-vars (map definition-variable (car partitioned)))
         (let-vals (map definition-value (car partitioned)))
         (let-bindings
           (map (lambda (x) (list x ''*unassigned*)) let-vars))
         (assignments
           (map (lambda (x y) (list 'set! x y)) let-vars let-vals)))
    (if (null? let-bindings)
      body
      (list (make-let let-bindings (append assignments (cdr partitioned)))))))
