/*****************************************************
PROYECTO PARA PROGRAMACION LOGICA Y FUNCIONAL(INF-318)
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
img(VentanaVari,ImagenVari):-new(FiguraVari, figure),
			   new(BitmapVari, bitmap(resource(ImagenVari),@on)),
                           send(BitmapVari, name, 1),
                           send(FiguraVari, display, BitmapVari),
                           send(FiguraVari, status, 1),
                           send(VentanaVari, display, FiguraVari, point(0,0)). %posicion para la imagen(X, Y)

/**************************Ventana principal con fondo, titulo y botones************************************/
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

/***************************Proceso cuando se presiona "Empezar diagnostico*********************************/
ventanitas:-limpiar,
	diagnostico(Resultado),
	mostrar_resultado(Resultado),
	limpiar.

mostrar_resultado(Resultado) :-
	new(Vent, dialog('Resultado del diagnostico')),
	new(Texto, label(resultado, Resultado)),
	send(Texto, font, font(times, bold, 14)),
	send(Vent, append, Texto),
	send(Vent, append, button('Cerrar', message(Vent, destroy))),
	send(Vent, open_centered).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DIAGNOSTICOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%DIAGNOSTICO HARDWARE
diagnostico('FALTA DE MEMORIA RAM:\n -Se sugiere que compre mas ram \n-O elimine tareas innecesarias \n-Oarchivos basura para liberar mas RAM'):- ram, !.

diagnostico('DISCO DURO DANIADO O FRAGMENTADO:\n-Reemplace el disco duro por uno nuevo\n -O realice una desfragmentacion si aun es funcional \n para solucionar el problema'):-disco, !.

diagnostico('SOBRECALENTAMIENTO:\n- Limpie los ventiladores y componentes\n- o agregue ventilacion adicional \n-O pasta termica a la cpu para solucionar el problema'):- sobrecal, !.

diagnostico('FUENTE DE PODER DEFECTUOSA:\n-Reemplace la fuente de poder por una funcional \n o directamente compre una nueva \n- evite seguir usando la PC si hay olor a quemado '):- fuente, !.

diagnostico('DISCO DURO LLENO:\n-compre mas memoria\n- elimine aplicacines que ya no use o algunas en desuso\n-Elimine archivos que no utilice \n- o muevalo a un disco externo \n -considere tambien usar la nube de google para manejar sus archivos') :- discolleno, !.

diagnostico('FALLO DE GPU:\n -Reemplace la tarjeta grafica \n- Actualice o reinstale los drivers de video \n- Realiza limpiezas peridicas de tu PC \n- asegurate de tener una buena ventilacion en la caja '):- gpu, !.

diagnostico('RAM DEFECTUOSA:\n-intente limpiar los contactos del mosdulo de la ram \n- Reemplace los modulos de RAM danados \n- Realice pruebas con MemTest'):- ram_defectuosa, !.

diagnostico('PROBLEMAS EN LA PLACA BASE:\n- Revise conexiones y componentes\n- Si el problema persiste, reemplace la placa base '):-placa_base,!.

diagnostico('CONECCIONES FLOJAS O SUCIAS:\n-Limpie y reconecte los cables y componentes\n- Use aire comprimido y revise el interior del gabinete '):-conexiones, !.

diagnostico('BATERIA DE BIOS AGOTADA:\n- Cambie la bateria CMOS \n- Reconfigure el BIOS despues del reemplazo'):-bios,!.

%%%%DIAGNOSTICO SOFTWARE

diagnostico('PROGRAMAS AL INICIO:\n-Desactive programas innecesarios al iniciar\n -Use el administrador de tareas para gestionarlos'):-inicio_lento,!.

diagnostico('MALWARE O VIRUS:\n- Ejecute un analisis completo con un buen antivirus\n- Use herramientas anti-malware adicionales'):-malware,!.

diagnostico('ACTUALIZACIONES PENDIENTES:\n-  Aplique las actualizaciones al sistema\n- Verifique tambien los drivers y controladores') :- actualizaciones,!.

diagnostico('DRIVERS CORRUPTOS O DESACTUALIZADOS:\n-Reinstale o actualice los drivers desde la web oficial\n- Use herramientas de deteccion de drivers') :- drivers, !.

diagnostico('SISTEMA OPERATIVO DANADO:\n- Use herramientas de reparacion del sistema\n- Si falla, realice una reinstalacion del sistema operativo') :- sistema_danado, !.

