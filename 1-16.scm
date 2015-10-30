(define (fast-expt b n)
  (if (= n 0)
      1
  (fast-iter b n b)))

(define (fast-iter b n a)
  (cond ((= n 1) a)
	((even? n) (fast-iter b (/ n 2) (square a)))
	(else (* a (fast-iter b (- n 1) a)))))

(define (even? n)
  (= (remainder n 2) 0))
