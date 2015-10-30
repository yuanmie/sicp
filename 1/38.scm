(load "37.scm")
(define (D i)
	(if (= 0 (remainder (+ i 1) 3))
		(* 2 (/ (+ i 1) 3))
		1))

(define (e k)
	(+ 2.0 (cont-frac (lambda (i) 1.0) D k)))			
