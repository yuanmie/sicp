(define (insert! key-list value table)
  (if (list? key-list)
      (let ((current-key (car key-list))
	    (remain-key (cdr key-list)))
	(let ((record (assoc current-key (cdr table))))
	  (cond
					;1)has record and no keywords
					;update value of record
	   ((and record (null? remain-key))
	    (set-cdr! record value)
	    table)

	   ;2)has record and has other keywords
	   ;recursion insert!
	   ((and record remain-key)
	    (insert! remain-key value record)
	    table)

	    ;3) no record and has other keywords
	   ((and (not record) (not (null? remain-key)))
	    (join-in-table (insert! remain-key value (make-table current-key)) table)
	    table)

	   ((and (not record) (null? remain-key))
	    (let ((new-record (cons current-key value)))
	      (join-in-table new-record table)
	      table)))))
  (insert! (list key-list) value table)))

(define (join-in-table new-record table)
  (set-cdr! table
	    (cons new-record (cdr table))))

(define (lookup key-list table)
  (if (list? key-list)
      (let ((current-key (car key-list))
	    (remain-key (cdr key-list)))
	(let ((record (assoc current-key (cdr table))))
	  (if record
	      (if (null? remain-key)
		  (cdr record)
		  (lookup remain-key record))
	      #f)))
      (lookup (list key-list) table)))

(define (make-table . table-name)
  (if (null? table-name)
      (list '*table*)
      table-name))

(define (assoc key records)
  (cond ((null? records)
	 #f)
	((equal? key (caar records))
	 (car records))
	(else
	 (assoc key (cdr records)))))
