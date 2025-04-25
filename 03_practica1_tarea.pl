/*1. Realizar la formula cuadrática */
cuadratica(A,B,C):-X1 is (-B + sqrt(B**2-4*A*C))/(2*A),X2 is (-B -sqrt(B**2-4*A*C))/(2*A),write(X1),write(X2).

/*  2. Realizar un programa que muestre el menor de 3 números*/
menor(X, Y, Z) :-(X < Y, X < Z, write(X)); (Y < X, Y < Z, write(Y)); (Z < X, Z < Y, write(Z)).


/*3. Realizar un programa que muestre el mayor de 3 números*/
mayor(X, Y, Z) :-(X > Y, X > Z, write(X)); (Y > X, Y > Z, write(Y)); (Z > X, Z > Y, write(Z)).


/*4. Realizar un programa que lea 2 fracciones: N1,D1 y N2, D2 y permita mostrar la suma de dichas fracciones*/
sumaf(N1,D1, N2, D2):- X is ((N1*D2)+(D1*N2))/(D1*D2),write(X).