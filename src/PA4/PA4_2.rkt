#lang racket

;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 2: List-> Set 

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

