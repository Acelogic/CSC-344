#lang racket

;---------
; Programming Assignment 3: Lambda and Basic Lisp

;; Task 1: Lambda (Done)


;; Task 1a
;; Make a lamba function that takes in a single number and retuns the next two bigger numbers
(define asc (lambda (n)
  (let ((n1 n)
        (n2 n))
    (set! n1 (+ n1 1))
    (set! n2 (+ n2 2))
    (list n n1 n2))))


;; Task 1b
;; Make a lambda function that takes in 3 parameters and produces a list in reverse order
(define mlr (lambda (a b c)
  (let ((a1 a)
        (a2 b)
        (a3 c))
    (list a3 a2 a1))))


;; Task 1c
;; Make a lamdba function that takes in two parameters and returns a random number between them
(define rn (lambda (a b)
   (random a (+ b 1))))
  




