#lang racket
;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 9: Transformation of a Recursive Sampler

;; Helper Functions
;;----------------------------------------------------------------

;; From Task 1
(define (count obj l)
  (cond
    ( (empty? l) 0)
    ( (eq? obj (car l) )
      (+ 1 (count obj (cdr l)) ) )
    (else
     (count obj  (cdr l)) )
    )
  )

;; From Task 2

(define (list->set l)
  (cond
    ((empty? l) l)
    ((member (car l) ( cdr l))
     (list->set (cdr l))
     )
    (else
     (cons (car l) (list->set (cdr l)))
     )
    )
  )

;; From Task 4
(define (a-list list_a list_b)
  (cond
    ((empty? list_a) '())
    (else
     (cons (cons (car list_a) (car list_b)) (a-list (cdr list_a)
                                                    (cdr list_b)))
     )
    )
  )


;; From Task 5
;-------------------------------------
(define (add-blanks s n)
  (cond
    (( = n 0) s)
    (else (add-blanks (string-append s " ") (- n 1) ) )
    )
  )
(define (ft-visualizer ft)
  (map pair-visualizer ft)
  (display "")
  )
(define (pair-visualizer pair)
  (define label
    (string-append (number->string (car pair) ) ":")
    )
  (define fixed-size-label (add-blanks label ( - 5 ( string-length label) ) ) )
                         
  (display fixed-size-label)
  (display
   (foldr
    string-append
    ""
    (make-list (cdr pair ) "*")
    )
   )
  (display "\n")
  )
(define (ft the-list)
  (define the-set (list->set the-list))
  (define the-counts
    (map (lambda (x) (count x the-list)) the-set)
    )
  (define association-list (a-list the-set the-counts))
  (sort association-list < #:key car)
  )

;; From Task 6 
(define (generate-list num fn)
  (cond
    ((= 1 num) (make-list 1 (fn)))
    (else
     (append (make-list 1 (fn)) (generate-list (- num 1) fn))
     )
    )
  )
;-------------------------------------------------------------

;Uses higher-order functions to calculate offset of n coin flips
;---------------------------------------------------------------
(define (flip-for-offset n)
  (define options '(t h))
  (define flips (generate-list n flip-coin))
  (define totals (map (lambda (x) (count x flips)) options))
  (foldr - (car totals) (cdr totals))
  )
;Creates a frequency table of the offset
;---------------------------------------
(define (demo-for-flip-for-offset)
  (define offsets
    (generate-list
     100
     (lambda () (flip-for-offset 50))
     )
    )
  (ft-visualizer (ft offsets))
  )
;Provided helper function that flips a coin
;------------------------------------------
(define (flip-coin)
  (define outcome (random 2))
  (cond
    ((= outcome 1)
     'h
     )
    (( = outcome 0)
     't
     )
    )
  )

