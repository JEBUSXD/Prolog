/*****************************************************
>TEST PARA UN INGENIERO ELECTRICO
PROYECTO PARA PROGRAMACION LOGICA Y FUNCIONAL(INF-318)
HECHO POR:  -Juan Ernesto Cordero Pozo
	        -Francisco  Mendez
DOCENTE:  Edwin Terrazas Calle
Informacion:Para poder desarrollar este proyecto se entrevisto a un ingeniero electrico, encargado de prescripcion de materiales.
******************************************************/

/***************************************Librerias necesarias************************************************/
:- use_module(library(pce)).					%biblioteca para crear interfaces graficas
:- use_module(library(pce_style_item)).				%para  crear label, button ,campos de entrada, etc
:- pce_image_directory('./imagenes').				%carpeta donde se almacena las imagenes

/*************************************Fondo y declaracion de imagenes***************************************/
resource(fondo, image, image('fondo3.jpg')).
resource(fondoinfo, image, image('fondoinfo1.jpg')).

/************************************colocar imagen e iterfaz***********************************************/
img(Ventana, Imagen):-			       %cargar una imagen en la interfaz ventana s
    new(Figura, figure),                       %figure es un contenedor para graficos
    new(Bitmap, bitmap(resource(Imagen), @on)),%crea una imagen con transparencia activada
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(0,0)).%posicion para la imagen(X, Y)

/**************************Ventana principal con fondo, titulo y botones************************************/
a:- new(V, dialog('Cuestionario para un ingeniero electrico')),
    img(V, fondo),
    send(V, size, size(620, 480)),						%tamanio de la ventana
    new(Titulo, label(nombre, 'Test para un ingeniero electrico')),
    new(SubTitulo, label(subtitulo, 'Especialidad: Materiales de Distribucion Electrica')),
    new(Texto, label(info, 'Este cuestionario de preguntas fue logrado gracias a:')),
    new(Texto2, label(info2, 'ING. Electrico \nCristian Rosales Romao.\nEncargado de prescripcion de materiales.\nEmpresa mercantil Leon srl.\nEste test contiene 30 preguntas tecnicas.')),
    new(BotonInformacion, button('Informacion extra', message(@prolog, informacion))),
    new(BotonIni, button('Empezar test', message(@prolog, cuestionario))),	% Boton que inicia las preguntas "cuestionario"
    new(BotonSalir, button('Salir', and(message(V, destroy), message(@prolog, limpiar)))),

    send(Titulo, font, font(times, bold, 25)),
    send(V, display, Titulo, point(80, 10)),
    send(SubTitulo, font, font(times, bold, 15)),
    send(V, display, SubTitulo, point(10, 60)),
    send(SubTitulo, colour, red),

    send(V, display, Texto, point(10, 80)),
    send(V, display, Texto2, point(10, 110)),
    send(Texto2, font, font(times, italic, 13)),
    send(Texto2, colour, black),

    send(V, display, BotonInformacion, point(10, 205 )),
    send(BotonInformacion, colour, black),
    send(V, display, BotonIni, point(100, 430)),
    send(BotonIni, colour, black),
    send(V, display, BotonSalir, point(400, 430)),
    send(BotonSalir, colour, black),
    send(V, open).
