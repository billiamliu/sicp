(define ran? #f)

(define (wrap p args)
  (lambda ()
    (if ran?
      'done
      (begin (set! ran? #t) (apply p args)))))
;; BUG applying p can lead to an endless eval already if the definiton of p is circular

((wrap + '(1 1)))
((wrap + '(1 1)))

(define (wrap p args)
  (let ((old-proc p)
        (new-proc
          (lambda (args)
            (if ran?
              'done
              (begin (set! ran? #t) (apply new-proc args))))))))
;; BUG nowhere to reference old-proc

(define (death-loop) (death-loop))

(define (try p)
  (if (halts? p p)
    (death-loop)
    'halted))

;(try try)
