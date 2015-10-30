(load "interval.scm")
(define (div-interval x y)
  (let ((upper-y (upper-bound y))
	(lower-y (lower-bound y)))
    	(if (and (> upper-y 0) (< lower-y 0))
	    (mul-interval x
			  (make-interval (/ 1.0 upper-y)
					 (/ 1.0 lower-y)))
	    (mul-interval x
			  (make-interval (/ 1.0 lower-y)
					 (/ 1.0 upper-y))))))
