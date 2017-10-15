; and clauses
; stream is evaled using one conjuct and then
; resulting stream is fed through the next conjunct
(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
    frame-stream
    (conjoin (rest-conjuncts conjuncts)
             (qeval (first-conjunct conjuncts)
                    frame-stream))))

(put 'and 'qeval conjoin)

; or clauses
; stream is split for each disjunct and
; then combined
(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
    the-empty-stream
    (interleave-delayed
      (qeval (first-disjnuct disjuncts) frame-stream)
      (delay (disjoin (rest-disjuncts disjuncts)
                      frame-stream)))))

(put 'or 'eqval disjoin)
