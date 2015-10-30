(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
	result
	(product-iter (next a ) (* result a))))
  (product-iter a 1))


(define (f x)
  (* (/ (- x 1) x)
     (/ (+ x 1) x)))

(define (next x)
  (+ x 2.0))

(define (getPI a b)
  (* (product f a next b) 4))

(define (fac n)
  (define (next a)
    (+ a 1))
  (define (term a) a)
  (product term 1 next n))
