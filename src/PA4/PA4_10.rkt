#lang racket
(require 2htdp/image)
;---------
; Programming Assignment 4: Recursive List Processing and Higher Order Functions

;; Task 10: Blood Preassure Trend Visualizer

(define (flip-coin)
  (define outcome (random 2))
  (cond
    ((= outcome 1)
     'h
     )
    (( = outcome 0)
     't
     )
    )
  )

(define (count t l)
  (cond
    ((empty? l) 0)
    ((eq? t (car l))
     (+ 1 (count t (cdr l))))
    (else
     (count t (cdr l)))
    )
  )

(define (flip-for-offset n)
  (define options '(t h))
  (define flips (generate-list n flip-coin))
  (define totals (map (lambda (x) (count x flips)) options))
  (foldr - (car totals) (cdr totals))
  )

(define (generate-list num fn)
  (cond
    ((= 1 num) (make-list 1 (fn)))
    (else
     (append (make-list 1 (fn)) (generate-list (- num 1) fn))
     )
    )
  )

(define (sample cardio-index)
  (+ cardio-index (flip-for-offset (quotient cardio-index 2)))
  )

(define (data-for-one-day middle-base)
  (list
   (sample (+ middle-base 20))
   (sample (- middle-base 20))
   )
  )

(define (data-for-one-week middle-base)
  (generate-list
   7
   (lambda () (data-for-one-day middle-base))
   )
  )

(define (generate-data base-sequence)
  (map data-for-one-week base-sequence)
  )

(define (one-day-visualization lst)
  (cond
    ((and (<= 120 (car lst))(<= 80 (cadr lst)))
     (circle 10 "solid" "red")
     )
    ((and (<= 120 (car lst))(> 80 (cadr lst)))
     (circle 10 "solid" "gold")
     )
    ((and (> 120 (car lst))(<= 80 (cadr lst)))
     (circle 10 "solid" "orange")
     )
    (else
     (circle 10 "solid" "blue")
     )
    )
  )

(define (one-week-visualization lst)
  (define dots (map one-day-visualization lst))
  dots
  )

(define (bp-visualization lst)
  (define dots (map one-week-visualization lst))
  (display-dots dots)
  )

(define (display-dots lst)
  (cond
    ((empty? lst)
     (display empty-image)
     )
    (else
     (display (car lst))
     (display "\n")
     (display-dots (cdr lst))
     )
    )
  )


