(define (last-pair l)
  (define (last-pair-iter ll result)
    (if (null? ll)
	result
	(last-pair-iter (cdr ll) (car ll))))
  (last-pair-iter l ()))
