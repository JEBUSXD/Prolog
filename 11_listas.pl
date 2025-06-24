/*para crear listas es con [],pero se creara como lista vacia, tenemos esta lista 
L1=[2,9,6,8,4]
   [X      |L]
'X' es la Cabeza de la lista, 'L' es cola de la lista
X=2
L=[9,6,8,4]*/
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
/*tarea sumar toda la  lista*/
sumaL([X],X):-!.
sumaL([X,Y|SU],Total):-
    Sum is X + Y,
    sumaL([Sum|SU], Total).

%mayor numero 

%otra forma por el ing 
sumaLista([], 0).
sumaLista([X|L], Y):-
	sumaLista(L, Z), 
	Y is X+Z.