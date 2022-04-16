% ---------------------------------------------------------------------------
% File: list_processors.pro
% ---------------------------------------------------------------------------
first([H|_], H).
rest([_|T], T).

last([H|[]], H).

last([_|T], Result) :- 
    last(T, Result).

nth(0, [H|_], H).

nth(N, [_|T], E) :- 
    K is N - 1, nth(K,T,E).

write_list([]).

write_list([H|T]) :-
    write(H),nl,
    write_list(T).

sum([], 0).

sum([Head|Tail],Sum) :-
    sum(Tail,SumOfTail),
    Sum is Head + SumOfTail.

add_first(X,L,[X|L]).
add_last(X,[],[X]).

add_last(X,[H|T], [H|TX]) :- 
    add_last(X,T,TX).

iota(0, []).
iota(N,IotaN) :-
    K is N - 1,
    iota(K,IotaK),
    add_last(N,IotaK,IotaN).

pick(L,Item) :-
    length(L,Length),
    random(0,Length,RN),
    nth(RN,L,Item).

make_set([],[]).
make_set([H|T],TS) :-
    member(H,T),
    make_set(T,TS).

make_set([H|T],[H|TS]) :-
    make_set(T,TS).
    
product([], 1).
product([Head|Tail], Product) :-
    product(Tail,ProductOfTail),
    Product is Head * ProductOfTail.

factorial(N,F) :-
    iota(N,I), product(I,F).

make_list(0,_,[]).
make_list(N,Item,List) :-
    K is N - 1,
    make_list(K,Item,Tail),
    add_last(Item,Tail,List).

but_first([],[]).
but_first([_|X],X).
but_last([], []).
but_last([_], []).
but_last(L,A) :- 
    reverse(L,L1),but_first(L1,L2),reverse(L2,A).

is_palindrome([]) :- true.
is_palindrome([_]) :- true.
is_palindrome(L) :-
    first(L,A),
    last(L,B),
    A == B,
    but_first(L,L1),
    but_last(L1,L2),
    is_palindrome(L2).

adjectives([acidic,available,helpful,upset,beneficial,panoramic]).

nouns([departure,terminator,development,pizza,iphone,goob,ai,system]).

past_tense([fought,distracted,enacted,ran-over,punched,jumped,calculated]).

noun_phrase([the,Adjective,Noun]) :-
    adjectives(A),
    nouns(N),
    pick(A, Adjective),
    pick(N, Noun).

sentence(S) :-
    noun_phrase(NP1),
    noun_phrase(NP2),
    past_tense(PT),
    pick(PT, PastTense),
    append(NP1, [PastTense], S1),
    append(S1, NP2, S).

