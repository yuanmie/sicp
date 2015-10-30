(load "binary-tree.scm")

(define (lookup given-key tree-of-records)
  (cond ((null? tree-of-records) false)
	((equal? given-key (key (car tree-of-records)))
	 (car tree-of-records))
	((< given-key (key (car tree-of-records)))
	 (lookup given-key (left-branch tree-of-records)))
	((> given-key (key (car tree-of-records)))
	 (lookup given-key (right-branch tree-of-records)))))

(define (key record)
  (car record))
