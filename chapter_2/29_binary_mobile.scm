(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (left-branch branch))

(define (branch-structure branch)
  (right-branch branch))

(define (total-weight mobile)
  (define (weight-of branch)
    (let ((structure (branch-structure branch)))
          (if (number? structure)
            structure
            (weight-of structure))))
  (+ (weight-of (left-branch mobile)) (weight-of (right-branch mobile))))


(define mobi (make-mobile
               (make-branch 3 7)
               (make-branch 11 (make-branch 13 17))))

(total-weight mobi)
