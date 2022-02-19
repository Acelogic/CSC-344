;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )

;; Task 5: Channeling Frank Stella (Done)


( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )
( define ( rgb-value ) ( random 256 ) )

( define (stella side count color1 color2 )
   ( define delta ( / side count ) )
   ( paint-nested-triangles 1 count delta color1 color2 )
)

( define ( paint-nested-triangles from to delta color1 color2 )
   ( define side-length ( * from delta ) )
   ( cond
      ( ( = from to )
        ( if ( even? from )
             ( triangle side-length "solid" color1 )
             ( triangle side-length "solid" color2 )
             )
        )
      ( ( < from to )
        ( if ( even? from )
             ( overlay
               ( triangle side-length "solid" color1 )
               ( paint-nested-triangles ( + from 1 ) to delta color1 color2 )
               )
             ( overlay
               ( triangle side-length "solid" color2 )
               ( paint-nested-triangles ( + from 1 ) to delta color1 color2 )
               )
             )
        )
      )
)

;; Testing
(stella 400 20 (random-color) (random-color))
