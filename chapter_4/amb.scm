; http://community.schemewiki.org/?amb

;;; FAIL is called to backtrack when a condition fails.  At the top 
 ;;; level, however, there is no more to backtrack, so we signal an 
 ;;; error with SRFI 23. 
 (define fail 
   (lambda () 
     (error "Amb tree exhausted"))) 
  
 (define-syntax amb 
   (syntax-rules () 
     ((AMB) (FAIL))                      ; Two shortcuts. 
     ((AMB expression) expression) 
  
     ((AMB expression ...) 
      (LET ((FAIL-SAVE FAIL)) 
        ((CALL-WITH-CURRENT-CONTINUATION ; Capture a continuation to 
           (LAMBDA (K-SUCCESS)           ;   which we return possibles. 
             (CALL-WITH-CURRENT-CONTINUATION 
               (LAMBDA (K-FAILURE)       ; K-FAILURE will try the next 
                 (SET! FAIL              ;   possible expression. 
                       (LAMBDA () (K-FAILURE #f))) 
                 (K-SUCCESS              ; Note that the expression is 
                  (LAMBDA ()             ;   evaluated in tail position 
                    expression))))       ;   with respect to AMB. 
             ... 
             (SET! FAIL FAIL-SAVE)      ; Finally, if this is reached, 
             FAIL-SAVE)))))))           ;   we restore the saved FAIL. 
  
 (define (require condition) 
   (if (not condition) 
       (fail))) 
  
 ;;; As an auxiliary example, AMB-POSSIBILITY-LIST is a special form 
 ;;; that returns a list of all values its input expression may return. 
  
 (define-syntax amb-possibility-list 
   (syntax-rules () 
     ((AMB-POSSIBILITY-LIST expression) 
      (LET ((VALUE-LIST '())) 
        ;; This requires that AMB try its sub-forms left-to-right. 
        (AMB (let ((VALUE expression)) 
               (SET! VALUE-LIST (CONS VALUE VALUE-LIST)) 
               (FAIL)) 
             (REVERSE VALUE-LIST))))))   ; Order it nicely. 
