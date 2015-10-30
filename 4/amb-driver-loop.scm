(define input-prompt ";;; Amb-Eval input:")
(define output-prompt ";;; Amb-Eval output:")

(define (drive-loop)
  (define (intername-loop try-again)
    (prompt-for-input input-prompt)
    (let ((input (read)))
      (if (eq? input 'try-again)
	  (try-again)
	  (begin
	    (newline)
	    (display ";;;starting a new problem")
	    (ambeval input
		     the-global-environment
		     (lambda (val next-alternative)
		       (announce-output output-prompt)
		       (user-print val)
		       (internal-loop next-alternative))
		     (lambda ()
		       (announce-output
			";;;There are no more values of")
			(user-print input)
			(driver-loop)))))))
    (internal-loop
     (lambda ()
       (newline)
       (display ";;; There is no current problem")
       (dirver-loop))))