diagnostico('SOFTWARE INCOMPATIBLE:\n-Desinstale el software conflictivo\n- Verifique compatibilidad antes de instalar nuevos programas') :- software_incomp, !.

diagnostico('CONFIGURACIONES ALTERADAS:\n- Restablezca las configuraciones del sistema\n- Escanee en busca de malware si hubo cambios sospechosos') :- configuraciones, !.

diagnostico('DEMASIADOS PROCESOS ABIERTOS:\n-Cierre procesos innecesarios desde el administrador de tareas\n- Considere ampliar RAM o usar software mas ligero') :- procesos, !.

diagnostico('ANTIVIRUS PESADO:\n-Cambie a un antivirus mas ligero\n- Ajuste la configuracion para menor impacto en el sistema') :- antivirus, !.

diagnostico('CONFLICTO ENTRE PROGRAMAS:\n- Evite ejecutar programas que hacen lo mismo simultaneamente\n- Desinstale uno de los que entre en coflicto
') :- conflictos, !.

%%%%sin diagnostico
diagnostico('No se pudo determinar un diagnostico. Intenta responder mas preguntas.').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reglas por sintomas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ram :- opcion_1,opcion_1_1,opcion_1_2,opcion_1_3.
disco :- opcion_2, opcion_2_1,opcion_2_2,opcion_2_3.
sobrecal :- opcion_3, opcion_3_1,opcion_3_2.
fuente :- opcion_4, opcion_4_1.
discolleno :- opcion_5, opcion_5_1,opcion_5_2.
gpu :- opcion_6, opcion_6_1,opcion_6_2.
ram_defectuosa:- opcion_7, opcion_7_1, opcion_7_2, opcion_7_3.
placa_base :- opcion_8, opcion_8_1, opcion_8_2, opcion_8_3.
conexiones :- opcion_9, opcion_9_1, opcion_9_2.
bios :- opcion_10, opcion_10_1, opcion_10_2, opcion_10_3.

inicio_lento:- opcion_11, opcion_11_1, opcion_11_2.
malware :-opcion_12, opcion_12_1, opcion_12_2, opcion_12_3.
actualizaciones:- opcion_13, opcion_13_1, opcion_13_2.
drivers:- opcion_14, opcion_14_1, opcion_14_2, opcion_14_3.
sistema_danado :-opcion_15, opcion_15_1, opcion_15_2, opcion_15_3.
software_incomp:- opcion_16, opcion_16_1, opcion_16_2, opcion_16_3.
configuraciones:- opcion_17, opcion_17_1, opcion_17_2.
procesos:-opcion_18, opcion_18_1, opcion_18_2, opcion_18_3.
antivirus:- opcion_19, opcion_19_1, opcion_19_2, opcion_19_3.
conflictos :-opcion_20, opcion_20_1, opcion_20_2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opcion_1  :-pregunta('¿Las aplicaciones tardan mucho en abrirse?').
opcion_1_1:-pregunta('¿El cambio entre ventanas es lento?').
opcion_1_2:-pregunta('¿Tienes congelamientos frecuentes?').
opcion_1_3:-pregunta('¿El uso de memoria llega al 100%?').

opcion_2  :-pregunta('¿Los archivos tardan en abrirse?').
opcion_2_1:-pregunta('¿Escuchas ruidos inusuales del disco?').
opcion_2_2:-pregunta('¿Fallos al copiar/mover archivos?').
opcion_2_3:-pregunta('¿Congelamientos sin razon aparente?').

opcion_3  :-pregunta('¿La PC se apaga sola despues de un rato?').
opcion_3_1:-pregunta('¿Los ventiladores hacen mas ruido de lo normal?').
opcion_3_2:-pregunta('¿Hay bajo rendimiento al jugar o trabajar?').

opcion_4  :-pregunta('¿La PC no enciende o lo hace intermitentemente?').
opcion_4_1:-pregunta('¿Se apaga repentinamente?').

opcion_5 :-pregunta('¿El sistema lanza alertas de espacio lleno?').
opcion_5_1:-pregunta('¿El explorador esta muy lento?').
opcion_5_2:-pregunta('¿No puedes guardar archivos grandes?').

opcion_6  :-pregunta('¿Ves lineas o errores visuales en la pantalla?').
opcion_6_1:-pregunta('¿Juegos o programas graficos se cierran solos?').
opcion_6_2:-pregunta('¿Pantalla negra al iniciar?').

opcion_7 :- pregunta('¿Aparecen pantallazos azules con frecuencia?').
opcion_7_1:-pregunta('¿Se reinicia sin razon aparente?').
opcion_7_2:-pregunta('¿Las aplicaciones se cierran solas?').
opcion_7_3:-pregunta('¿Errores al instalar programas?').

opcion_8 :- pregunta('¿No detecta componentes como RAM o disco?').
opcion_8_1:-pregunta('¿Se reinicia sin llegar al sistema?').
opcion_8_2:-pregunta('¿No da imagen al encender?').
opcion_8_3:-pregunta('¿No funcionan los puertos USB?').

opcion_9 :- pregunta('¿No detecta perifericos al conectarlos?').
opcion_9_1:-pregunta('¿La computadora falla sin razon clara?').
opcion_9_2:-pregunta('¿Conectores USB/HDMI hacen falso contacto?').

opcion_10 :- pregunta('¿La hora/fecha se reinician al encender?').
opcion_10_1:-pregunta('¿Errores relacionados con la CMOS?').
opcion_10_2:-pregunta('¿No se guardan configuraciones del BIOS?').
opcion_10_3:-pregunta('¿Tarda mucho en arrancar el sistema?').

opcion_11 :- pregunta('¿El inicio del sistema es muy lento?').
opcion_11_1 :- pregunta('¿Hay muchos iconos en la bandeja del sistema?').
opcion_11_2 :- pregunta('¿El CPU o disco estan al 100% al arrancar?').

opcion_12 :- pregunta('¿Aparecen ventanas emergentes sin razÃ³n?').
opcion_12_1:-pregunta('¿El navegador se redirige solo?').
opcion_12_2:-pregunta('¿Tu antivirus se desactiva solo?').
opcion_12_3:-pregunta('¿La computadora parece controlarse sola?').

opcion_13 :- pregunta('¿Programas no funcionan correctamente?').
opcion_13_1:-pregunta('¿Dispositivos no funcionan tras actualizar?').
opcion_13_2:-pregunta('¿Errores al reiniciar tras actualizaciones?').

opcion_14 :- pregunta('¿No tienes audio o se escucha mal?').
opcion_14_1:-pregunta('¿Parpadea o se congela la pantalla?').
opcion_14_2:-pregunta('¿No reconoce Wi-Fi o mouse/teclado?').
opcion_14_3:-pregunta('¿Errores al abrir juegos o programas?').

opcion_15 :- pregunta('¿Aparecen errores constantes del sistema?').
opcion_15_1:-pregunta('¿No se puede actualizar Windows o Linux?').
opcion_15_2:-pregunta('¿El sistema se bloquea completamente?').
opcion_15_3:-pregunta('¿Faltan archivos importantes del sistema?').

opcion_16 :- pregunta('¿Programas no abren o lanzan errores?').
opcion_16_1:-pregunta('¿Conflictos o bloqueos tras instalar software?').
opcion_16_2:-pregunta('¿Se volvio lento tras instalar algo nuevo?').
opcion_16_3:-pregunta('¿Problemas para desinstalar programas?').

opcion_17 :- pregunta('¿Cambion el fondo o accesos directos solos?').
opcion_17_1:-pregunta('¿El navegador abre pÃ¡ginas que no configuraste?').
opcion_17_2:-pregunta('¿Se bloquearon funciones como administrador de tareas?').

opcion_18 :- pregunta('¿El navegador esta muy lento con muchas pestanas?').
opcion_18_1:-pregunta('¿Se congela al cambiar de pestaÃ±a o app?').
opcion_18_2:-pregunta('¿Hay retardo al escribir o moverse?').
opcion_18_3:-pregunta('¿CPU al 100% sin tareas pesadas?').

opcion_19 :- pregunta('¿La PC se vuelve lenta al usar el antivirus?').
opcion_19_1:-pregunta('¿El escaneo dura mucho tiempo?').
opcion_19_2:-pregunta('¿Tareas simples tardan mas de lo normal?').
opcion_19_3:-pregunta('¿Demasiadas notificaciones del antivirus?').

opcion_20 :- pregunta('¿Dos programas fallan si se usan juntos?').
opcion_20_1:-pregunta('¿Hay funciones duplicadas entre apps?').
opcion_20_2:-pregunta('¿Se cuelga al abrir ciertas combinaciones de apps?').

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
