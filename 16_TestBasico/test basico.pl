
%%%%%%%%%%%%%%%%INTERFAS PARA INICIALIZAR LAS IMAGENES ECT.%%%%%%%%%%%%%%%%
 :- use_module(library(pce)).
 :- pce_image_directory('./imagenes').
 :- use_module(library(pce_style_item)).
 /*:- dynamic color/2.*/


%%%%%%%%%%%%%%%%%%%%PARA COLOCAR LAS IMAGENES%%%%%%%%%%%%

 resource(img_principal, image, image('img_principal.jpg')).
 resource(fondo1, image, image('fondo1.jpg')).
 resource(exelente, image, image('paco.jpg')).
 resource(muy_bueno, image, image('abc.jpg')).
 resource(bueno, image, image('veve.jpg')).
 resource(regular, image, image('aeiou.jpg')).
 resource(pesimo, image, image('desconocido.jpg')).
 resource(img_principal, image, image('img_principa.jpg')).

 resource(segundo, image, image('segundo.jpg')).


%%%%%%%%%%%%HACER LLAMADOS DE IMAGNES Y MOSTRARLO EN PANTALLA%%%%%%%%%%%%%%

 mostrar_imagen(Pantalla, Imagen) :- new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(100,80)).

  mostrar_imagen_tratamiento(Pantalla, Imagen) :-new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(20,100)).

 nueva_imagen(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(0,0)).

  imagen_pregunta(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(500,60)).


 %%%%%%%%%%%%%%%%%%% BOTONES DEL PROYECTO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  botones:-borrado,
                send(@boton, free),
                send(@btntratamiento,free),
                mostrar_diagnostico(Enfermedad),
                send(@texto, selection('SU CONOCIMIENTO ES:')),
                send(@resp1, selection(Enfermedad)),
                new(@boton, button('INICIAR CONSULTA',
                message(@prolog, botones))),

                new(@btntratamiento,button('VER RESULTADO',
                message(@prolog, mostrar_tratamiento,Enfermedad))),
                send(@main, display,@boton,point(20,470)),
                send(@main, display,@btntratamiento,point(180,470)).

  mostrar_tratamiento(X):-new(@tratam, dialog('TEST PROLOG')),
                          send(@tratam, append, label(nombre, 'Explicacion: ')),
                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@tratam, display,@lblExp2,point(50,80)),
                          tratamiento(X),
                          send(@tratam, transient_for, @main),
                          send(@tratam, open_centered).

