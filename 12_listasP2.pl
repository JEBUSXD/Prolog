									%compilar con
insertarUlt([],X,[X]).							%insertarUlt([2,9,3],5,L1).
insertarUlt([Y | L1], X, [Y|L2]):- insertarUlt(L1,[X],L2).
									
insertarLugar([],X,[X]).						%insertarLugar([10,20,30],25,L1).
insertarLugar([Y|L1],X,[X,Y|L1]):-X=<Y,!.
insertarLugar([Y|L1],X,[Y|L2]):- insertarLugar(L1,X,L2).
									%intercalar([6,8],[2,1],L).
intercalar([],L,L).							%intercalar([6,8],[1,2,3,4,5],L).
intercalar(L,[],L).							%intercalar([6,8,4,2],[1],L).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

insertarIesimo([],X,1,[X]).						%insertarIesimo([50,10,90,40],70,3,L).
insertarIesimo([X|L1],E,I,[E,X|L1]):-I=:=1 .				%(insertar en posicion)
insertarIesimo([X|L1],E,I,[X|L2]):-insertarIesimo(L1,E,I-1,L2).

eliminarIesimo([X|L1],I,[L1]):-I=:=1 .					%eliminarIesimo([50,10,90,40],3,L).
eliminarIesimo([X|L1],I,[X|L2]):-eliminarIesimo(L1,I-1,L2).

concatenar([], L, L).							%concatenar([2,4],[1,3,5],L).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).

numMayor([X], X).							%
numMayor([X,Y|Rest], Max):-
    numMayor([Y|Rest], MaxRest),
    (X>=MaxRest->Max=X;Max=MaxRest).