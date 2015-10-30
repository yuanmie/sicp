(define (repeated f n)
	(define (repeated-iter i r)
			(if (> i n)
				r
				(repeated-iter (+ i 1) (f r))))
	(lambda (x) (repeated-iter 1 x)))
