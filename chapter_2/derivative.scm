(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (variable? x) (symbol? x))

(define (same-variable? x y)
  (and (variable? x)
       (variable? y)
       (eq? x y)))

(define (make-sum addend augend)
  (cond ((=number? addend 0) augend)
        ((=number? augend 0) addend)
        ((and (number? addend) (number? augend)) (+ addend augend))
        (else (list '+ addend augend))))

(define (make-product multiplier multiplicand)
  (cond ((or (=number? multiplier 0) (=number? multiplicand 0)) 0)
        ((=number? multiplier 1) multiplicand)
        ((=number? multiplicand 1) multiplier)
        ((and (number? multiplier) (number? multiplicand)) (* multiplier multiplicand))
        (else (list '* multiplier multiplicand))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (deriv exp var)
  (cond ((number? exp) 0) ; dc/dx = 0
        ((variable? exp)
         (if (same-variable? exp var) 1 0)) ; dx/dx = 1
        ((sum? exp) ; d(u + v)/dx = du/dx + dv/dx
         (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
        ((product? exp) ; d(uv)/dx = u(dv/dx) + v(du/dx)
         (make-sum
           (make-product (multiplier exp) (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var) (multiplicand exp))))
        (else (error "unknown expression type: DERIV" exp))))

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
