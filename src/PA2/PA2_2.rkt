;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )


;; Task 2: Dice 
(define (roll-die)
  (random 1 6)
)

(define (roll-for-1)
  (define roll-store (roll-die))
  (cond
    ((= roll-store 1)
     (display roll-store )
     )
    ((not (= roll-store 1))
     (printf "~a " roll-store)
     (roll-for-1)  
  )
 )
)

;; Make a recursive function to roll for two consecutives 1s then stop
(define (roll-for-11)
  (define roll-store (roll-die))
  (cond
    ((= roll-store 1)
     (display roll-store )
     (roll-for-11)
     )
    ((not (= roll-store 1))
     (printf "~a " roll-store)
     (roll-for-11)  
  )
 )
)



;-----------------------
;; Testing Cases
;-----------------------
(roll-die)
(roll-for-1)
(roll-for-11)




