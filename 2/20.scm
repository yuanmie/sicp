(define (same-parity x . l)
  (let ((a (even? x)))
    (same-parity-iter a l ())))

(define (even? x)
  (remainder x 2))

(define (same-parity-iter a l result)
  (if (null? l)
      (reverse result)
  (let ((first (car l)))
    (cond ((= a (even? first)) (same-parity-iter a (cdr l) (cons first result)))
	  (else (same-parity-iter a (cdr l) result))))))
