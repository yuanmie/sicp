(load "p155-monte-carlo.scm")
(define (estimate-integral p x1 x2 y1 y2 times)
  (define (experment)
    (p (random-in-range x1 x2)
       (random-in-range y1 y2)))
  (monte-carlo times experment))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))


(define (iner-test x y)
  (< (+ (square (- x 5))
	(square (- y 7)))
     (square 3)))

(define (area x1 x2 y1 y2)
  (* (- x1 x2) (- y1 y2)))
	

(define (getValue)
  (estimate-integral iner-test 2 8 4 10 100))
