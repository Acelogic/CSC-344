;---------
; Programming Assignment 1: First Interactions

#lang racket
( require 2htdp/image )

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
