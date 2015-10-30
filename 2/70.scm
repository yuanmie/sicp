(load "68.scm")
(load "69.scm")
(define rock-pairs
  (list (list 'A 2)
	(list 'NA 16)
	(list 'BOOM 1)
	(list 'SHA 3)
	(list 'GET 2)
	(list 'YIP 9)
	(list 'JOB 2)
	(list 'WAH 1)))

(define huffman-tree
  (generate-huffman-tree rock-pairs))

(define message
  '(Get a job Sha na na na na na na na na Get a job Sha
	na na na na na na na na Wah yip yip yip yip yip yip yip yip
	Sha boom))

(define passwd (encode message huffman-tree))
