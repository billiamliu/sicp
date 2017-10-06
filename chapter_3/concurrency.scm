(load "parallel.scm")

(define (make-cell) (cons #f '()))

(define (clear! cell)
  (set-car! cell #f))

(define (test-and-set! cell)
  (without-interrupts ;; pp 313 note 46 disable processor time-slicing
    (lambda ()
      (if (car cell)
        #t ;; if mutex is already acquired, return busy
        (begin (set-car! cell #t) ;; set mutex to be busy,
               #f))))) ;; and return it wasn't busy (i.e. ok to use)

(define (make-mutex)
  (let ((cell (make-cell)))
    (define (the-mutex msg)
      (cond ((eq? msg 'acquire)
             (if (test-and-set! cell) ;; if cell indicates busy
               (the-mutex 'acquire)
               'ok)) ;; try again, stuck in a loop until no longer busy
            ((eq? msg 'release) (clear! cell) 'ok)))
    the-mutex))

(define (make-serializer)
  (let ((mutex (make-mutex)))
    (lambda (proc)
      (define (serialized-proc . args)
        (mutex 'acquire) ;; this retries until cell is acquired
        (let ((val (apply proc args))) ;; application of function that should be atomic
          (mutex 'release)
          val))
      serialized-proc)))

(define x 111)
(define s (make-serializer))
(parallel-execute (s (lambda () (set! x (+ x 11))))
                  (s (lambda () (set! x 11)))
                  (s (lambda () (newline) (display x))))
