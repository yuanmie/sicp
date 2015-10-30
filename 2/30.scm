(define (square-tree tree)
  (cond ((null? tree) ())
	((not (pair? tree)) (square tree))
	(else (cons (square-tree (car tree))
		    (square-tree (cdr tree))))))

(define (square-tree2 tree)
  (map (lambda (x)
	 (cond ((null? x) ())
	       ((not (pair? x)) (square x))
	       (else (square-tree2 x))))
       
       tree))
