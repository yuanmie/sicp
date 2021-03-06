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
	((prime? n)
	 (display n)
	 (display "***")
	 (display (- (real-time-clock) start-time))
	 (newline)
	 (continue-primes (+ n 1) (- count 1) (real-time-clock)))
	(else
	 (continue-primes (+ n 1) count (real-time-clock)))))

(define (search-for-primes n count)
  (search-for-primes-times n count (real-time-clock)))

(define (search-for-primes-times n count start-time)
  (continue-primes n count (real-time-clock))
  (- (real-time-clock) start-time))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

