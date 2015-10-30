(define (add-streams a b) (stream-map + a b))
(define (partial-sums s) (cons-stream (stream-car s) (add-streams (stream-cdr s) (partial-sums s))))
