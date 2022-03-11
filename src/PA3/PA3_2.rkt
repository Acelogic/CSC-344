#lang racket

;---------
; Programming Assignment 3: Lambda and Basic Lisp

;; Task 2: List Processing References and Constructors

( define languages '(racket prolog haskell rust))

( quote languages)

( car languages)

( cdr languages)

( car ( cdr languages))

( cdr ( cdr languages))

(cadr languages)

(cddr languages)

(first languages)

(second languages)

(third languages)

(list-ref languages 2)

(define numbers '(1 2 3))
(define letters '(a b c))
(cons numbers letters)

( list numbers letters)

( append numbers letters )

( define animals '(ant bat cat dot eel) )
( car ( cdr ( cdr ( cdr animals ) ) ) )

( cadddr animals )

( list-ref animals 3 )

( define a 'apple )
( define b 'peach )
( define c 'cherry )
( cons b ( cons c ' () ) )

( list a b c )

( define x '(one fish))
( define y '(two fish))
( cons ( car x) ( cons ( car ( cdr x ) ) y ) )

( append x y )

          
