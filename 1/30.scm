(load "/home/likai/code/sicp/common/even.scm")
(load "/home/likai/code/sicp/common/sum.scm")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a ) (+ result (term a)))))
  (iter a 0))

(define (term x ) x)
(define (next x) (+ x 1))

