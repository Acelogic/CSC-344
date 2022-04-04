#lang racket

;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 5: Frequency Table


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

;; From Task 3
(define (a-list list_a list_b)
  (cond
    ((empty? list_a) '())
    (else
     (cons (cons (car list_a) (car list_b)) (a-list (cdr list_a)
                                                    (cdr list_b)))
     )
    )
  )

;; From Task 4
(define (assoc obj list)
  (cond
    ((empty? list) '())
    ((eq? (car (car list)) obj)
     (car list)
     )
    (else
     (assoc obj (cdr list))
     )
    )
  )

;;----------------------------------------------------------------
;; Provided Functions from Task 5
(define (ft the-list)
  (define the-set (list->set the-list))
  (define the-counts
    (map (lambda (x) (count x the-list)) the-set)
    )
  (define association-list (a-list the-set the-counts))
  (sort association-list < #:key car)
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

(define (add-blanks s n)
  (cond
    (( = n 0) s)
    (else (add-blanks (string-append s " ") (- n 1) ) )
    )
  )
