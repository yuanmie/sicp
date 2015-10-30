(load "43.scm")
(define dx 0.00001)

(define (average x y z)
	(/ (+ x y z) 3))

(define (smooth f)
	(lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (smoothN f n)
	((repeated smooth n) f))
