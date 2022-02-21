;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )


;; Task 7 Random Image (Done)

( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )
( define ( rgb-value ) ( random 256 ) )


(define (coolthing size)
  (above
   (beside
    (crop/align "right" "bottom" 100 100 (circle size "solid" (random-color)))
    (crop/align "left" "bottom" 100 100 (circle size "solid"  (random-color))))
   (beside
    (crop/align "right" "top" 100 100 (circle size "solid"    (random-color)))
    (crop/align "left" "top" 100 100 (circle size "solid"     (random-color))))))


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


;; Make a paint nested cropped circle function
( define ( paint-nested-circle from to delta color1 color2 )
   ( define side-length ( * from delta ) )
   ( cond
      ( ( = from to )
        ( if ( even? from )
             ( circle side-length "solid" color1 )
             ( circle side-length "solid" color2 )
             )
        )
      ( ( < from to )
        ( if ( even? from )
             ( overlay
               ( circle side-length "solid" color1 )
               ( paint-nested-circle ( + from 1 ) to delta color1 color2 )
               )
             ( overlay
               ( circle side-length "solid" color2 )
               ( paint-nested-circle ( + from 1 ) to delta color1 color2 )
               )
             )
        )
      )
)

( define (some-circle-thing side count color1 color2 )
   ( define delta ( / side count ) )
   (overlay
    (coolthing 175)
    ( paint-nested-triangles 35 count delta color2 color1 )
    ( paint-nested-circle 1 count delta color1 color2 ))
  
)


;(some-circle-thing 200 40 (random-color) (random-color))