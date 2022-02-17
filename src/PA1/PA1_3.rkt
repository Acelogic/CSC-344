;---------
; Programming Assignment 1: First Interactions

#lang racket
( require 2htdp/image )

;; Part 3 Painting the blue and red tile
( define side-of-tile 200 )
( define diameter-of-dot ( / side-of-tile 3 ))
( define radius-of-dot ( / diameter-of-dot 2))
( define tile ( square side-of-tile "solid" "blue"))
( define dot (circle radius-of-dot "solid" "red"))
( overlay dot tile )
