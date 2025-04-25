cuadrado:-write('Ingrese numero:'),read(N),C is N*N,write(C).
cuarado(N):-C is N*N,write(C).

suma:-read(X),read(Y),C is X+Y,write(C).
suma(X,Y,S):-S is X+Y.
suma(X,Y):-S is X+Y,write(S).
resta(X, Y) :- R is X - Y,write(R).
mul(X, Y) :- M is X * Y,write(M).
div(X, Y) :- D is X / Y,write(D).

pitagoras(A,B):-C is sqrt(A**2 + B**2),write(C).
pitagoras(A,B,C):-C is sqrt(A**2 + B**2).
pitagoras:-read(A),read(B),C is sqrt(A**2 + B**2),write(C).

distancia(X1,Y1,X2,Y2):-D is sqrt((X2-X1)**2 + (Y2-Y1)**2),write(D).
cuadratica(A,B,C):-X1 is (-B + sqrt(B**2-4*A*C))/(2*A),X2 is (-B -sqrt(B**2-4*A*C))/(2*A),write(X1),write(X2).
cuadratica2(A,B,C):-X is (-B+sqrt((B*B)-(4*A*C)))/(2*A), Y is (-B-sqrt((B*B)-(4*A*C)))/(2*A),write('X1='),writeln(X),write(Y).

