(load "p203-probe.scm")
(display "fuck")
(define (averager a b c)
  (let ((p (make-connector))
	(n (make-connector)))
    (adder a b p)
    (multiplier p n c)
    (constant 0.5 n)
    'ok))
