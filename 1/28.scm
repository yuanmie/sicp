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
	 (remainder (square (test-expmod (expmod base (/ exp 2) m) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))


(define (Miller-Rabin n)
  (Miller-Rabin-test 2 n (/ n 2)))

(define (Miller-Rabin-test a n times)
  (define (try-it a)
    (= (expmod a n n) (remainder 1 n)))
  (cond ((= times 0) #t)
	((not (try-it a)) #f)
	(else (Miller-Rabin-test (+ a 1) n (- times 1)))))

(define (test-expmod a n)
  (cond ((= (remainder (square a) n) 1) 0)
	(else a)))
