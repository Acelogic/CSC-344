#lang racket

;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 3: Association List Generator


(define (a-list list_a list_b)
  (cond
    ((empty? list_a) '())
    (else
     (cons (cons (car list_a) (car list_b)) (a-list (cdr list_a)
                                                    (cdr list_b)))
     )
    )
  )