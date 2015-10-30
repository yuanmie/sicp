(define (tree-map func tree)
  (map (lambda (x)
	 (if (pair? x)
	     (tree-map func x)
	     (func x)))
       tree))

(define (square-tree tree) (tree-map square tree))
