(load "/home/likai/code/sicp/prime.scm")
(define (accumulate-filter combiner null-value term a next b filter)
  (cond ((> a b) null-value)
	((filter a)
	 (combiner (term a)
		   (accumulate-filter combiner null-value term (next a) next b filter)))
	(else
	 (accumulate-filter combiner null-value term (next a) next b filter))))

(define (addprime a b)
  (define (term x ) x)
  (define (next x ) (+ x 1))
  (accumulate-filter + 0 term a next b prime?))

(load "/home/likai/code/sicp/gcd.scm")
(define (multi-coprime a b)
  (define (coprime? i)
    (= (gcd i b) 1))
  (define (term x) x)
  (define (next x) (+ x 1))
  (accumulate-filter * 1 term a next b coprime?))