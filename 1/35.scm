
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
	(display next)
	(newline)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (mysqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
	       1.0))
(define (goldx x)
	(fixed-point (lambda (x) (+ 1 (/ 1 x))) x))
