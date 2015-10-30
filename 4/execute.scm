(define (execute exp)
  (apply (eval (predicate exp) user-inital-environment)
	 (args exp)))
