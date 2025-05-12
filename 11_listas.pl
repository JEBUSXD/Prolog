cantidad([],0).
cantidad([_|L1],C):- cantidad(L1,C1), C is C1 + 1.

seEncuentra([X|_],X):-!.
seEncuentra([_|L1],X):-seEncuentra(L1,X).

ultimo([X],X):-!.
ultimo([_|L1],X):-ultimo(L1,X).

iguales([_]):-!.
iguales([X,X|L1]):-iguales([X|L1]).

/*sumar toda la  lista verificar si dos listas son iguales*/
sumaL([X],X):-!.
sumaL([X,Y|SU],Total):-
    Sum is X + Y,sumaL([Sum|SU], Total).
