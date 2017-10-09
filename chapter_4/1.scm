(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

;; example (<operand>addend <operand>augend)
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    ;; eval (and apply) to extract the value of the first operand
    (cons (eval (first-operand exps) env)
          (list-of-values (rest-operands exps) env)))) ;; recurse

;; left to right eval
(define (list-of-vals exps env)
  (if (no-operands? exps)
    '()
    (let ((first-val (eval (first-operand exps) env)))
      (cons first-val (list-of-vals (rest-operands exps) env)))))

;; right to left eval
(define (list-of-v exps env)
  (if (no-operands? exps)
    '()
    (let ((rest-val (list-of-v (cdr exps) env)))
      (cons (eval (first-operand exps) env)
            rest-val))))

;; NOTE untested until env is implemented
