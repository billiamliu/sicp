(define (assignment? exp)
  (tagged-list? exp 'set!))

(define (assignment-variable exp)
  (cadr exp))

(define (assignment-value exp) (caddr exp))

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)

(define (analyze-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (let ((old-value ; preserv old value
                       (lookup-variable-value var env)))
                 ; assign value
                 (set-variable-value! var val env)
                 (succeed 'ok
                          ; backtrack to un-assign var
                          (lambda ()
                            (set-variable-value! var
                                                 old-value
                                                 env)
                            (fail2)))))
             fail))))
