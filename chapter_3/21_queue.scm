(define (make-queue) (cons '() '()))
(define (front-pointer q) (car q))
(define (rear-pointer q) (cdr q))
(define (set-front-pointer! q item) (set-car! q item))
(define (set-rear-pointer! q item) (set-cdr! q item))
(define (empty-queue? q) (null? (front-pointer q)))

(define (front-queue q)
  (if (empty-queue? q)
    (error "FRONT called with an empty queue" q)
    (car (front-pointer q))))

(define (rear-queue q)
  (if (empty-queue? q)
    (error "REAR called with an empty queue" q)
    (car (rear-pointer) q)))

(define (last-of ll)
  (if (null? (cdr ll))
    ll
    (last-of (cdr ll))))

(define (insert-queue! q item)
  (if (pair? item)
    (cond ((empty-queue? q)
           (set-front-pointer! q item)
           (set-rear-pointer! q (last-of item))
           q)
          (else
            (set-cdr! (rear-pointer q) item)
            (set-rear-pointer! q (last-of item))
            q))
    (let ((new-pair (cons item '())))
      (cond ((empty-queue? q)
             (set-front-pointer! q new-pair)
             (set-rear-pointer! q new-pair)
             q)
            (else
              (set-cdr! (rear-pointer q) new-pair)
              (set-rear-pointer! q new-pair)
              q)))))

(define (delete-queue! q)
  (cond ((empty-queue? q) (error "DELETE called on an empty queue" q))
        (else
          set-front-pointer! q (cdr (front-pointer q))
          q)))

(define (display-queue q)
  (newline)
  (display "Front:")
  (display (car (car q)))
  (newline)
  (display "Rear:")
  (display (car (cdr q)))
  (newline)
  (display "Queue:")
  (display (car q)))

(define my-q (make-queue))
(insert-queue! my-q 'a)
(insert-queue! my-q 'b)
(display-queue my-q)
(insert-queue! my-q '(c d e))
(display-queue my-q)
