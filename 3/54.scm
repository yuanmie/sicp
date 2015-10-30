(load "p227.scm")
(define (mul-streams a b)
  (stream-map * a b))

(define factorials (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))
