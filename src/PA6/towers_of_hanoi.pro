% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: towers_of_hanoi.pro
% --- Line: Program to solve the Towers of Hanoi problem
% -----------------------------------------------------------------------
:- consult(’inspector.pro’).
% -----------------------------------------------------------------------
% --- make_move(S,T,SSO) :: Make a move from state S to state T by SSO

make_move(TowersBeforeMove,TowersAfterMove,m12) :-
    m12(TowersBeforeMove,TowersAfterMove).
make_move(TowersBeforeMove,TowersAfterMove,m13) :-
    m13(TowersBeforeMove,TowersAfterMove).
make_move(TowersBeforeMove,TowersAfterMove,m21) :-
    m21(TowersBeforeMove,TowersAfterMove).
make_move(TowersBeforeMove,TowersAfterMove,m23) :-
    m23(TowersBeforeMove,TowersAfterMove).
make_move(TowersBeforeMove,TowersAfterMove,m31) :-
    m31(TowersBeforeMove,TowersAfterMove).
make_move(TowersBeforeMove,TowersAfterMove,m32) :-
    m32(TowersBeforeMove,TowersAfterMove).

% <<redacted: the six state space operators>>
% -----------------------------------------------------------------------
% --- valid_state(S) :: S is a valid state
%<<redacted: valid_state>>
% -----------------------------------------------------------------------
% --- solve(Start,Solution) :: succeeds if Solution represents a path
% --- from the start state to the goal state.
solve :-
    extend_path([[[s,m,l],[],[]]],[],Solution),
    write_solution(Solution).

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    PathSoFar = [[[],[],[s,m,l]]|_],
    showr(’PathSoFar’,PathSoFar),
    showr(’SolutionSoFar’,SolutionSoFar),
    Solution = SolutionSoFar.

extend_path(PathSoFar,SolutionSoFar,Solution) :-
PathSoFar = [CurrentState|_],
    showr(’PathSoFar’,PathSoFar),
    make_move(CurrentState,NextState,Move),
    show(’Move’,Move),
    show(’NextState’,NextState),
    not(member(NextState,PathSoFar)),
    valid_state(NextState),
    Path = [NextState|PathSoFar],
    Soln = [Move|SolutionSoFar],
    extend_path(Path,Soln,Solution).
% -----------------------------------------------------------------------
% --- write_sequence_reversed(S) :: Write the sequence, given by S,
% --- expanding the tokens into meaningful strings.
write_solution(S) :-
    nl, write(’Solution ...’), nl, nl,
    reverse(S,R),
    write_sequence(R),nl.

%<<redacted: write_sequence>>
% -----------------------------------------------------------------------
% --- Unit test programs
%<<redacted: the unit test programs>>



m12([Tower1Before,Tower2Before,Tower3],[Tower1After,Tower2After,Tower3]):-
Tower1Before =[H|T],
Tower1After = T,
Tower2Before = L,
Tower2After = [H|L].