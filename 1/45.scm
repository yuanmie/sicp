(load "/home/likai/code/sicp/expt.scm")
(load "average-damp.scm")
(load "fixed-point.scm")

(define (average-damp-times f n)
	((repeated average-damp n) f))

(define (solutionN n damptime)
	(lambda (x)
		(fixed-point (average-damp-times
						(lambda (y) (/ x (expt y (- n 1))))
						damptime)
					1.0)))

(define (log2 n)
	(if (> n 1)
		(+ 1 (log2 (/ n 2)))
		0))

(define (solutin-n n)
	(solutionN n (log2 n)))
