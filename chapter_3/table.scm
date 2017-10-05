(define (make-table) (list '*table*))

(define (lookup-2d key table)
  (let ((record (assoc key (cdr table))))
    (if record
      (cdr record)
      #f)))

(define (assoc key records)
  (cond ((null? records) #f)
        ((not (pair? records)) #f)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (insert-2d! key value table)
  (let ((record (lookup-2d key table)))
    (if record
      (set-cdr! record value)
      (set-cdr! table
                (cons (cons key value) (cdr table)))))
  #t)

(define table (make-table))
(insert-2d! 'hello 'world table)
(insert-2d! 'moron 'kvall table)
table

(define (lookup-3d key1 key2 table)
  (let ((subtable (assoc key1 (cdr table))))
    (if subtable
      (let ((record (assoc key2 (cdr subtable))))
        (if record
          (cdr record)
          #f))
      #f)))

(define (insert-3d! key1 key2 value table)
  (let ((subtable (assoc key1 (cdr table))))
    (if subtable
      (let ((record (assoc key2 (cdr subtable))))
        (if record
          (set-cdr! record value)
          (set-cdr! subtable
                    (cons (cons key2 value)
                          (cdr subtable)))))
      (set-cdr! table
                (cons
                  (list key1 (cons key2 value))
                  (cdr table)))))
  #t)

(define table2 (make-table))
(insert-3d! 'hello 'a 1 table2)
(insert-3d! 'hello 'b 2 table2)
(insert-3d! 'canada 'bc 'vancouver table2)
(lookup-3d 'hello 'b table2)

(define (is-table? table)
  (if (pair? (car table))
    #f
    #t))

(define (lookup keys table)
  (let ((subtable (assoc (car keys) (cdr table))))
    (cond ((not subtable) #f)
          ((not (null? (cdr keys)))
           (lookup (cdr keys) subtable))
          (else (cdr subtable)))))

(define (insert keys value table)
  (if (null? keys)
    #f
    (let ((key (car keys)))
      (let ((entity (assoc key (cdr table))))
        ;; if this is the last key
        (if (null? (cdr keys))
          (if entity
            (set-cdr! entity value)
            (set-cdr! table
                      (cons (cons key value) (cdr table))))
          ;; there are more keys
          (if (not entity)
            (let ((subtable (list key)))
              (set-cdr! table (cons subtable (cdr table)))
              (insert (cdr keys) value subtable))
            (insert (cdr keys) value entity)))))))

(define table3 (make-table))
(insert '(hello world suh dude) 'hi table3)
(lookup '(hello world suh dude) table3)
(lookup '(hello world suh dude wat) table3)
