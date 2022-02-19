;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )

;; Task 3: Number Sequences
( define ( square n )
   ( * n n )
)
( define ( cube n )
   ( * n n n )
)
( define ( sequence name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 ) ) ( display " " )
)
      ( else
        ( sequence name ( - n 1 ) )
        ( display ( name n ) ) ( display " " )
        )
      )
)

;-----------------------
;; Testing Cases
;-----------------------

