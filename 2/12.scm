(load "interval.scm")
(load "10.scm")
(define (make-center-percent c p)
  (make-interval (- c (* c (/ p 100.0))) (+ c (* c (/ p 100.0)))))

(define (percent i)
  (/ (/ (- (upper-bound i) (lower-bound i)) 2) (center i)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