:-a.                                                                %para no poner comando a cada rato
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Informacion de un ingeniero encargado de la prescripcion de materiales%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
informacion :-
    new(Vent, dialog('Informacion de un ING. en area de prescripcion de materiales')),
    img(Vent, fondoinfo),
    send(Vent, size, size(500, 300)),
    new(TextoInfo, label(info,
    '    Un ingeniero electrico encargado de la prescripcion de materiales
    o tambien conocido como ingeniero de compras o de especificaciones
    tecnicas, es responsable de determinar y seleccionar los materiales
    y componentes electricos adecuados para un proyecto especifico.
    Esto incluye desde cables y equipos de proteccion hasta transformadores
    y equipos de medicion.')),
    send(TextoInfo, font, font(times, roman, 13)),
    send(TextoInfo, font, font(times, bold, 13)),
    send(Vent, display, TextoInfo, point(0, 0)),

    new(BotonCerrar, button('Cerrar', message(Vent, destroy))),
    send(Vent, display, BotonCerrar, point(200, 200)),
    send(Vent, open_centered).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
:- dynamic puntuacion/1.      %para la puntuacion dinamica ( predicado/funcion)R=R+1
puntuacion(0).		      %lo inicializamos en cero
cuestionario :-
    limpiar,		      %limpia para la nueva v
    retractall(puntuacion(_)),
    assert(puntuacion(0)),
    preguntas([ %lista enlazada que contiene varias sublistas
    ['1)¿Cual es el objetivo principal de un ingeniero de prescripcion de materiales de distribucion?\na) Seleccionar y especificar materiales de distribucion adecuados para proyectos y sistemas.\nb) Instalar y mantener los materiales en campo\nc) Realizar estudios de mercado para materiales',
        item(1, 'a)'),        %item(Valor, Etiqueta)
        item(0, 'b)'),
        item(0, 'c)')],
    ['2)¿Que tipo de materiales de distribucion se prescriben comunmente?\na) Transformadores, interruptores, seccionadores, fusibles, cables y otros componentes de distribucion.\nb) Herramientas de medicion y equipos de seguridad\nc) Materiales de construccion civil y estructuras',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['3)¿Como se determina la capacidad de un transformador de distribucion?\na) Por el tamano fisico del transformador\nb) Mediante calculos y analisis de las condiciones de carga y operacion.\nc) Segun el costo del transformador',
        item(0, 'a)'),
        item(1, 'b)'),
        item(0, 'c)')],
    ['4)¿Que factores se consideran al seleccionar un interruptor de distribucion?\na) Corriente, voltaje, tipo de carga y condiciones de operacion.\nb) Color y diseno del interruptor\nc) Marca y pais de origen',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['5)¿Que es la coordinacion de protecciones en sistemas de distribucion?\na) Seleccion y configuracion de dispositivos de proteccion para asegurar la seguridad y confiabilidad del sistema.\nb) Organizacion del personal de mantenimiento\nc) Planificacion de horarios de operacion',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['6)¿Como se evalua la calidad de un material de distribucion?\na) Por su precio y disponibilidad\nb) A traves de certificados de garantia\nc) Mediante pruebas y ensayos de laboratorio y en campo.',
        item(0, 'a)'),
        item(0, 'b)'),
        item(1, 'c)')],
    ['7)¿Que es la especificacion tecnica de materiales de distribucion?\na) Descripcion detallada de las caracteristicas y requisitos de los materiales de distribucion.\nb) Manual de usuario del producto\nc) Listado de proveedores autorizados',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['8)¿Como se selecciona un cable de distribucion adecuado para un proyecto?\na) Considerando factores como la corriente, el voltaje, la temperatura y el entorno de operacion.\nb) Basandose unicamente en el costo economico\nc) Eligiendo el cable mas largo disponible',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['9)¿Que es la compatibilidad electromagnetica (EMC) en materiales de distribucion?\na) Capacidad para soportar altas temperaturas\nb) Capacidad de un material para funcionar correctamente en un entorno electromagnetico.\nc) Resistencia mecanica a impactos',
        item(0, 'a)'),
        item(1, 'b)'),
        item(0, 'c)')],
    ['10)¿Cuales son las normas y regulaciones que se aplican a la prescripcion de materiales de distribucion?\na) Normas IEC, IEEE, NEMA, UL y otras normas nacionales e internacionales.\nb) Reglamentos internos de la empresa\nc) Leyes municipales de construccion',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['11)¿Como se determina la capacidad de cortocircuito de un material de distribucion?\na) Mediante calculos y analisis de las condiciones de operacion y carga.\nb) Por el peso del material\nc) Segun la antiguedad del equipo',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['12)¿Que es la documentacion tecnica de materiales de distribucion?\na) Facturas y documentos comerciales\nb) Registros de mantenimiento historico\nc) Conjunto de documentos que describen las caracteristicas y requisitos de los materiales.',
        item(0, 'a)'),
        item(0, 'b)'),
        item(1, 'c)')],
    ['13)¿Como se gestiona el inventario de materiales de distribucion?\na) Mediante sistemas de gestion de inventario y control de stock.\nb) De forma manual con registros en papel\nc) Sin seguimiento sistematico',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['14)¿Como se selecciona un proveedor de materiales de distribucion?\na) Considerando factores como la calidad, el precio, la entrega y el servicio.\nb) Por proximidad geografica unicamente\nc) Segun publicidad en medios',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['15)¿Que es la obsolescencia de materiales de distribucion?\na) Nuevos modelos disponibles en el mercado\nb) Situacion en la que un material ya no es compatible con las necesidades actuales o no se fabrica mas.\nc) Materiales con defectos de fabrica',
        item(0, 'a)'),
        item(1, 'b)'),
        item(0, 'c)')],
    ['16)¿Que es la certificacion de calidad de un material de distribucion?\na) Proceso de verificacion de que un material cumple con normas y regulaciones de calidad.\nb) Documento de propiedad del material\nc) Garantia extendida opcional',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['17)¿Como se evalua el impacto ambiental de un material de distribucion?\na) Mediante analisis de ciclo de vida y evaluacion de impacto ambiental.\nb) Por su peso y volumen\nc) Segun su color y apariencia',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['18)¿Que es la reciclabilidad de materiales de distribucion?\na) Capacidad de reutilizacion inmediata\nb) Facilidad de reparacion del material\nc) Capacidad de un material para ser reciclado al final de su vida util.',
        item(0, 'a)'),
        item(0, 'b)'),
        item(1, 'c)')],
    ['19)¿Como se prescribe un material de distribucion para un proyecto de energia renovable?\na) Considerando factores como la compatibilidad con la fuente de energia renovable y las condiciones de operacion.\nb) Usando los mismos materiales de proyectos convencionales\nc) Seleccionando solo materiales de bajo costo',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['20)¿Que es la innovacion en materiales de distribucion?\na) Desarrollo de nuevos materiales y tecnologias que mejoran la eficiencia y la confiabilidad de los sistemas de distribucion.\nb) Uso de materiales reciclados\nc) Reduccion de tamanos de componentes',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['21)¿Que es la mantenibilidad de un material de distribucion?\na) Facilidad de instalacion inicial\nb) Capacidad de un material para ser mantenido y reparado de manera eficiente.\nc) Resistencia a condiciones climaticas',
        item(0, 'a)'),
        item(1, 'b)'),
        item(0, 'c)')],
    ['22)¿Como se determina la vida util de un material de distribucion?\na) Mediante analisis de la calidad, la durabilidad y las condiciones de operacion.\nb) Por fecha de fabricacion\nc) Segun la marca del producto',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['23)¿Como se selecciona un seccionador de distribucion adecuado para un proyecto?\na) Considerando factores como la corriente, el voltaje y las condiciones de operacion.\nb) Eligiendo el modelo mas economico\nc) Por apariencia estetica',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['24)¿Que es la coordinacion de seccionadores en sistemas de distribucion?\na) Organizacion fisica en subestaciones.\nb) Programacion de mantenimiento preventivo\nc)Seleccion y configuracion de seccionadores para asegurar la seguridad y confiabilidad del sistema',
        item(0, 'a)'),
        item(0, 'b)'),
        item(1, 'c)')],
    ['25)¿Como se evalua la seguridad de un material de distribucion?\na) Mediante analisis de riesgos y cumplimiento con normas y regulaciones de seguridad.\nb) Por su peso y tamano\nc) Segun manuales de usuario',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['26)¿Como se prescribe un material de distribucion para un entorno hostil?\na) Considerando factores como la temperatura, la humedad y las condiciones de operacion.\nb) Seleccionando materiales estandar\nc) Reduciendo los requerimientos tecnicos',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['27)¿Que es la garantia de un material de distribucion?\na) Periodo de vida util estimado\nb) Compromiso del fabricante de reparar o reemplazar el material en caso de falla.\nc) Certificado de calidad inicial',
        item(0, 'a)'),
        item(1, 'b)'),
        item(0, 'c)')],
    ['28)¿Como se determina la eficiencia de un material de distribucion?\na) Mediante analisis de las perdidas de energia y la capacidad de carga.\nb) Por su antiguedad en el mercado\nc) Segun opiniones de usuarios',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['29)¿Que es la importancia de la documentacion tecnica de materiales de distribucion?\na) Permite una gestion eficiente y segura de los materiales, y facilita la resolucion de problemas y la toma de decisiones.\nb) Reduce los costos de adquisicion\nc) Cumplimiento de tramites administrativos',
        item(1, 'a)'),
        item(0, 'b)'),
        item(0, 'c)')],
    ['30)¿Que es la compatibilidad de materiales de distribucion con otros sistemas?\na) Uniformidad en marcas de equipos\nb) Similitud en especificaciones tecnicas   .\nc) Capacidad de un material para funcionar correctamente con otros sistemas y componentes',
        item(0, 'a)'),
        item(0, 'b)'),
        item(1, 'c)')]
]).
%%%%%%%%%%%%%%%%%%%%%%%%%%para sacar el tamanio del total de preguntas%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
preguntas(Lista) :-
    length(Lista, TotalPreguntas),				    %TotalPreguntas = 30
    preguntas(Lista, TotalPreguntas).

preguntas([],Total) :-
    puntuacion(P),
    Porcentaje is round((P * 100) / Total),                         %P=(17*100)/30,round(56.67) = 57
    format(atom(Resultado), 'Tu puntuacion fue: ~w%', [Porcentaje]),%el simbolo ~w se sustituye por Porcentaje
    mostrar_resultado(Resultado).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Modulo de preguntas tipo "A/B/C" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
preguntas([[Pregunta, item(V1, L1), item(V2, L2), item(V3, L3)]|Resto], Total) :- %preguntas([Preg|Resto], Total) :-
    new(D, dialog('Pregunta de las ventanas')),
    send(D, append, label(q, Pregunta)),
    new(B1, button(L1, message(D, return, V1))),
    new(B2, button(L2, message(D, return, V2))),
    new(B3, button(L3, message(D, return, V3))),
    send(D, append, B1),
    send(D, append, B2),
    send(D, append, B3),
    send(D, open_centered),
    get(D, confirm, Respuesta),  %Espera a que el usuario seleccione una opcion
    send(D, destroy),
    (Respuesta == 1 ->
        retract(puntuacion(P)),
        P1 is P + 1,
        assert(puntuacion(P1))
    ; true),
    preguntas(Resto, Total).%Llama recursivamente con el resto de las preguntas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ventana de respuesta %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mostrar_resultado(Resultado) :-
    new(V, dialog('ventanas de resultado del cuestionario')),
    new(T, label(r, Resultado)),
    send(T, font, font(times, bold, 14)),

    send(V, append, T),
    send(V, append, button('Cerrar', message(V, destroy))),
    send(V, open_centered).
    limpiar :- retractall(puntuacion(_)).%Reinicia el sistema de puntuacion.
