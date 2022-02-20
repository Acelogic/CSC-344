;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )
;; Task 3: Number Sequences (Done)

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

;; write a function called triangular taking one positive integer as its sole parameter which returns the triangular number corresponding to the given value
(define (triangular n)
   (cond
      ( ( = n 1 )
        1
)
      ( else
        ( + (triangular ( - n 1 )) n )
        )
      )
)


(define sigma
  (lambda (n)
    ((lambda (y) (y y n (lambda (s) s)))
     (lambda (s i ret)
       (if (zero? i)
           (ret 0)
           (s s (- i 1)
              (if (zero? (remainder n i))
                  (lambda (x)
                    (ret (+ i x)))
                  ret)
              )
           )
       )
     )
    )
  )

;-----------------------
;; Testing Cases
;-----------------------

(triangular 1)
(triangular 2)
(triangular 3)
(triangular 4)
(triangular 5)
(sequence triangular 20)

(sigma 1)
(sigma 2)
(sigma 3)
(sigma 4)
(sigma 5)
(sequence sigma 20)

