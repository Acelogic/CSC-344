;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )
;; Task 6: Random

(define mona (bitmap/url "https://lh3.googleusercontent.com/j-z1pzj-uBDi-URM98Ko2jw2NW62d2PSWmQafpoA3gSM0O646lzIW66efDJ6ksD5Gqq566gX91ZI5NpwbJaoj7u6cmrSa7_q4WAi8w=w289"))

(define color-list (image->color-list mona))
(define list-length(length (image->color-list mona)))


;; Make a function that literates through the list and creates a circle for each index
