;---------
; Programming Assignment 1: First Interactions

#lang racket
( require 2htdp/image )
;; Part 1 (Simple Numeric Processing)
;55
;55.2
;pi
;( * 3 8)
;(+ (* 3 8) 6 )
;(expt 2 8)
;(* pi (expt 7 2))
;(expt 9 50)

;; Part 2 (Solution to the blue and red tile area problem)
(define side-of-tile 200)
(define diameter-of-dot (/ side-of-tile 3))
(define radius-of-dot (/ diameter-of-dot 2))
(define total-tile-area (expt side-of-tile 2))
(define red-dot-area (* pi ( expt radius-of-dot 2)))
(define blue-tile-area ( - total-tile-area red-dot-area ))

;; Part 3 Painting the blue and red tile
;( define side-of-tile 200 )
;( define diameter-of-dot ( / side-of-tile 3 ))
;( define radius-of-dot ( / diameter-of-dot 2))
;( define tile ( square side-of-tile "solid" "blue"))
;( define dot (circle radius-of-dot "solid" "red"))
;( overlay dot tile )

;; Part 4 Painting concentric squares image
( define side-of-1st-tile 88.5 )
( define side-of-2nd-tile (* side-of-1st-tile 2 ))
( define side-of-3rd-tile (* side-of-1st-tile 3 ))
( define side-of-4th-tile (* side-of-1st-tile 4 ))
( define side-of-5th-tile (* side-of-1st-tile 5 ))
   
( define first_tile (square side-of-1st-tile "solid" "red"))
( define second_tile (square side-of-2nd-tile "solid" "yellow"))
( define third_tile (square side-of-3rd-tile "solid" "green"))
( define fourth_tile (square side-of-4th-tile "solid" "blue"))
( define fifth_tile (square side-of-5th-tile "solid" "red"))


;; Part 5 Computing the percent of the concentric squares image which is red
(define (square_area side)
  (* side side)
)

(define area_of_all (square_area side-of-5th-tile))
(define area_of_fourth_tile (square_area side-of-4th-tile))

(define bigger_red_area (- area_of_all area_of_fourth_tile))
(define smaller_red_area (square_area side-of-1st-tile))
(define total_red_area (+ bigger_red_area smaller_red_area))

(define percentage_of_red (* (/ total_red_area area_of_all) 100))



