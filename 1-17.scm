(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(define (fast-* a b)
  (fast*-iter a b a))

(define (fast*-iter a b r)
  (cond ((= b 1) r)
	((even? b) (fast*-iter a (halve b) (double r)))
	(else (fast*-iter a (- b 1) (+ r a)))))

(define (even? n)
  (= (remainder n 2) 0))
