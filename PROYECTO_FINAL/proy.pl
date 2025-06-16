:- use_module(library(pce)).
:- use_module(library(pce_style_item)).
:- pce_image_directory('./imagenes').

resource(fondo, image, image('fondo1.jpg')).

img(Ventana, Imagen):- 
    new(Figura, figure),
    new(Bitmap, bitmap(resource(Imagen), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(0,0)).

a:- 
    new(V, dialog('Cuestionario de Ingenieria Civil')),
    img(V, fondo),
    send(V, size, size(620, 420)),
    new(Titulo, label(nombre, 'Cuestionario de Ingenieria Civil')),
    new(BotonIni, button('Empezar cuestionario', message(@prolog, cuestionario))),
    new(BotonSalir, button('Salir', and(message(V, destroy), message(@prolog, limpiar)))),
    send(V, display, Titulo, point(80, 0)),
    send(Titulo, font, font(times, bold, 25)),
    send(V, display, BotonIni, point(100, 380)),
    send(V, display, BotonSalir, point(400, 380)),
    send(V, open).

:- dynamic puntuacion/1.
puntuacion(0).

cuestionario :- 
    limpiar,
    retractall(puntuacion(_)),
    assert(puntuacion(0)),
    preguntas([
        ['¿Que prueba se realiza para conocer la resistencia a compresion del concreto?', 
            item(1, 'Ensayo de compresion axial'), 
            item(0, 'Ensayo Proctor'), 
            item(0, 'Prueba de revenimiento')],
        ['¿Cual es la unidad del modulo de elasticidad?', 
            item(1, 'Pascal'), 
            item(0, 'Newton'), 
            item(0, 'Metro')],
        ['¿Que tipo de carga soporta mejor una columna?', 
            item(1, 'Compresion'), 
            item(0, 'Corte'), 
            item(0, 'Tension')],
        ['¿Para que sirve un nivel topografico?', 
            item(1, 'Determinar niveles de terreno'), 
            item(0, 'Medir presion de agua'), 
            item(0, 'Controlar flujo de concreto')],
        ['¿Cual es el valor aproximado de la gravedad?', 
            item(1, '10 m/s2'), 
            item(0, '5 m/s2'), 
            item(0, '20 m/s2')],
        ['¿Que es un plano estructural?', 
            item(1, 'Una representacion de elementos estructurales'), 
            item(0, 'Un diseño arquitectonico'), 
            item(0, 'Un plano de electricidad')],
        ['¿Que es una viga?', 
            item(1, 'Un elemento que resiste momentos'), 
            item(0, 'Un soporte vertical'), 
            item(0, 'Una base de cimentacion')],
        ['¿Cual es el objetivo del concreto armado?', 
            item(1, 'Combinar resistencia a compresion y traccion'), 
            item(0, 'Reducir peso de estructuras'), 
            item(0, 'Aumentar resistencia al fuego')],
        ['¿Que indica un plano de cortes?', 
            item(1, 'La seccion transversal de elementos'), 
            item(0, 'El tipo de acero a usar'), 
            item(0, 'El grosor del concreto')]
    ], 0).

preguntas([], _) :- 
    puntuacion(P),
    format(atom(Resultado), 'Tu puntuacion fue: ~w', [P]),  % Corrección clave aquí
    mostrar_resultado(Resultado).

preguntas([[Pregunta, item(V1, L1), item(V2, L2), item(V3, L3)]|Resto], N) :-
    new(D, dialog('Pregunta')),
    send(D, append, label(q, Pregunta)),
    new(RB, menu(opcion, marked)),
    send(RB, append, menu_item(val1, @default, L1)),
    send(RB, append, menu_item(val2, @default, L2)),
    send(RB, append, menu_item(val3, @default, L3)),
    send(D, append, RB),
    send(D, append, button('Responder', message(D, return, RB?selection))),
    send(D, open_centered),
    get(D, confirm, Resp),
    send(D, destroy),

    % Evaluar selección
    ( (Resp == val1, V1 == 1)
    ; (Resp == val2, V2 == 1)
    ; (Resp == val3, V3 == 1) ) 
    -> (retract(puntuacion(P)), P1 is P + 1, assert(puntuacion(P1)))
    ; true,

    preguntas(Resto, N+1).

mostrar_resultado(Resultado) :- 
    new(V, dialog('Resultado del cuestionario')),
    new(T, label(r, Resultado)),
    send(T, font, font(times, bold, 14)),
    send(V, append, T),
    send(V, append, button('Cerrar', message(V, destroy))),
    send(V, open_centered).

limpiar :- retractall(puntuacion(_)).