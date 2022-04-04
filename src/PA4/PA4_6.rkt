#lang racket
(require 2htdp/image)
;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 6: Generate List

(define (generate-list num fn)
  (cond
    ((= 1 num) (make-list 1 (fn)))
    (else
     (append (make-list 1 (fn)) (generate-list (- num 1) fn))
     )
    )
  )

(define (big-dot)
  (circle (* 2 (random 41)) "solid" (random-color))
  )

(define (dot)
  (circle ( + 10 ( random 41 ) ) "solid" (random-color) )
  )
(define (random-color)
  (color (random 256)(random 256)(random 256))
  )
(define (roll-die) (+ (random 6) 1))
(define (sort-dots loc)
  (sort loc #:key image-width <)
  )