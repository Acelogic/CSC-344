
% ---------------------------------------------------------------------------
% File: map_coloring.pro
% Line: Program to find a 4 color map rendering for South American coutries.
% More: The colors used will be purple, blue, green orange.
% More: The standard abbrieviations are used to stand for the countries.
% ---------------------------------------------------------------------------
% different(X,Y) :: X is not equal to Y
different(purple,blue).
different(purple,green).
different(purple,orange).
different(green,blue).
different(green,orange).
different(green,purple).
different(blue,green).
different(blue,orange).
different(blue,purple).
different(orange,blue).
different(orange,green).
different(orange,purple).

% ---------------------------------------------------------------------------
% coloring(RC1, RCX, ...) :: RC1, RCX, ... are the colors used in the map.

coloring(RC1,RC2,RC3,RC4,RC5,RC6,RC7,RC8,RC9,RC10,RC11,RC12,RC13,RC14,RC15,RC16,RC17) :-
    different(RC1,RC2),
    different(RC1,RC3),
    different(RC1,RC4),
    different(RC1,RC5),
    different(RC2,RC3),
    different(RC2,RC5),
    different(RC2,RC6),
    different(RC2,RC7),
    different(RC3,RC8),
    different(RC3,RC9),
    different(RC3,RC4),
    different(RC4,RC10),
    different(RC4,RC11),
    different(RC4,RC5),
    different(RC5,RC12),
    different(RC5,RC13),
    different(RC6,RC7),
    different(RC6,RC14),
    different(RC6,RC13),
    different(RC13,RC14),
    different(RC13,RC12),
    different(RC12,RC17),
    different(RC12,RC11),
    different(RC11,RC17),
    different(RC11,RC10),
    different(RC10,RC16),
    different(RC10,RC9),
    different(RC9,RC16),
    different(RC9,RC8),
    different(RC8,RC15),
    different(RC8,RC7),
    different(RC7,RC15),
    different(RC15,RC14),
    different(RC15,RC16),
    different(RC16,RC17),
    different(RC17,RC14).