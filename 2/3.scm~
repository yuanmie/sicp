(load "2.scm")

(define (make-rectangle left-top right-bottom)
  (cons left-top right-bottom))

(define (length rect)
  (abs (- (x-point (car rect)) (x-point (cdr rect)))))

(define (width rect)
  (abs (- (y-point (car rect)) (y-point (cdr rect)))))

(define (get-value rect func)
  (abs (- (func (car rect)) (func (cdr rect)))))

(define (perimeter rect)
  (* 2 (+ (length rect) (width rect))))

(define (area rect)
  (* (length rect) (width rect)))
