cuadratica(A,B,C):-atom_number(A,F), atom_number(B,G), 
                      X is sqrt((F*F)+(G*G)),                                              
                      send(C, selection, X).                      
:- use_module(library(pce)).

inicio:-
     new(Ventana, dialog('Ventana principal pitagoras')),
     new(Etiqueta, label(nombre,'Formula de pitagoras c^2=a^2+b^2')),
     new(Salir, button('salir', message(Ventana, destroy))),
     new(Numero1, text_item('Ingrese el primer numero')),
     new(Numero2, text_item('Ingrese el segundo numero')),
     new(Resultado1, text_item('Resultado:')),
     
     new(Tem, button('ECUACION CUADRATICA', message(@prolog, 
     cuadratica, Numero1?selection, Numero2?selection,Resultado1))),
          send(Ventana, append, Etiqueta),
          send(Ventana, append, Numero1),
          send(Ventana, append, Numero2),
          send(Ventana, append, Resultado1),
          send(Ventana, append, Tem),
          send(Ventana, append, Salir),
     send(Ventana, open).                                       