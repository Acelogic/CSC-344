% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: pokemon.pro
% --- Line: Just a few facts about pokemon
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- cen(P) :: Pokemon P was "creatio ex nihilo"

cen(pikachu).
cen(bulbasaur).
cen(caterpie).
cen(charmander).
cen(vulpix).
cen(poliwag).
cen(squirtle).
cen(staryu).

% -----------------------------------------------------------------------
% --- evolves(P,Q) :: Pokemon P directly evolves to pokemon Q

evolves(pikachu,raichu).
evolves(bulbasaur,ivysaur).
evolves(ivysaur,venusaur).
evolves(caterpie,metapod).
evolves(metapod,butterfree).
evolves(charmander,charmeleon).
evolves(charmeleon,charizard).
evolves(vulpix,ninetails).
evolves(poliwag,poliwhirl).
evolves(poliwhirl,poliwrath).
evolves(squirtle,wartortle).
evolves(wartortle,blastoise).
evolves(staryu,starmie).

% -----------------------------------------------------------------------
% --- pokemon(name(N),T,hp(H),attach(A,D)) :: There is a pokemon with
% --- name N, type T, hit point value H, and attach named A that does
% --- damage D.

pokemon(name(pikachu), electric, hp(60), attack(gnaw, 10)).
pokemon(name(raichu), electric, hp(90), attack(thunder-shock, 90)).

pokemon(name(bulbasaur), grass, hp(40), attack(leech-seed, 20)).
pokemon(name(ivysaur), grass, hp(60), attack(vine-whip, 30)).
pokemon(name(venusaur), grass, hp(140), attack(poison-powder, 70)).

pokemon(name(caterpie), grass, hp(50), attack(gnaw, 20)).
pokemon(name(metapod), grass, hp(70), attack(stun-spore, 20)).
pokemon(name(butterfree), grass, hp(130), attack(whirlwind, 80)).

pokemon(name(charmander), fire, hp(50), attack(scratch, 10)).
pokemon(name(charmeleon), fire, hp(80), attack(slash, 50)).
pokemon(name(charizard), fire, hp(170), attack(royal-blaze, 100)).

pokemon(name(vulpix), fire, hp(60), attack(confuse-ray, 20)).
pokemon(name(ninetails), fire, hp(100), attack(fire-blast, 120)).

pokemon(name(poliwag), water, hp(60), attack(water-gun, 30)).
pokemon(name(poliwhirl), water, hp(80), attack(amnesia, 30)).
pokemon(name(poliwrath), water, hp(140), attack(dashing-punch, 50)).

pokemon(name(squirtle), water, hp(40), attack(bubble, 10)).
pokemon(name(wartortle), water, hp(80), attack(waterfall, 60)).
pokemon(name(blastoise), water, hp(140), attack(hydro-pump, 60)).

pokemon(name(staryu), water, hp(40), attack(slap, 20)).
pokemon(name(starmie), water, hp(60), attack(star-freeze, 20)).


% -----------------------------------------------------------------------
% ---  Extra Functions Added

display_names :-
    pokemon(name(N),_,_,_),
    write(N),
    nl,
    fail.

display_attacks :- 
    pokemon(_,_,_,attack(N,_)),
    write(N),
    nl,
    fail.

powerful(Name) :-
    pokemon(name(Name),_,_,attack(_,P)), P > 55.

tough(P) :- 
    pokemon(name(P),_,hp(H),_), H > 100.

type(Name,Type) :- 
    pokemon(name(Name),Type,_,_).

dump_kind(Type) :- 
    pokemon(name(N),Type,H,A),
    write(pokemon(name(N),Type,H,A)),
    nl,
    fail.

display_cen :- cen(N),
    write(N),
    nl,
    fail.

family(N) :- 
    cen(N),
    evolves(N,X),
    evolves(X,Y),
    write(N),
    write(' '),
    write(X),
    write(' '),
    write(Y).

family(N) :- 
    cen(N),
    evolves(N,X),
    \+evolves(X,_),
    write(N),
    write(' '),
    write(X).

families :- 
    cen(N),
    family(N),
    nl,
    fail.

lineage(N) :-
    evolves(N,X),
    evolves(X,Y),
    pokemon(name(N),TN,HN,AN),
    pokemon(name(X),TX,HX,AX),
    pokemon(name(Y),TY,HY,AY),
    write(pokemon(name(N),TN,HN,AN)),
    nl,
    write(pokemon(name(X),TX,HX,AX)),
    nl,
    write(pokemon(name(Y),TY,HY,AY)).


lineage(N) :-
    evolves(N,X),
    pokemon(name(N),TN,HN,AN),
    pokemon(name(X),TX,HX,AX),
    write(pokemon(name(N),TN,HN,AN)),nl,write(pokemon(name(X),TX,HX,AX)).

lineage(N) :-
    pokemon(name(N),TN,HN,AN),
    write(pokemon(name(N),TN,HN,AN)).

