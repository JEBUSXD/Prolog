menor(X,Y):-X<Y.
menorigual(X,Y):-X<Y;X==Y.
diferente(X,Y):-X=\=Y.
mayorigual(X,Y):-X>=Y.

igual(A,B):-A==B.
dif(A,B):-not(igual(A,B)).
par(A):-0 is A mod 2.
impar(A):-not(par(A)).

% Operadores aritmeticos
producto(A,B):-P is A*B, write(P).
divisionEntera(A,B):-D is A//B,write(D).
modulo(A,B):-M is A mod B,write(M).
potencia(A,B):-P is A**B,write(P).

elmayor(X,Y):-X>Y,write(X);Y>X,write(Y).
elmenor(X,Y):-X<Y,write(X);Y<X,write(Y).

