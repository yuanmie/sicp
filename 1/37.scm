(define (cont-frac n d k)
	(define (cont-frac-iter n d k r)
			(if (= k 0)
				r
				(cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) r)))))
	(cont-frac-iter n d k 0))

(define (cont-frac-recusive n d k)
	(define (f n d k i)
			(if (= i (+ k 1))
				0
				(/ (n i) (+ (d i) (f n d k (+ i 1))))))
	(f n d k 1))
