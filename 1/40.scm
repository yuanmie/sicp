(load "newtons-method.scm")
(define (cubic a b c)
	(lambda (x) (+
				(* x (square x))
				(* a (square x))
				(* b x)
				c)))

(define (solutionfor3x a b c)
	(newtons-method (cubic a b c) 1))
				
