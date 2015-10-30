(define *coercion-table* (make-hash-table 'equal))

(define (put-coercion type-from type-to proc)
  (hash-table/put! 
    *coercion-table* 
    (list type-from type-to) 
    proc))

(define (get-coercion type-from type-to)
  (hash-table/get 
    *coercion-table* 
    (list type-from type-to) 
    #f))
