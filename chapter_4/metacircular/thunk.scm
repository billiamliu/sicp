(define (force-it obj)
  (if (thunk? obj)
    (actual-value (thunk-exp obj) (thunk-env obj))
    obj))

(define (delay-it exp env)
  (list 'thunk exp env))

(define (thunk? obj)
  (tagged-list? obj 'thunk))

(define (thunk-exp thunk) (cadr thunk))
(define (thunk-env thunk) (caddr thunk))

(define (force-it obj)
  (cond ((thunk? obj)
         (let ((result (actual-value
                         (thunk-exp obj)
                         (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result) ;; replace exp with its val
           (set-cdr! (cdr obj) '()) ;; forget env
           result))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))

;; memoize

(define (evaluated-thunk? obj)
  (tagged-list? obj 'evaluated-thunk))

(define (thunk-value evaluated-thunk) (cadr evaluated-thunk))
