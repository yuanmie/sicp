(load "p154-3.scm")
(define (make-joint account old-password own-password)
  (lambda (given-password mode)
    (if (eq? given-password own-password)
	(account old-password mode)
	(display "Incorrect another password"))))