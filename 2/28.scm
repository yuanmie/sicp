(define (fringe x)
  (fringe-iter x ()))

(define (fringe-iter x result)
  (cond ((null? x) result)
	((not (pair? x)) (cons x result))
	(else (append (fringe-iter (car x) ()) (fringe-iter (cdr x) ())))))
