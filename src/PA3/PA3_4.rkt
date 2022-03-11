#lang racket

(require racket/trace)

;---------
; Programming Assignment 3: Two Card Poker


;; Task 4a 
( define ( ranks rank )
   ( list
     ( list rank 'C )
     ( list rank 'D )
     ( list rank 'H )
     ( list rank 'S )
     )
   )
( define ( deck )
   ( append
     ( ranks 2 )
     ( ranks 3 )
     ( ranks 4 )
     ( ranks 5 )
     ( ranks 6 )
     ( ranks 7 )
     ( ranks 8 )
     ( ranks 9 )
     ( ranks 'X )
     ( ranks 'J )
     ( ranks 'Q )
     ( ranks 'K )
     ( ranks 'A )
     )
   )
( define ( pick-a-card )
   ( define cards ( deck ) )
   ( list-ref cards ( random ( length cards ) ) )
   )
( define ( show card )
   ( display ( rank card ) )
   ( display ( suit card ) )
   )
( define ( rank card )
   ( car card )
   )
( define ( suit card )
   ( cadr card )
   )
( define ( red? card )
   ( or
     ( equal? ( suit card ) 'D )
     ( equal? ( suit card ) 'H )
     )
   )
( define ( black? card )
   ( not ( red? card ) )
   )
( define ( aces? card1 card2 )
   ( and
     ( equal? ( rank card1 ) 'A )
     ( equal? ( rank card2 ) 'A )
     )
   )


;; Task 4b: Two Card Poker Classifier, IR Version

(define (pick-two-cards)
  (define card1 (pick-a-card))
  (define card2 (pick-a-card))
  (cond
    [(equal? card1 card2)
     (pick-two-cards)]
    (else
     (cons (pick-a-card) (cons (pick-a-card) '()))
     ))
  )


(define (index-rank card)
  (define card-rank (rank card))
  (cond
    [(number? card-rank) card-rank]
    [else (face-ranker card-rank)])
  )

(define (face-ranker card-rank)
  (cond
    [(eq? 'X card-rank) 10]
    [(eq? 'J card-rank) 11]
    [(eq? 'Q card-rank) 12]
    [(eq? 'K card-rank) 13]
    [(eq? 'A card-rank) 14]
    [else 0]))

(define (card-name card)
  (cond
    [(equal? 1 card) "One"]
    [(equal? 2 card) "Two"]
    [(equal? 3 card) "Three"]
    [(equal? 4 card) "Four"]
    [(equal? 5 card) "Five"]
    [(equal? 6 card) "Six"]
    [(equal? 7 card) "Seven"]
    [(equal? 8 card) "Eight"]
    [(equal? 9 card) "Nine"]
    [(equal? 'X card) "Ten"]
    [(equal? 'J card) "Jack"]
    [(equal? 'Q card) "Queen"]
    [(equal? 'K card) "King"]
    [(equal? 'A card) "Ace"]
    )
  )

;; Display the higher rank card
(define (higher-rank card1 card2)
  (define card1-rank (index-rank card1))
  (define card2-rank (index-rank card2))

  (cond
    [(< card1-rank card2-rank) display (rank card2)]
    [(> card1-rank card2-rank) display (rank card1)]
    )
  )

(trace higher-rank)


;; Classify-two-cards-ur
( define ( classify-two-cards-ur card-pair )

   ( define card1 ( car card-pair ) )
   ( define card2 ( cadr card-pair ) )
   ( define card1-rank (index-rank card1))
   ( define card2-rank (index-rank card2))
   ( define card1-suit (suit card1))
   ( define card2-suit (suit card2))
   ( define high ( higher-rank card1 card2 ) )
   ( display card-pair )
   ( display ": " )
   ( cond
      ( ( equal? card1-suit card2-suit )
        ( cond
           ( ( or
               ( = 1 ( - card1-rank card2-rank))
               ( = 1 ( - card2-rank card1-rank)))
             ( display high ( display " High Straight Flush " ) ) )
           ( else
             ( display high ) ( display " High Flush " ) ) ) )
      ( else
        ( cond
           ( ( or
               ( = 1 ( - card1-rank card2-rank))
               ( = 1 ( - card2-rank card1-rank))
               ( display high ) ( display " High Straight " ) ) )
           ( else
             ( cond
                ( ( equal? ( car card1 ) ( car card2 ) )
                  ( display " Pair of " ) ( display ( car card1 ) ) ( display "'s" ) )
                ( else
                  ( display high ) ( display " High " ) ) ) ) ) ) )

 )

  

(trace higher-rank)


;; Classify-two-cards
(define (classify-two-cards card-pair)
   ( define card1 ( car card-pair ) )
   ( define card2 ( cadr card-pair ) )
   ( define card1-rank (index-rank card1))
   ( define card2-rank (index-rank card2))
   ( define card1-suit (suit card1))
   ( define card2-suit (suit card2))
   ( define higher ( higher-rank card1 card2 ) )
   ( define higher-name (card-name higher))
   ( display card-pair )( display ": " )
   ( cond
      ( ( equal? card1-suit card2-suit )
        ( cond
           ( ( or
               ( = 1 ( - card1-rank card2-rank))
               ( = 1 ( - card2-rank card1-rank)))
             (classify-two-cards (pick-two-cards))( display higher-name ( display " High Straight Flush " ) ) )
           ( else
             ( display higher-name ) ( display " High Flush " ) ) ) )
      ( else
        ( cond
           ( ( or
               ( = 1 ( - card1-rank card2-rank))
               ( = 1 ( - card2-rank card1-rank))
               ( display higher-name ) ( display " High Straight " ) ) )
           ( else
             ( cond
                ( ( equal? ( car card1 ) ( car card2 ) )
                  ( display " Pair of " ) ( display higher-name ) ( display "'s" ) )
                ( else
                  ( display higher-name ) ( display " High " ) ) ) ) ) ) ) 

)
    

