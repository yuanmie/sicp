(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;;xanswer for question (a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;;answer for question (b)
(define (total-weight mobile)
  (if (null? mobile)
      0
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile)))))

(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
	(total-weight struct)
	struct)))

;;answer for question (c)
(define (mobile-equal? mobile)
  (let ((left (left-branch mobile))
	(right (right-branch mobile)))
    (= (* (branch-length left) (branch-weight left))
       (* (branch-length right) (branch-weight right)))))

;;start mehtod
(define (mobile-equal mobile)
  (and (mobile-equal? mobile)
       (branch-equal (left-branch mobile))
       (branch-equal (right-branch mobile))))

(define (branch-equal branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
	(mobile-equal struct)
	#t)))
