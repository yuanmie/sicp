(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
	((or (null? a) (null? b)) false)
	((and (pair? (car a)) (pair? (car b))) (equal? (car a) (car b)))
	((not (eq? (car a) (car b))) false)
	(else
	 (equal? (cdr a) (cdr b)))))
