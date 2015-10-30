(define gcd-machine
  (make-machine
   '(a b t)
   (list (list 'rem remainder) (list '= =))
   '(test-b
     (test (op =) (reg b) (const 0))
     (branch (label gcd-done))
     (assign t (op rem) (reg a) (reg b))
     (assign a (reg b))
     (assign b (reg t))
     (goto (label test-b))
     gcd-done)))

(display "hello")
(newline)

(set-register-contents! gcd-machine 'a 206)

(display "(set-register-contents! gcd-machine 'a 206)")
(newline)

(set-register-contents! gcd-machine 'b 40)

(display "(set-register-contents! gcd-machine 'b 40)")
(newline)

(start gcd-machine)

(display "(start gcd-machine)")
(newline)

(get-register-contents gcd-machine 'a)
