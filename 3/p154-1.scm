(define (make-accumulator count)
  (lambda (x)
    (begin (set! count (+ count x))
	   count)))
