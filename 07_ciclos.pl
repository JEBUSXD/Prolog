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

mayorN(N, M) :- mayorN(N, 1, 0, M).
mayorN(N, I, AC, M) :-I > N, M is AC.
mayorN(N, I, AC, M) :-
	write('Ingrese un numero: '),
    	read(X),
    	(X > AC -> NuevoAC = X ; NuevoAC = AC),
    	II is I + 1,
    	mayorN(N, II, NuevoAC, M).

promedio_aprobadas(N, Prom) :- promedio_aprobadas(N, 1, 0, 0, Prom).
promedio_aprobadas(N, I, Suma, Conteo, Prom) :-I > N,
    (Conteo =:= 0 -> Prom = 0 ; Prom is Suma / Conteo).
promedio_aprobadas(N, I, Suma, Conteo, Prom) :-
    write('Ingrese nota: '),
    read(X),
    (X >= 51 ->NuevoSuma is Suma + X,NuevoConteo is Conteo + 1; NuevoSuma = Suma,NuevoConteo = Conteo),
    II is I + 1,
    promedio_aprobadas(N, II, NuevoSuma, NuevoConteo, Prom).

suma_fibo(N, Suma):-suma_fibo(N, 1, 1, 1, 0, Suma).
suma_fibo(N, I, _, _, AC, Suma) :-I > N,Suma is AC.
suma_fibo(N, I, A, B, AC, Suma) :-
    NuevoAC is AC + A,
    SiguienteFib is A + B,
    II is I + 1,
    suma_fibo(N, II, B, SiguienteFib, NuevoAC, Suma).