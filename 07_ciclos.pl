% cambiando nombe de arclivo en el area de preparasion 

factorial(N):-factorial(N,1,1).   /*paso1, entra un numero N, se inicializa i en 1, y P se inicializa en 1, ESTE ES EL INICIALIZADOR*/
factorial(N,I,P):-I>N,write(P).   /*paso2, este es un alg recursivo, ESTA ES LA CONDICION*/
factorial(N,I,P):-II is I+1,PP is P*I,factorial(N,II,PP).  /*paso3,N >= 1, ESTO ES DENTRO DEL WHILE I =< N,*/

potencia(X,Y):-potencia(X,Y,1,1).
potencia(X,Y,I,P):-I>Y,write(P).
potencia(X,Y,I,P):-II is I+1,PP is P*X,potencia(X,Y,II,PP).

facSuma(N):-facSuma(N,1,0).
facSuma(N,I,AC):-I>N,write(AC).
facSuma(N,I,AC):-NAC is AC+I, II is I+1, facSuma(N,II,NAC).

promediofactorial(N, PRO) :-facSumaPRO(N, Suma),PRO is Suma / N.
facSumaPRO(N,SU):-facSumaPRO(N,1,0,SU).
facSumaPRO(N,I,AC,SU):-I>N,SU=AC.
facSumaPRO(N,I,AC,SU):-NAC is AC+I,II is I+1,facSumaPRO(N,II,NAC,SU).

% modificando archivo para subirlo al github desde el git
