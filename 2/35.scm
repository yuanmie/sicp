(load "2-2-3.scm")
(define (count-leaves t)
  (accumulate +
	      0
	      (map
	       (lambda (subtree)
		 (if (pair? subtree)
		     (count-leaves subtree)
		     1))
	       t)))
