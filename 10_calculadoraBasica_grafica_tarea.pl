suma(A,B,C):-atom_number(A,X), atom_number(B,Y), 
		R is X + Y,
		send(C, selection, R).
resta(A,B,C):-atom_number(A,X), atom_number(B,Y), 
		R is X - Y,
		send(C, selection, R). 
multiplicasion(A,B,C):-atom_number(A,X), atom_number(B,Y), 
		R is X * Y,
		send(C, selection, R).
division(A,B,C):-atom_number(A,X), atom_number(B,Y), 
		R is X / Y,
		send(C, selection, R).                           

:- use_module(library(pce)).
inicio:-new(Ventana, dialog('Calculadora Grafica.')),
	new(Etiqueta, label(nombre,'Calculadora aritmetica basica')),
	new(Num1, text_item('Ingrese el primer numero')),
     	new(Num2, text_item('Ingrese el segundo numero')),
	new(Resultado, text_item('Resultado:')),
	new(SumBoton, button('Suma', message(@prolog,
		suma,Num1?selection,Num2?selection,Resultado))),
	new(ResBoton, button('Resta', message(@prolog,
		resta,Num1?selection,Num2?selection,Resultado))),
	new(MulBoton, button('Multiplicasion', message(@prolog,
		multiplicasion,Num1?selection,Num2?selection,Resultado))),
	new(DivBoton, button('Division', message(@prolog,
		division,Num1?selection,Num2?selection,Resultado))),
	new(Salir, button('salir', message(Ventana, destroy))),
   
	send(Ventana, append, Etiqueta),
        send(Ventana, append, Num1),
        send(Ventana, append, Num2),
        send(Ventana, append, Resultado),
	send(Ventana, append, SumBoton),
	send(Ventana, append, ResBoton),
	send(Ventana, append, MulBoton),
	send(Ventana, append, DivBoton),
	send(Ventana, append, Salir),
send(Ventana, open).
                             