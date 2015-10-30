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
	 (continue-primes (next-odd n) (- count 1) (real-time-clock)))
	(else
	 (continue-primes (next-odd n) count (real-time-clock)))))

(define (search-for-primes n count)
  (search-for-primes-times n count (real-time-clock)))

(define (search-for-primes-times n count start-time)
  (continue-primes n count (real-time-clock))
  (- (real-time-clock) start-time))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

#|
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
|#

#|
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* product b))))
|#

(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))
