(load "/home/likai/code/sicp/1/fixed-point.scm")
(define dx 0.00001)
(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (newton-transform g)
	(lambda (x)
		(- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
	(lambda (x)
		(/ (- (g (+ x dx)) (g x))
			dx)))
