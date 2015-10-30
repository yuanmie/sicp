(load "67.scm")
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (encode-symbol code tree)
  (cond ((not (in? code (symbols tree)))
	 (error "code does not in this tree" code))
	((leaf? tree) '())
	(else (let ((left (left-branch tree))
	      (right (right-branch tree)))
	  (if (in? code (symbols left))
	      (cons 0 (encode-symbol code left))
	      (cons 1 (encode-symbol code right)))))))

(define (in? x set)
  (if (null? set)
      false
      (if (eq? x (car set))
	  true
	  (in? x (cdr set)))))
