;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )

;; Task 1: Colorful Permutations of Tract Houses

( define ( rgb-value ) ( random 256 ) )
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

(define ( house-roof side color)
  (triangle side "solid" color)
 )

(define (house-body width height color)
  (rectangle width height "solid" color)
)


(define (house width height random-color1 random-color2 random-color3)
   (define roof (house-roof width (color 190 189 189 )))
   (define floor1 (house-body width height random-color1))
   (define floor2 (house-body width height random-color2))
   (define floor3 (house-body width height random-color3))
   (above roof floor1 floor2 floor3)
)

(define (tract width height)
  (define indiv-width (/ width 6))
  (define rand-color1 (random-color))
  (define rand-color2 (random-color))
  (define rand-color3 (random-color))
  (define h1(house indiv-width height (random-color) (random-color) (random-color)))
  (define h2(house indiv-width height (random-color) (random-color) (random-color)))
  (define h3(house indiv-width height (random-color) (random-color) (random-color)))
  (define h4(house indiv-width height (random-color) (random-color) (random-color)))
  (define h5(house indiv-width height (random-color) (random-color) (random-color)))
  (define h6(house indiv-width height (random-color) (random-color) (random-color)))
  (beside/align "center" h1 h2 h3 h4 h5 h6)
)
;-----------------------
;; Testing Cases
;-----------------------
;;(house 100 60 (random-color) (random-color) (random-color))
;;(tract 700 150)




