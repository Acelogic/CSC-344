;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )
;; Task 4: Hirst Dots (Done)

;; Make Random Colors
( define ( rgb-value ) ( random 256 ) )
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

;; Make Dot
(define (make-dot)
  (circle 15 "solid" (random-color))
)

;; Make Row of Dots
(define (make-dot-row n)
  (cond 
     ((= n 0)
       (display "\n"))
     ((> n 0)
       
       (display (above (beside (make-dot) (square 20 "outline" "white")) (square 20 "outline" "white")))
       (make-dot-row (- n 1))
       )
     )
)
;; Make a rectangle generator for hirst dots     
(define (rectangle-of-hirst-dots r c)
  (cond
    ((= r 0)
     (display "\n")
     )
     ((> r 0)
      (make-dot-row c)
      (rectangle-of-hirst-dots (- r 1) c)
    )
  )
)

;; A square is a rectangle therefore side 
(define (hirst-dots n)
(rectangle-of-hirst-dots n n)
)
  





;;(hirst-dots 10)