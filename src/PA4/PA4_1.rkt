#lang racket

;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 1: Count 

(define (count obj l)
  (cond
    ( (empty? l) 0)
    ( (eq? obj (car l) )
      (+ 1 (count obj (cdr l)) ) )
    (else
     (count obj  (cdr l)) )
    )
  )
  