tratamiento(X):- send(@lblExp1,selection('DE ACUERDO AL TEST  REALIZADO SU CONOCIMIENTO ES:')),
                 mostrar_imagen_tratamiento(@tratam,X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   preguntar(Preg,Resp):-new(Di,dialog('Colsultar Datos:')),
                        new(L2,label(texto,'Responde las siguientes preguntas')),
                        id_imagen_preg(Preg,Imagen),
                        imagen_pregunta(Di,Imagen),
                        new(La,label(prob,Preg)),
                        new(B1,button(verdadero,and(message(Di,return,verdadero)))),
                        new(B2,button(falso,and(message(Di,return,falso)))),
                        send(Di, gap, size(25,25)),
                        send(Di,append(L2)),
                        send(Di,append(La)),
                        send(Di,append(B1)),
                        send(Di,append(B2)),
                        send(Di,default_button,'verdadero'),
                        send(Di,open_centered),get(Di,confirm,Answer),
                        free(Di),
                        Resp=Answer.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%todo lo que se mostrara%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  interfaz_principal:-new(@main,dialog('TEST DE PROLOG',
        size(1000,1000))),
        new(@texto, label(nombre,'SU CONOCIMIENTO ES:',font('times','roman',15))),
        new(@resp1, label(nombre,'',font('times','roman',22))),
        new(@lblExp1, label(nombre,'',font('times','roman',14))),
        new(@lblExp2, label(nombre,'',font('times','roman',14))),
        new(@salir,button('SALIR',and(message(@main,destroy),message(@main,free)))),
        new(@boton, button('INICIAR CONSULTA',message(@prolog, botones))),

        new(@btntratamiento,button('¿Tratamiento?')),

        nueva_imagen(@main, img_principal),
        send(@main, display,@boton,point(138,470)),
        send(@main, display,@texto,point(20,130)),
        send(@main, display,@salir,point(350,470)),
        send(@main, display,@resp1,point(20,180)),
        send(@main,open_centered).

       borrado:- send(@resp1, selection('')).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  crea_interfaz_inicio:- new(@interfaz,dialog('TEST DE PROLOG',
  size(1000,1000))),

  mostrar_imagen(@interfaz, fondo1),

  new(BotonComenzar,button('COMENZAR',and(message(@prolog,interfaz_principal) ,
  and(message(@interfaz,destroy),message(@interfaz,free)) ))),
  new(BotonSalir,button('SALIDA',and(message(@interfaz,destroy),message(@interfaz,free)))),
  send(@interfaz,append(BotonComenzar)),
  send(@interfaz,append(BotonSalir)),
  send(@interfaz,open_centered).
  :-crea_interfaz_inicio.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PREGUNTAS DEL PREYECTO AQUI VIENE TODAS LAS PREGUNTA QUE DESEA PREGUNTAR AL USUARIO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

conocimiento('Excelente',
['La extension del programa prolog es  .pl', 
'Los hechos y reglas representa lo mismo en el lenguaje prolog',
'Prolog es un lenguaje orientado al desarrollo de aplicaciones moviles.',
'Los operadores logicos and y or, se representan a traves de los simbolos , y ;']).

conocimiento('Muy_bueno',
['Los hechos y reglas representa lo mismo en el lenguaje prolog.',
'Prolog es un lenguaje orientado al desarrollo de aplicaciones moviles.',
 'Los operadores logicos and y or, se representan a traves de los simbolos, y ;']).

conocimiento('Bueno',
['Prolog es un lenguaje orientado al desarrollo de aplicaciones moviles.',
 'Los operadores logicos and y or, se representan a traves de los simbolos, y ;']).

conocimiento('Regular',
['Los operadores logicos and y or, se representan a traves de los simbolos, y ;']).


%%%%%%%%%%%%%%%%%%%%%LAS PREGUNTA CON LAS SEÑALES DE IMAGENES HACEMOS EL LLAMADO A LAS IMAGENES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

id_imagen_preg('La extension del programa prolog es  .pl','segundo').
id_imagen_preg('Los hechos y reglas representa lo mismo en el lenguaje prolog','segundo').
id_imagen_preg('Prolog es un lenguaje orientado al desarrollo de aplicaciones moviles','segundo').
id_imagen_preg('Los operadores logicos and y or, se representan a traves de los simbolos: , y ;','segundo').


id_imagen_preg('Los hechos y reglas representa lo mismo en el lenguaje prolog.','segundo').
id_imagen_preg('Prolog es un lenguaje orientado al desarrollo de aplicaciones moviles.','segundo').
id_imagen_preg('Los operadores logicos and y or, se representan a traves de los simbolos: , y ;','segundo').


id_imagen_preg('.Prolog es un lenguaje orientado al desarrollo de aplicaciones moviles.','segundo').
id_imagen_preg('.Los operadores logicos and y or, se representan a traves de los simbolos. , y ;','segundo').


id_imagen_preg('.Los operadores logicos and y or, se representan a traves de los simbolos: , y ;','segundo').


%%%%%%%%%%%%%%%%%%%%%%%%%preguntas que se encargar su conocimiento%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic conocido/1.

  mostrar_diagnostico(X):-haz_diagnostico(X),clean_scratchpad.
  mostrar_diagnostico(pesimo):-clean_scratchpad .

  haz_diagnostico(Diagnosis):-
                            obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas),
                            prueba_presencia_de(Diagnosis, ListaDeSintomas).

obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas):-
                            conocimiento(Diagnosis, ListaDeSintomas).


prueba_presencia_de(Diagnosis, []).
prueba_presencia_de(Diagnosis, [Head | Tail]):- prueba_verdad_de(Diagnosis, Head),
                                              prueba_presencia_de(Diagnosis, Tail).


prueba_verdad_de(Diagnosis, Sintoma):- conocido(Sintoma).
prueba_verdad_de(Diagnosis, Sintoma):- not(conocido(is_false(Sintoma))),
pregunta_sobre(Diagnosis, Sintoma, Reply), Reply = 'verdadero'.


pregunta_sobre(Diagnosis, Sintoma, Reply):- preguntar(Sintoma,Respuesta),
                          process(Diagnosis, Sintoma, Respuesta, Reply).


process(Diagnosis, Sintoma, verdadero, verdadero):- asserta(conocido(Sintoma)).
process(Diagnosis, Sintoma, no, no):- asserta(conocido(is_false(Sintoma))).


clean_scratchpad:- retract(conocido(X)), fail.
clean_scratchpad.


conocido(_):- fail.

not(X):- X,!,fail.
not(_).
