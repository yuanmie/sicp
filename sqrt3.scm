(define (sqrt3 x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess guess2)
  (< (abs (/ (- guess2 guess) guess2)) 0.0001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
