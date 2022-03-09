#lang racket

(require 2htdp/image)
(require racket/trace)
;---------
; Programming Assignment 3: Little Color Interpreter

;; Task 3a: Establishing the Sampler code from Lesson 6 (Sampler.rkt)
( define ( sampler )
   ( display "(?): " )
   ( define the-list ( read ) )
   ( define the-element
      ( list-ref the-list ( random ( length the-list ) ) )
      )
   ( display the-element ) ( display "\n" )
   ( sampler )
   )


;; Task 3b: Color Thing Interpreter


( define ( color-thing )
   ( display "(?): " )
   ( define input ( read ) )
   ( define cmd (car input))
   ( define the-list (car (cdr input)))

   (cond
     ((equal? cmd 'random)
      (define result (random (length the-list )))
      (display (rectangle 500 20 "solid" ( list-ref the-list result)))
      (display "\n")
      )
     ((equal? cmd 'all )
      (all the-list)
      )
     (else
      (display (rectangle 500 20 "solid" (list-ref the-list (- cmd 1))))
      (display "\n")
      ) 
     )
   (color-thing)
   )


(define (all color-list)
  (cond
    ((equal? (length color-list) 0)
        (display "")
        )
    (not (empty? color-list)
         (display (rectangle 500 20 "solid" (car color-list)))
         (display "\n")
         (all (cdr color-list))
         )
    )
  )




