(load "/home/likai/code/sicp/1/fixed-point.scm")
(define (fxx x)
	(fixed-point (lambda (y) (/ (log 1000) (log y))) x))

(define (xx x)
	(fixed-point (lambda (y) (/ (+ y (/ (log 1000) (log y))) 2)) x))
