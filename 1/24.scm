(define (next-odd n)
  (if (odd? n) (+ n 2)
      (+ n 1)))

(define (odd? n)
  (= (remainder n 2) 1))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (continue-primes n count start-time)
  (cond ((= count 0) (display "game over"))
	((fast-prime? n 200)
	 (display n)
	 (display "***")
	 (display (- (real-time-clock) start-time))
	 (newline)
	 (continue-primes (next-odd n) (- count 1) (real-time-clock)))
	(else
	 (continue-primes (next-odd n) count (real-time-clock)))))

(define (search-for-primes n count)
  (search-for-primes-times n count (real-time-clock)))

(define (search-for-primes-times n count start-time)
  (continue-primes n count (real-time-clock))
  (- (real-time-clock) start-time))

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
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
