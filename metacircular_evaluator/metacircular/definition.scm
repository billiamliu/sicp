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
    (cadr exp)
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

