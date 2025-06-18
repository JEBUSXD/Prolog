:- use_module(library(pce)).
:- use_module(library(pce_style_item)).
:- pce_image_directory('./').

% Cargar imagen de fondo
resource(fondo,image,image('imagen.jpg')).

% Mostrar imagen en la ventana
nueva_imagen(VentanaVari,ImagenVari):-
    new(FiguraVari, figure),
    new(BitmapVari, bitmap(resource(ImagenVari),@on)),
    send(BitmapVari, name, 1),
    send(FiguraVari, display, BitmapVari),
    send(FiguraVari, status, 1),
    send(VentanaVari, display, FiguraVari, point(10,8)).

% Ventana principal con fondo, título y botones
a:-new(DialogoVari, dialog('DIAGNOSTICO DE ENFERMEDAD')),
    nueva_imagen(DialogoVari, fondo),

    new(TituloVari, label(nombre, 'TEST DE DIAGNOSTICO DE ENFERMEDADES CARDIACAS')),
    send(TituloVari, font, font(times, bold, 25)),
    send(DialogoVari, display, TituloVari, point(100, 20)),

    new(BotonIniciarVari, button('INICIAR DIAGNOSTICO', message(@prolog, abrir_ventana_diagnostico_vari))),
    send(DialogoVari, display, BotonIniciarVari, point(180, 300)),

    new(BotonSalirVari, button('SALIR', and(message(DialogoVari, destroy), message(DialogoVari, free)))),
    send(DialogoVari, display, BotonSalirVari, point(400, 300)),

    send(DialogoVari, open, point(0,0)).

% Al presionar "INICIAR DIAGNOSTICO" se abre una nueva ventana
abrir_ventana_diagnostico_vari :-
    new(VentanaDiagVari, dialog('Ventana de Diagnóstico')),
    send(VentanaDiagVari, append, label(infoVari, 'Aquí puedes comenzar el diagnóstico.')),
    send(VentanaDiagVari, append, button('Cerrar', message(VentanaDiagVari, destroy))),
    send(VentanaDiagVari, open).
