;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )

;; Task 5: Channeling Frank Stella


( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )
( define ( rgb-value ) ( random 256 ) )

( define ( nested-squares-two side count color1 color2 )
   ( define delta ( / side count ) )
   ( paint-nested-squares-two 1 count delta color1 color2 )
)

( define ( paint-nested-squares-two from to delta color1 color2 )
   ( define side-length ( * from delta ) )
   ( cond
      ( ( = from to )
        ( if ( even? from )
             ( square side-length "solid" color1 )
             ( square side-length "solid" color2 )
             )
        )
      ( ( < from to )
        ( if ( even? from )
             ( overlay
               ( square side-length "solid" color1 )
               ( paint-nested-squares-two ( + from 1 ) to delta color1 color2 )
               )
             ( overlay
               ( square side-length "solid" color2 )
               ( paint-nested-squares-two ( + from 1 ) to delta color1 color2 )
               )
             )
        )
      )
)

;;;; Star Stella
( define ( nested-stars side count color )
( define unit ( / side count ) )
( paint-nested-stars 1 count unit color )
)
( define ( paint-nested-stars from to unit color)
( define side-length ( * from unit ) )
( cond
( ( = from to )
( framed-star side-length color )
)
( ( < from to )
( overlay
( framed-star side-length color )
( paint-nested-stars ( + from 1 ) to unit color )
)
)
)
)
( define ( framed-star side-length color )
( overlay
( star ( - side-length 3 ) "solid" color )
( star side-length "solid" "black" )
)
)


;; Testing


(nested-squares-two 200 14 "blue" "green")
(nested-stars 400 10 "cyan")