/*****************************************************
PROYECTO PARA PROGRAMACIÓN LÓGICA Y FUNCIONAL(INF-318)
Diagnostico para computadoras
Hecho por: Juan Ernesto Cordero Pozo
DOCENTE:  EDWIN TERRAZAS CALLE
cualquier cosa  que termine en "vari" es variable se hizo asi para reconocerlas mas rapido
******************************************************/

/***************************************Librerias necesarias************************************************/
:-use_module(library(pce)).                   %libreria para realizarlo en modo grafico
:-use_module(library(pce_style_item)).        %libreria que permite crear label, button etc
:-pce_image_directory('./imagenes').          %carpeta donde se almacena las imagenes

/*************************************Fondo y declaracion de imagenes***************************************/
resource(fondo, image, image('fondo1.jpg')).

/************************************colocar imagen e iterfaz***********************************************/
img(VentanaVari,ImagenVari):-new(FiguraVari, figure),  			       %cargar una imagen en la interfaz ventana 
        		   new(BitmapVari, bitmap(resource(ImagenVari),@on)),
                           send(BitmapVari, name, 1),
                           send(FiguraVari, display, BitmapVari),
                           send(FiguraVari, status, 1),
                           send(VentanaVari, display, FiguraVari, point(0,0)). %posicion para la imagen(X, Y)

/**************************Ventana principal con fondo, título y botones************************************/
a:-new(Ventana,dialog('Diagnostico para computadoras de manera grafica.')),
	img(Ventana, fondo),
	send(Ventana, size, size(620, 420)),
	new(Titulo, label(nombre, 'Diagnostico para computadoras')),
    	new(BotonIni, button('Empezar diagnostico', message(@prolog,ventanitas))),% Boton que inicia el diagnostico "ventanitas"
    	new(BotonSalir, button('Salir', and(message(Ventana, destroy), message(ventana, free)))),

  	send(Ventana, display, Titulo, point(100, 0)),
	send(Titulo, font, font(times, bold, 25)),
	send(Ventana, display, BotonIni, point(100, 380)),
	send(Ventana, display, BotonSalir, point(400, 380)),
        send(Ventana,open).

/***************************Proceso cuando se presiona "Empezar diagnóstico*********************************/
ventanitas:-limpiar,
    	diagnostico(Resultado),
	mostrar_resultado(Resultado),
    	limpiar.

mostrar_resultado(Resultado) :-
	new(Vent, dialog('Resultado del diagnóstico')),
    	new(Texto, label(resultado, Resultado)),
    	send(Texto, font, font(times, bold, 14)),
    	send(Vent, append, Texto),
    	send(Vent, append, button('Cerrar', message(Vent, destroy))),
    	send(Vent, open_centered).

%%%%%%%%%%%%%%%%%%Diagnosticos%%%%%%%%%%%%%%%%%%
diagnostico('FALTA DE MEMORIA RAM:\n- Aplicaciones lentas\n- Cambio lento entre ventanas\n- Congelamientos\n- Uso de memoria al 100%'):-ram,!.

diagnostico('DISCO DURO DANIADO O FRAGMENTADO:\n- Archivos lentos\n- Ruidos del disco\n- Fallos al copiar\n- Congelamientos'):-disco,!.

%%%%%%%%%%%%%%%%%% Reglas para los sintomas, al menos 3 o 4 para el positivos %%%%%%%%%%%%%%%%%%
ram:-opcion_1,opcion_1_1,opcion_1_2,opcion_1_3.
disco:-opcion_2, opcion_2_1,opcion_2_2,opcion_2_3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
opcion_1  :-pregunta('¿Las aplicaciones tardan mucho en abrirse?').
opcion_1_1:-pregunta('¿El cambio entre ventanas es lento?').
opcion_1_2:-pregunta('¿Tienes congelamientos frecuentes?').
opcion_1_3:-pregunta('¿El uso de memoria llega al 100%?').

opcion_2  :-pregunta('¿Los archivos tardan en abrirse?').
opcion_2_1:-pregunta('¿Escuchas ruidos inusuales del disco?').
opcion_2_2:-pregunta('¿Fallos al copiar/mover archivos?').
opcion_2_3:-pregunta('¿Congelamientos sin razón aparente?').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Modulo de preguntas tipo "si/no" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic si/1, no/1.
preguntar(Pregunta) :-
    new(Di, dialog('Responda:')),
    new(L2, label(texto, 'Presenta este sintoma?')),
    new(La, label(prob, Pregunta)),
    new(B1, button(si, and(message(Di, return, si)))),
    new(B2, button(no, and(message(Di, return, no)))),
    send(Di, append, L2),
    send(Di, append, La),
    send(Di, append, B1),
    send(Di, append, B2),
    send(Di, default_button, si),
    send(Di, open_centered),
    get(Di, confirm, Answer),
    send(Di, destroy),
    (Answer == si -> assert(si(Pregunta)); assert(no(Pregunta)), fail).
pregunta(S) :- (si(S) -> true ; (no(S) -> fail ; preguntar(S))).
limpiar :- retract(si(_)), fail.
limpiar :- retract(no(_)), fail.
limpiar.