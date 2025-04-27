alumno(francisco).
alumno(juan).
alumno(adrian).
alumno(benjamin).

docente(edwin).
docente(josemanuel).

materia(prolog).
materia(criptografia).
materia(estructuras1).

dicta(edwin, prolog).
dicta(edwin, criptografia).
dicta(josemanuel, estructuras1).
dicta(edwin, estructuras1).

pasa(francisco, prolog).
pasa(juan, prolog).
pasa(adrian, prolog).
pasa(benjamin, estructuras1).
pasa(adrian, estructuras1).
/*========================TAREAS========================*/
dictamateria(D, M):-docente(D), materia(M), dicta(D, M).
pasamateria(A, M):-alumno(A), materia(M), pasa(A, M).
companeros(A1,A2,M):-alumno(A1),alumno(A2),pasamateria(A2, M),pasamateria(A2, M).     	%(otra forma seria)materia(M),pasa(A1,M),pasa(A2,M).
docenteMateria(A,D,M):-pasamateria(A, M),dictamateria(D, M).
dictalomismo(D1,D2,M):-docente(D1),docente(D2),materia(M),dictamateria(D1, M),dictamateria(D2, M).
nocompaneros(A1,A2):-alumno(A1), alumno(A2), not((pasamateria(A1, M), pasamateria(A2, M))).
