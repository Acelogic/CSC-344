;---------
; Programming Assignment 1: First Interactions

#lang racket
( require 2htdp/image )

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



