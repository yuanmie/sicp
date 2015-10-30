(define (make-monitored func)
  (define (count-time time)
    (define (incur) (set! time (+ time 1)))
    (define (how-many-calls) 
	    time)
    (define (reset-count) (begin (set! time 0) time))
    (define (dispatch m)
	(cond ((eq? m 'how-many-calls) (how-many-calls))
	      ((eq? m 'reset-count) (reset-count))
		(else
		 (begin
		   (incur)
		   (func m)))))
    dispatch)
  (count-time 0))
