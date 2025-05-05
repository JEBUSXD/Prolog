/*para hacer la condicion if
( Condición -> Acción ; Alternativa )
*/

sumapar(N, S) :- sumapar(N, 1, 0, S).
sumapar(N, I, AC, S) :- I > N, S is AC.
sumapar(N, I, AC, S) :-
    write('Ingrese un numero: '),
    read(X),
    (0 is X mod 2 -> NuevoAC is AC + X ; NuevoAC = AC),
    II is I + 1,
    sumapar(N, II, NuevoAC, S).