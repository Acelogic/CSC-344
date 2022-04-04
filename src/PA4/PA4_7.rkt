#lang racket
(require 2htdp/image)
;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 7: The Diamond


;; Helper Functions
;;----------------------------------------------------------------
;; From Task 6 
(define (generate-list num fn)
  (cond
    ((= 1 num) (make-list 1 (fn)))
    (else
     (append (make-list 1 (fn)) (generate-list (- num 1) fn))
     )
    )
  )

(define (sort-diamonds d)
  (sort d #:key image-width <)
  )

(define (random-color)
  (color (random 256)(random 256)(random 256))
  )

(define (draw-diamond)
  (rotate 45
          (square (+ 21 (random 380)) "solid" (random-color))
          )
  )

(define (diamond-design n)
  (foldr overlay empty-image (sort-diamonds (generate-list n
                                                           draw-diamond)))
  )
