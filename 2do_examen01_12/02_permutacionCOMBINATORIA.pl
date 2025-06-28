factorial(N, F) :- factorial(N, 1, 1, F).
factorial(N, I, P, P) :- I > N.
factorial(N, I, P, F) :-I =< N,II is I + 1,PP is P * I,factorial(N, II, PP, F).

calcular_perm(NAtom, RAtom, Resultado) :-
    atom_number(NAtom, N),
    atom_number(RAtom, R),
    permutacion(N, R, P),
    send(Resultado, selection, P).
permutacion(N, R, P) :- N >= R,
    factorial(N, FN),
    NR is N - R,
    factorial(NR, FNR),
    P is FN // FNR.
calcular_comb(NAtom, RAtom, Resultado) :-
    atom_number(NAtom, N),
    atom_number(RAtom, R),
    combinatoria(N, R, C),
    send(Resultado, selection, C).
combinatoria(N, R, C) :-
    N >= R,
    factorial(N, FN),
    factorial(R, FR),
    NR is N - R,
    factorial(NR, FNR),
    C is FN // (FR * FNR).
:- use_module(library(pce)).
inicio :-
    new(Ventana, dialog('formulas de estadisticas')),
    new(Etiqueta, label(nombre, 'Elija entre las dos opciones\n permutacion: nPr=n! / (n-r)! \ncombinatoria: nCr=n! / r!(n-r)!')),
    new(Salir, button('Salir', message(Ventana, destroy))),
    new(Numero1, text_item('Ingrese N:')),
    new(Numero2, text_item('Ingrese R:')),
    new(Resultado1, text_item('Resultado:')),
    new(BotonPerm, button('Permutacion', message(@prolog, 
			calcular_perm, Numero1?selection, Numero2?selection, Resultado1))),
    new(BotonComb, button('Combinatoria',message(@prolog, 
			calcular_comb, Numero1?selection, Numero2?selection, Resultado1))),
    send(Ventana, append, Etiqueta),
    send(Ventana, append, Numero1),
    send(Ventana, append, Numero2),
    send(Ventana, append, Resultado1),
    send(Ventana, append, BotonPerm),
    send(Ventana, append, BotonComb),
    send(Ventana, append, Salir),
    send(Ventana, open).
:-inicio.