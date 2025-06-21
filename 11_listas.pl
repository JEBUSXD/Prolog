								%compilar con
cantidad([],0).							%cantidad([2,3,4],C).
cantidad([_|L1],C):- cantidad(L1,C1), C is C1 + 1.
								%seEncuentra([2,5,9],9).
seEncuentra([X|_],X):-!.
seEncuentra([_|L1],X):-seEncuentra(L1,X).
								%ultimo([2,5,9],X).
ultimo([X],X):-!.
ultimo([_|L1],X):-ultimo(L1,X).
								%iguales([4,4,4]).
iguales([_]):-!.
iguales([X,X|L1]):-iguales([X|L1]).
								%sumaL([2,5,9],X).
/*tarea sumar toda la  lista verificar si dos listas son iguales*/
sumaL([X],X):-!.
sumaL([X,Y|SU],Total):-
    Sum is X + Y,sumaL([Sum|SU], Total).
