hombre(juan). 
hombre(jorge).
hombre(jose).
hombre(pedro).
hombre(luis).
hombre(carlos).
hombre(angel).
hombre(armando).
hombre(eduardo).
hombre(daniel).
hombre(marco).
hombre(rafael).
hombre(ivan).
hombre(martin).
hombre(antonio).
hombre(alfredo).
hombre(mauricio).
hombre(adhemar).
hombre(bladimir).
hombre(reinaldo).

mujer(maria).
mujer(lucia).
mujer(carla).
mujer(liliana).
mujer(carmen).
mujer(luisa).
mujer(dolly).
mujer(silvana).
mujer(silvia).
mujer(lourdez).
mujer(emilene).
mujer(yessica).
mujer(yenny).
mujer(santa).
mujer(nelva).
mujer(amparo).
mujer(fermina).
mujer(basilia).
mujer(martha).
mujer(paola).


matr(juan,maria).
matr(jorge,liliana).
matr(jose,carla).
matr(pedro,liliana).
matr(luis,carmen).
matr(carlos,luisa).
matr(angel,dolly).
matr(armando,silvana).
matr(eduardo,silvia).
matr(daniel,lourdes).
matr(marco,emilene).
matr(rafael,yessica).
matr(ivan,yenny).
matr(martin,santa).
matr(antonio,nelva).

madre(maria,lucia).
madre(maria,bladimir).
madre(lucia,carla).
madre(Lucia,reinaldo).
madre(liliana,carmen).
madre(liliana,luisa).
madre(carmen,jose).
madre(luisa,basilia).
madre(luisa,adhemar).
madre(basilia,emilene).
madre(yenny,nelva).
madre(nelva,rafael).



padre(jorge,reinaldo).
padre(jorge,yessica).
padre(martin,adhemar).
padre(martin,lourdes).
padre(alfredo,ivan).
padre(alfredo,emilene).
padre(marco,dolly).
padre(armando,paola).
padre(armando,daniel).
padre(pedro,ivan).
padre(pedro,amparo).
padre(angel,luis).
padre(daniel,dolly).


divorcio(jorge,liliana).
divorcio(jose,carla).
divorcio(pedro,liliana).
divorcio(luis,carmen).
divorcio(carlos,luisa).
divorcio(angel,dolly).
divorcio(armando,silvana).
divorcio(eduardo,silvia).
divorcio(daniel,lourdes).
divorcio(marco,emilene).

nuera(X, Y):-matr(X, Z), madre(Y,Z).

hermano(X,Y):-padre(Z,Y),padre(Z,X);
	      madre(M,X),madre(M,Y).

hermanastro(X,Y):- padre(Z,Y),padre(Z,X);
	      madre(M,X),madre(M,Y).

tio(X,Y):-padre(Z,Y),hermano(Z,X);
	madre(Z,Y),hermano(Z,X);
	padre(Z,Y),hermanastro(Z,X);
	madre(Z,Y),hermanastro(Z,X).


sobrino(X,Y):-tio(Y,X).

primo(X,Y):-padre(Z,X),padre(M,Y),hermano(Z,M);
            madre(R,X),madre(P,Y),hermano(R,P).

abuelo(X,Y):-padre(X,Z),padre(Z,Y);
	     padre(X,z),madre(Z,Y);
             madre(X,z),padre(Z,Y);
             madre(X,z),madre(Z,Y).
	
suegra(X,Y):- matr(Y,Z),madre(X,Z);
	      matr(Z,Y),madre(X,Z).
  
yerno(X,Y):- suegra(Y,X);suegra(Y,X).

divorciado(X):-divorcio(X,Y);divorcio(Y,X).

casado(X):-matr(X,Y);matr(Y,X).

cuñado(X,Y):-matr(Y,Z),hermano(Z,X);
	     matr(Z,Y),hermano(Z,X).