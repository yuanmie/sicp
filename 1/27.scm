(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		  	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (Carmichael n)
  (Carmichael-iter 2 n))

(define (Carmichael-iter a n)
  (cond ((= a n) #t)
	((try-it a n) (Carmichael-iter (+ a 1) n))
	(else #f)))

(define (try-it a n)
  (= (expmod a n n) a))
