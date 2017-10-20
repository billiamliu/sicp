(load "machine.scm")

(define (try a b)
  (define gcd-machine
    (make-machine
      '(a b t)
      (list (list 'rem remainder) (list '= =))
      '(test-b
         (test (op =) (reg b) (const 0))
         (branch (label gcd-done))
         (assign t (op rem) (reg a) (reg b))
         (assign a (reg b))
         (assign b (reg t))
         (goto (label test-b))
         gcd-done)))
  (set-register-contents! gcd-machine 'a a)
  (set-register-contents! gcd-machine 'b b)
  (start gcd-machine)
  ((gcd-machine 'stack) 'print-statistics)
  (get-register-contents gcd-machine 'a))

(try 130 117)
