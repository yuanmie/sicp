(define (deep-reverse l)
  (deep-reverse-iter l ()))

(define (deep-reverse-iter l result)
  (if (null? l)
      result
      (let ((first (car l)))
	(cond ((pair? first) (deep-reverse-iter (cdr l) (cons (deep-reverse-iter first ()) result)))
	      (else (deep-reverse-iter (cdr l) (cons first result)))))))
