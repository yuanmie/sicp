(load "63.scm")
(load "64.scm")
(load "sortset.scm")

(define (union-set-tree tree1 tree2)
  (list->tree (union-set
	       (tree->list-2 tree1)
	       (tree->list-2 tree2))))

(define (intersection-set-tree tree1 tree2)
  (list->tree (intersection-set
	       (tree->list-2 tree1)
	       (tree->list-2 tree2))))
