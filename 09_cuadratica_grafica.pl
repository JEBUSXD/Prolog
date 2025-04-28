
cuadratica(A,B,C,D,E):-atom_number(A,F), atom_number(B,G), atom_number(C,H), 
                      X1 is (-G+(sqrt(((G*G)-(4*F*H)))))/(2*F),
                      X2 is (-G-(sqrt(((G*G)-(4*F*H)))))/(2*F),                        
                      send(D, selection, X1),
                      send(E, selection, X2).
:- use_module(library(pce)).

inicio:-
     new(Ventana, dialog('cuadratica')),
     new(Etiqueta, label(nombre,'Formula cuadratica')),
     new(Salir, button('salir', message(Ventana, destroy))),
     new(Numero1, text_item('ingrese el primer numero')),
     new(Numero2, text_item('ingrese el segundo numero')),
     new(Numero3, text_item('ingrese el tercer numero')),
     new(Resultado1, text_item('Resultado X1')),
     new(Resultado2, text_item('Resultado X2')),
     
     new(Tem, button('ECUACION CUADRATICA', message(@prolog, 
     cuadratica, Numero1?selection, Numero2?selection, Numero3?selection, Resultado1, Resultado2))),

          send(Ventana, append, Etiqueta),
          send(Ventana, append, Numero1),
          send(Ventana, append, Numero2),
          send(Ventana, append, Numero3),
          send(Ventana, append, Resultado1),
          send(Ventana, append, Resultado2),
          send(Ventana, append, Tem),
          send(Ventana, append, Salir),    
     send(Ventana, open).
                                                      