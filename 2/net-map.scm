(load "2-2-3.scm")
(accumulate append
	    nil
	    (map (labmda (i)
			 (map (lambda (j) (list i j))
			      (enumerate-interval 1 (- i 1))))
		 (enumerate-inteval 1 n)))
