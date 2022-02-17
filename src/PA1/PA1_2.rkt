;---------
; Programming Assignment 1: First Interactions

#lang racket
( require 2htdp/image )

;; Part 2 (Solution to the blue and red tile area problem)
(define side-of-tile 200)
(define diameter-of-dot (/ side-of-tile 3))
(define radius-of-dot (/ diameter-of-dot 2))
(define total-tile-area (expt side-of-tile 2))
(define red-dot-area (* pi ( expt radius-of-dot 2)))
(define blue-tile-area ( - total-tile-area red-dot-area ))