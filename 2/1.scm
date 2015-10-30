(load "rational-number.scm")
(define (make-rat n d)
	(let ((g (gcd n d)))
		(if (> (/ n d) 0)
			(cons (/ n g) (/ d g))
			(cons (- (/ (abs n) g)) (/ (abs d) g)))))
		
