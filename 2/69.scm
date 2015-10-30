(load "huffman.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (cond ((null? pairs) '())
	((= 1 (length pairs)) (car pairs))
	(else (let ((leaf-1 (car pairs))
		    (leaf-2 (cadr pairs)))
		(let ((leaf-12 (make-code-tree leaf-1 leaf-2)))
		  (successive-merge (cons leaf-12 (cddr pairs))))))))
