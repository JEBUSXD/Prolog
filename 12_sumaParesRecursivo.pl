sumapar(N,S) :- sumapar(N, 1, 0, SU).
sumapar(N, I, AC, SU) :-I > N, 	write(AC).
sumapar(N, I, AC, SU) :-
    write('Ingrese un numero: '),
    read(X),
    0 is X mod 2, NuevoAC is AC + X ; NuevoAC is AC,
    II is I + 1,
    sumapar(N, II, NuevoAC, SU).