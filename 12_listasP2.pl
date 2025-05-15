insertarUlt([],X,[X]).
insertarUlt([Y | L1], X, [Y|L2]):- insertarUlt(L1,[X],L2).

insertarLugar([],X,[X]).
insertarLugar([Y|L1],X,[X,Y|L1]):-X=<Y,!.
insertarLugar([Y|L1],X,[Y|L2]):- insertarLugar(L1,X,L2).

insertarIesimo([],X,1,[X]).
insertarIesimo([X|L1],E,I,[E,X|L1]):-I=:=1 .
insertarIesimo([X|L1],E,I,[X|L2]):-insertarIesimo(L1,E,I-1,L2).

eliminarIesimo([X|L1],I,[L1]):-I=:=1 .
eliminarIesimo([X|L1],I,[X|L2]):-eliminarIesimo(L1,I-1,L2).













/*intercalar([],L,L).
intercalar(L,[],L).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-contanar(L1,L2,L3).*/
