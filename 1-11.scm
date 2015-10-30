;recursive f()
(define (f n)
  (if (< n 4)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

;iteration f()
(define (f2 n)
  (if (< n 3)
      n
      (f-iter 3 2 1 n)))

(define (f-iter a b c n)
  (if (< n 4)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))
