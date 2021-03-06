(define (make-account balance password)
  (define (count-time time)
    (define (incur) 
      (begin (set! time (+ 1 time))
	     (display "Incorrect password!")
	     (if (> time 6)
		 (call-the-cops))))
    (define (call-the-cops)
      (display "call the police!"))
    (define (reset-count) (set! time 0))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch pwd m)
      (if (eq? pwd password)
	  (begin (reset-count)
		 (cond ((eq? m 'withdraw) withdraw)
		       ((eq? m 'deposit) deposit)
		       (else (error "Unknown request -- MAKE-ACCOUNT" m))))
	  (incur)))

    dispatch)
  (count-time 0))
