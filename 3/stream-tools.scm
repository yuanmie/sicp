(define (add-streams a b)
  (stream-map + a b))

(define (scale-streams s n)
  (stream-map (lambda (x) (* x n)) s))
