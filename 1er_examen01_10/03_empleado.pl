empleado(juan).
empleado(jesus).
empleado(maria).

departamento(sistemas).
departamento(marketing).

trabaja(juan, sistemas).
trabaja(jesus, sistemas).
trabaja(maria, marketing).


mismotrabajo(E1,E2,D):-empleado(E1),empleado(E2),trabaja(E1, D),trabaja(E2,D).

nocompanerostrabajo(E1,E2,D):-empleado(E1),empleado(E2),not((trabaja(E1, D),trabaja(E2,D))).

departamentonombre(E,D):-empleado(E),trabaja(E,D).







