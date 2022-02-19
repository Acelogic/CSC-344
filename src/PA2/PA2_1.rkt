;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )

;; Task 1: Colorful Permutations of Tract Houses (Done)

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

  (define h1(house indiv-width height rand-color1 rand-color2 rand-color3))
  (define h2(house indiv-width height rand-color1 rand-color3 rand-color2))
  (define h3(house indiv-width height rand-color2 rand-color1 rand-color3))
  (define h4(house indiv-width height rand-color2 rand-color3 rand-color1))
  (define h5(house indiv-width height rand-color3 rand-color1 rand-color2))
  (define h6(house indiv-width height rand-color3 rand-color2 rand-color1))
  (define gap1 (rectangle 10 (* 3 height) "outline" "white"))
  (define gap2 (rectangle 10 (* 3 height) "outline" "white"))
  (define gap3 (rectangle 10 (* 3 height) "outline" "white"))
  (define gap4 (rectangle 10 (* 3 height) "outline" "white"))
  (define gap5 (rectangle 10 (* 3 height) "outline" "white"))
 
  
  (beside/align "center" h1 gap1 h2 gap2 h3 gap3 h4 gap4 h5 gap5 h6)
)
;-----------------------
;; Testing Cases
;-----------------------
(house 100 60 (random-color) (random-color) (random-color))
(tract 700 150)
(tract 300 400)



