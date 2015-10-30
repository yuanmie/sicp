(define (unbound? exp) (tagged-list? exp 'unbound))

(define (unbind-variable exp env) (make-unbound (cadr exp) env))

(define (make-unbound variable env)
  (let ((vars (frame-variables (first-frame env)))
	(vals (frame-values (first-frame env))))
    (define (unbound vars vals new-vars new-vals)
      (cond ((null? vars)
	     (error "variable is not in this environment -- MAKE-UNBOUND" variable))
	     ((eq? (car vars) variable)
	      (set-car! env
			(cons (append new-vars (cdr vars))
			      (append new-vals (cdr vals)))))
	     (else (unbound (cdr vars) (cdr vals)
			    (cons (car vars) new-vars)
			    (cons (car vals) new-vals)))))
    (unbound vars vals '() '())))

;;add this in eval
((unbound? exp) (unbind-variable exp env))
