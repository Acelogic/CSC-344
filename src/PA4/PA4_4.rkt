#lang racket

;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 4: Assoc



(define (a-list list_a list_b)
  (cond
    ((empty? list_a) '())
    (else
     (cons (cons (car list_a) (car list_b)) (a-list (cdr list_a)
                                                    (cdr list_b)))
     )
    )
  )

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
