(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda () set-signal! output new-value))))
  (add-action! input invert-input)
  'ok)

(define (and-gate a1 a2 output)
  (define (and-action)
    (let ((new-value (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-get-delay
                   (lambda () set-signal output new-value))))
  (add-action! a1 and-action)
  (add-action! a2 and-action)
  'ok)

(define (or-gate a1 a2 output)
  (define (or-action)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-get-delay
                   (lambda () set-signal output new-value))))
  (add-action! a1 or-action)
  (add-action! a2 or-action)
  'ok)

(define (or-gate-2 a1 a2 output)
  (let ((w1 (make-wire))
        (w2 (make-wire))
        (w3 (make-wire)))
    (inverter a1 w1)
    (inverter a1 w2)
    (and-gate w1 w2 w3)
    (inverter w3 output)))
