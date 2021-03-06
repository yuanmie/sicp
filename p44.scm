(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
	midpoint
	(let ((test-value (f midpoint)))
	  (cond ((positive? test-value)
		 (search f neg-point midpoint))
		((negative? test-value)
		 (search f midpoint pos-point))
		(else midpoint))))))

(define (average x y)
  (/ (+ x y) 2))

(define (positive? x)
  (> x 0))

(define (negtive? x)
  (< x 0))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
	(b-value (f b)))
	(cond ((and (negative? a-value) (positive? b-value))
	       (search f a b))
	       ((and (negative? b-value) (positive? a-value))
		(search f a b))
	       (else 
		(error "value are not of opposite sign" a b)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (mysqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
	       1.0))
