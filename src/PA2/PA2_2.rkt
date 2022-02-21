;---------
; Programming Assignment 2: Racket Functions and Recursion

#lang racket
( require 2htdp/image )


;; Task 2: Dice (Done)

;; Roll Die
(define (roll-die)
  (random 1 6)
  )

;; Roll for 1
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
( define ( roll-for-11)
   (roll-for-1)
   ( define roll-store (roll-die)) 
   (cond
     ((= roll-store 1) 
      ( display roll-store ) ( display " ")
      )
     (not (= roll-store 1) 
          (display roll-store) ( display " ")
          (roll-for-11)
          )
     )
   )



;; Roll for an odd value
(define (roll-for-odd)
  (define roll-store ( roll-die))
  (cond
    ( (or (= roll-store 1) (= roll-store 3) (= roll-store 5)) ;if odd
      (display roll-store) (display " ")
      )
    ( (or (= roll-store 2)(= roll-store 4) (= roll-store 6 ));if even
      (display roll-store) (display " ")
      (roll-for-odd)
      )
    )
  )



;; Roll for an even value
(define( roll-for-even)
  (define roll-store ( roll-die))
  (cond
    ((or (= roll-store 2) (= roll-store 4) (= roll-store 6 )); if even
     (display roll-store ) ( display " ")
     )
    ((or (= roll-store 1) (= roll-store 3) (= roll-store 5)) ;if odd
     (display roll-store) (display " ")
     (roll-for-even)
     )
    )
  )

;; Simulates rolls for consecutive odd-even-odd values
(define ( roll-for-odd-even-odd)
  (roll-for-odd)
  (roll-for-even)
  (define roll-store (roll-die))
  (cond
    ;;ODD
    ((or(= roll-store 1 ) (= roll-store 3) (= roll-store 5)) 
    (display roll-store) (display " ")
    )
  ;;EVEN
  ((or (= roll-store 2) (= roll-store 4) (= roll-store 6)) 
  (display roll-store) (display " ")
  (roll-for-odd-even-odd)
   )
  )
)



; roll 2 dice until sum of 7 or 11 or a double turns up
( define ( roll-two-dice-for-a-lucky-pair)
   (define roll-store-one ( roll-die))
   (define roll-store-two (roll-die))
   (define sum (+ roll-store-one roll-store-two))
   (cond
     ((or (= 7 sum) ( = 11 sum) (= roll-store-one roll-store-two))
     ( display " (" ) (display roll-store-one) (display " ")
     (display roll-store-two) (display ") ") (display " ")
     )
   (else 
    (display "(") ( display roll-store-one) (display " ")
    (display roll-store-two) (display ") ") (display " ")
    (roll-two-dice-for-a-lucky-pair)
    )
   )
)





;-----------------------
;; Testing Cases
;-----------------------
;(roll-die)
;(roll-for-1)
;(roll-for-11)
;(roll-for-odd-even-odd)
(roll-two-dice-for-a-lucky-pair)








