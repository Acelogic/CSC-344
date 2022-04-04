#lang racket
(require 2htdp/image)
;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 8: Chromesthetic Renderings

;; Helper Functions
;;----------------------------------------------------------------
;; From Task 3
(define (a-list list_a list_b)
  (cond
    ((empty? list_a) '())
    (else
     (cons (cons (car list_a) (car list_b)) (a-list (cdr list_a)
                                                    (cdr list_b)))
     )
    )
  )

;; From Task 4
(define (assoc obj list)
  (cond
    ((empty? list) '())
    ((eq? (car (car list)) obj)
     (car list)
     )
    (else
     (assoc obj (cdr list))
     )
    )
  )


;Given auxiliary definitions
;---------------------------
(define pitch-classes '(c d e f g a b))
(define color-names '(blue green brown purple red yellow
                           orange))
(define (box color)
  (overlay
   (square 30 "solid" color)
   (square 35 "solid" "black")
   )
  )
(define boxes
  (list
   (box "blue")
   (box "green")
   (box "brown")
   (box "purple")
   (box "red")
   (box "gold")
   (box "orange")
   )
  )
(define pc-a-list (a-list pitch-classes color-names))
(define cb-a-list ( a-list color-names boxes ) )
(define (pc->color pc)
  (cdr (assoc pc pc-a-list))
  )
(define (color->box color)
  (cdr (assoc color cb-a-list))
  )
;Function that reads in a series of letter representing notes
;and displays corresponding colored boxes
;------------------------------------------------------------
(define (play lst)
  (define colors (map pc->color lst))
  (define squares (map color->box colors))
  (foldr beside empty-image squares)
  )
