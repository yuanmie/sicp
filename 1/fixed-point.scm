
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
	(display step)
	(display " : ")
	(display next)
	(newline)
      (if (close-enough? guess next)
	  next
	  (try next (+ step 1)))))
  (try first-guess 1))

(define (mysqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
	       1.0))
