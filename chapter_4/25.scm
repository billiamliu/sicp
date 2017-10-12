(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial-loop n)
  (unless (= n 1)
    (* n (factorial (- n 1))) ;; this line does work
    ;; because in applicative-order it's going to attempt
    ;; to eval (factorial (- 0 1))
    ;; and then throw it in a loop
    1))

;; in normal-order when (= n 0), only the exceptional-value
;; is evaluated

(define (factorial n)
  (if (= n 0)
    1
    (* n (factorial (- n 1)))))

(define (p) (p))
(if #t 1 (p)) ;; this works because the primitive if has
;; a special short circuit to not eval the alternate


(define (if-loop predicate consequence alternate)
  (if predicate consequence alternate))

;; this one throws a loop because the procedure
;; is strict in its arguments and evals them
;; before entering the procedure body
;; (if-loop #t 1 (p))
