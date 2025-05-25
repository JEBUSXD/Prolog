%%%%%PROYECTO DE PROGRAMACI�N L�GICA Y FUNCIONAL
%%%%%DIAGNOSTICO MOTORIZADO
%%%%%NTEGRANTE: JOSE LUIS LAVARDEN LOAYZA

%%%%%DOCENTE:  EDWIN TERRAZAS CALLE

:- use_module(library(pce)).                  %%libreria para realizarlo en modo grafico%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(pce_style_item)).        %%libreria que permite crear label, button etc%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- pce_image_directory('./').         %%DIRECTORIO
:- dynamic color/2.
%%%%%%%%%%%%%%%%%%%%%%%%% IMAGEN DE INTERFAZ  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

resource(primeroo1, image, image('imagen.jpg')).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARA COLOCAR IMAGEN A LA INTERFAZ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nueva_imagen(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(0,0)). %%POSICION DE IMAGEN


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  CREANDO EL PANEL DE LA INTERFAZ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
iniciar:-


        new(D,dialog('
  DIAGNOSTICO MOTORIZADO ')),

        new(L,label(nombre,'  "ESTO ES UN PEQUE�O DIAGNOSTICO EL CUAL
        TE AYUDARA A CONOCER Y SOLUCIONAR
        ALGUNOS PROBLEMAS EN TU MOTOCICLETA"')),
        new(@texto,label(nombre,'nota: Selecciona Si o No en las diferentes')),
  new(@texto1,label(nombre,'preguntas, buena suerte...!!!')),
  new(@respl,label(nombre,'')),
  new(Salir,button('SALIR',and(message(D,destroy),message(D,free)))),
  new(@boton,button('INICIAR DIAGNOSTICO',message(@prolog,botones))),
        nueva_imagen(D, primeroo1),
        send(D,append(L)),new(@btnseguridad,button('�Diagnostico?' )),
  send(D,display,L,point(40,30)),                %%POSICION TITULO
  send(D,display,@boton,point(250,325)),         %%POSICION BOTON DIAGNOSTICO
  send(D,display,@texto,point(40,260)),          %%POSICION NOTA1
        send(D,display,@texto1,point(40,280)),   %%POSICION NOTA2
  send(D,display,Salir,point(40,325)),           %%POSICION BOTON SALIR
  send(D,display,@respl,point(700,10)),          %%POSICION RESPUESTA

  send(@texto,font,font(times,bold,13)),         %%TIPO LETRA NOTA1
  send(@texto1,font,font(times,bold,13)),        %%TIPO LETRA NOTA2
  send(L,font,font(times,bold,14)),              %%TIPO,TAMA�O LETRA TITULO

        send(D,open,point(0,0)).                 %%POSICION DE LA VENTANA




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DISCO EMBRAGUE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


diagnostico('         FALLA EN EL DISCO DE EMBRAGUE

  SOLUCION:

  CAMBIAR DISCO DE EMBRAGUE

  En primer lugar, hay que vaciar al completo el aceite de la moto. Para ello, debes retirar
  los tornillos de cierre del dep�sito. A veces, est�n un poco encajados, por lo que es probable
        que tengas que darle unos peque�os golpes para que cedan. Ser� la manera en la que el l�quido
  del aceite vaya saliendo poco a poco. Tras esto, hay que soltar y desmontar la tapa del embrague.
  Se afloja el cable que tiene y se retira para sustituirlo luego por otro.


  Una vez hayas retirado la tapa, ser� necesario limpiar los restos de aceite que hayan podido quedar.
  A continuaci�n se extraen los muelles del embrague. Esto se puede hacer f�cilmente con las manos aunque,
  si est�n un poco duros, es aconsejable emplear alguna peque�a herramienta de ayuda.


  Al retirar los muelles del embrague podr�s ver los discos. Lo �nico que tienes que hacer ahora es retirar
  los discos viejos y sustituirlos por los nuevos. Es muy importante que se hayan sumergido previamente en
  aceite de motor durante al menos 4 o 5 horas. De esta forma, una vez los cambies funcionar�n a pleno
  rendimiento desde el primer momento.

  Para terminar solo tienes que volver a colocar todas las piezas (muelles, tapa del embrague, cable y aceite)
  de la misma manera en la que estaban colocadas anteriormente.'):-embrague,!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ACEITE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diagnostico('
        FALLA POR FALTA DE CAMBIO DE ACEITE

  SOLUCION:

  REALIZAR UN CAMBIO DE ACEITE AL MOTOR DE LA MOTO

  El primer paso para cambiar el aceite de la moto consiste en acceder al dep�sito del mismo
  Una vez que ya tengas acceso al dep�sito para cambiar el aceite de la moto, ver�s que hay
  dos tapones. Uno es el de vaciado, en la parte inferior, y el otro el de llenado, en la superior.
  A continuaci�n, coloca un recipiente debajo de la moto que te permita recoger el aceite viejo.
  Despu�s, procede a quitar el tap�n de vaciado Pasados unos minutos, cuando ya no caiga m�s aceite
  del dep�sito, retira la bandeja de recogida y aparta el aceite viejo para reciclarlo
  Ahora, ya puedes cambiar el aceite de la moto colocando el nuevo en el dep�sito a trav�s del tap�n
  de llenado y con un embudo.
  Cierra, por �ltimo, el tap�n de llenado, cercior�ndote de que queda bien fijo para evitar fugas.'):-aceite,!.

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ANILLAS PISTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diagnostico('
        FALLA EN LAS ANILLAS DEL PISTON

    SOLUCION:

    LLEVAR LA MOTOCLICLETA AL TALLER MAS CERCANO, PARA UN CAMBIO EN LAS ANILLAS DEL PISTON, REVISION DE CILINDRO
    Y REGULACION DE VALVULAS. '):-anillapiston,!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FRENOS LIQUIDO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


diagnostico('       FALLA POR FALTA DE LIQUIDO DE FRENOS

    SOLUCION:

    REALIZAR UN CAMBIO DE LIQUIDO DE FRENOS
    - Coloca la moto sobre su soporte de apoyo para que no pierda el equilibrio.

    - Desatornilla el compartimiento del dep�sito del l�quido para frenos.

    - Desatornilla la v�lvula de drenaje que se encuentra en el c�liper de freno.

    - Coloca una manguera en la boca de la v�lvula para que recojas el l�quido que se va a drenar.

    - Bombea el l�quido de frenos, accionando la palanca de freno del manubrio para drenarlo,
      pero sin vaciar por completo el compartimiento.

    - Ve reponiendo el l�quido de frenos con uno nuevo a medida que se vaya drenando, para evitar
      que entre aire en el compartimiento, si entrara aire al dep�sito podr�amos romper la resecar los
      retenes y da�ar las t�ricas de la bomba de freno.

    - Observa que el l�quido de frenos viejo haya sido expulsado completamente.
    - Cierra la v�lvula de vaciado y rellena con el liquido nuevo hasta el nivel deseado para luego
      cerrar el compartimiento del l�quido de frenos.

      Muy importante! cuando tengamos el l�quido sustitu�do y para que la bomba tenga presi�n debemos
      de aflojar los latiguillos, accionar la maneta de freno y sin soltar la maneta de freno apretar
      el latiguillo, de esa forma hemos quitado el aire del latiguillo de freno y
      la bomba "coger� presi�n", as� varias veces.

      Recuerda de limpiar correctamente la zona de la moto donde has trabajado con el l�quido de frenos
      ya que en algunos casos puede ser corrosivo para la pintura de las tapas.
      Con estos sencillos pasos habr�s completado la operaci�n de cambio de l�quido de frenos en tu moto.
      '):-liquidofrenos,!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRANSMISION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


diagnostico('         FALLA EN LA TRANSMISION DE LA MOTOCICLETA
    SOLUCION:

    CAMBIAR KIT COMPLETO DE TRANSMISION
    � Quitar el eslab�n maestro y la cadena con la ayuda de unos alicates retiraremos el clip del eslab�n maestro
    y la placa lateral de la cadena. Retiramos el eslab�n maestro y quitaremos la cadena

    � Retirar el pi��n viejo e instalar el nuevo
    Con ayuda de los alicates de punta fina, retiraremos el clip de retenci�n que sujeta el pi��n en su posici�n.
    Una vez retirado este clip, procederemos a extraer el pi��n.
    Con la ayuda del limpiacontactos limpiaremos todo el �rea. No aseguraremos de que la superficie queda libre
    de polvo y grasa.
    Tras limpiar profundamente la zona, instalaremos el nuevo pi��n junto con el clip de retenci�n, asegur�ndonos
    que ambas piezas se ajustan de manera correcta.

    � Retirar el neum�tico trasero
    Afloja los pernos de la rueda trasera lo suficiente para que sea mas sencillo retirar la llanta.
    Aflojaremos la tuerca del eje, retiraremos el eje y el neum�tico trasero.

    � Retirar la corona dentada trasera
    Con la ayuda de una llave Allen retiraremos los tornillos que sujetan la corona a la rueda trasera Una vez
    hemos retirado todos los tornillos,con suavidad levantaremos la corona de dientes para extraerla de su posici�n.

    � Sustituir la corona
    Limpiaremos la zona utilizando limpiador de contactos y un pa�o limpio y seco.
    A continuaci�n insertaremos la corona nueva en su posici�n.
    Aplicaremos una peque�a cantidad de fijador de tornillos en a medida que vamos asegurando la corona.
    Instalaremos el tornillo a trav�s de cada uno de los agujeros junto con su arandela y su tuerca.
    Continua apretando los tornillos siguiendo el patr�n de la siguiente fotograf�a para asegurarte que la
    corona se ajusta de manera uniforme a la llanta.
    Una vez que tanto la corona como el pi��n est�n ajustadas, utiliza una llave dinamom�trica para terminar
    de ajustarlas al par correcto. Para ello utiliza el manual de taller de tu motocicleta.

    � Reinstalar el neum�tico trasero
    Colocaremos el neum�tico trasero en su posici�n e insertaremos el eje. Ya que tenemos el eje desmontado
    es conveniente engrasarlo y volver a montarlo.

    � Instala la cadena nueva
    Mant�n la cadena en su posici�n con la rueda trasera y luego enr�llala alrededor del pi��n delantero.
    Nota: Es posible que la cadena no ajuste perfectamente. Para subsanar este problema,
    podemos simplemente utilizar la cadena vieja como referencia y medir la longitud de ambas para saber
    por d�nde es necesario cortar, luego instalar el eslabon.'):-transmision,!.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HORQUILLA TELESCOPIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


diagnostico('
            FALLA EN LA HORQUILLA TELESCOPICA
    SOLUCION:

    CAMBIAR RETENES DE HORQUILLA (TELESCOPIO)
    Afloja los dos tornillos que sujetan las barras de la horquilla al chasis y las tapas de cada barra. Luego,
    afloja los tornillos de la pinza de freno y el eje frontal completo de la motocicleta.
    Coloca la motocicleta en cambio y calza la rueda trasera.
    Levanta la rueda delantera del suelo cuanto sea necesario.
    Quita las pinzas de freno, el guardabarros, la rueda delantera y cualquier otro cable que cuelgue.

    Desmonta la horquilla.
    Afloja los tornillos un poco m�s y tira de la horquilla hacia abajo mientras la giras.
    Quita la tapa de la horquilla con cuidado. Ten cuidado porque la horquilla tiene un resorte. No te pongas cerca
    de la tapa cuando la quites.
    Quita el resorte y deja que el aceite se drene en una cubeta.
    Utiliza una herramienta para llegar hasta la barra del amortiguador y liberarlo.
    Memoriza el ensamblaje del muelle de suspensi�n, las arandelas y los separadores para que sea m�s f�cil volver a
    instalarlo.

    Quita el ret�n antiguo.
    Calza el amortiguador en la barra de la horquilla.
    Busca el ret�n de la horquilla. Est� sostenido con una pinza dentro de una ranura.
    Observa el ret�n minuciosamente.
    Enjuaga el �rea para quitar los desechos que est�n dentro de la horquilla.
    Agarra el tubo con una mano y el montante con la otra. Usa la fuerza para separarlos. Ver�s que el ret�n sale
    mientras lo haces.

    Prepara la horquilla para colocar el nuevo ret�n.
    Quita todo el �xido y repara las imperfecciones que hicieron que el ret�n anterior tuviera p�rdidas.
    Empapa un trapo con aceite y limpia la zona donde estaba el ret�n.

    Instala el nuevo ret�n.
    Frota con aceite la parte interna del nuevo ret�n.
    Coloca el ret�n arriba del montante y desl�zalo para instalarlo en el lugar correcto.
    Coloca el ret�n con un conductor de sello. De esta forma, podr�s colocar el sellador con cuidado y quedar� firme.

    Coloca la horquilla en su lugar.
    Coloca la pinza y el amortiguador en la horquilla. Instala la varilla del amortiguador.
    Vierte el aceite en la horquilla nueva y mide el nivel.
    Instala nuevamente el resorte y los tornillos de la tapa de la horquilla. Ajusta los tornillos.

    Repite el proceso con la otra barra de la horquilla.
    Arma nuevamente la parte delantera de la motocicleta.'):-horquillatelescopio,!.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BATERIA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

diagnostico('
            FALLA EN LA BATERIA

    SOLUCION:

    REEMPLAZAR BATERIA

    Lo primero que tienes que hacer es localizar la bateria.
    La mayor parte de los modelos la tienen debajo del asiento y otras lo
    llevan debajo del dep�sito del combustible, pero lo m�s sencillo es que consultes el manual de tu veh�culo
    para cerciorarte.
    Para acceder a la bater�a, tendr�s que o bien retirar las tapas laterales o bien levantar el asiento. Una vez
    que la tengas a la vista, deber�s comprobar que la numeraci�n de la misma es parecida a la de la bater�a que
    vas a colocar nueva, que puedes comprar en una tienda especializada

    Ahora, tendr�s que desconectar los bornes de la bater�a para poder extraerla. En primer lugar deber�s retirar
    el que lleva el s�mbolo "-" y, a continuaci�n, el del s�mbolo "+". En funci�n del tipo de bater�a, para poder
    extraerla, tambi�n tendr�s que retirar una sujeci�n.

    Una vez que ya tienes la bater�a fuera de la moto, llega el momento de colocar la nueva. Ahora, tendr�s que
    hacer el proceso a la inversa, es decir, en primer lugar tienes que conectar el borne positivo y, a continuaci�n,
    el negativo.

    Ahora, ya solo te toca volver a colocar el asiento o las placas de protecci�n y ya habr�s cambiado la bater�a de
    tu moto. En todo caso, si consideras que no tienes la destreza o los conocimientos suficientes para hacerlo,
    conf�a en un profesional para realizar la operaci�n. '):-bateria,!.





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RESPUESTAS
diagnostico('
            FALLA EN LA BATERIA

    SOLUCION:

    REEMPLAZAR BATERIA

    Lo primero que tienes que hacer es localizar la bateria.
    La mayor parte de los modelos la tienen debajo del asiento y otras lo
    llevan debajo del dep�sito del combustible, pero lo m�s sencillo es que consultes el manual de tu veh�culo
    para cerciorarte.
    Para acceder a la bater�a, tendr�s que o bien retirar las tapas laterales o bien levantar el asiento. Una vez
    que la tengas a la vista, deber�s comprobar que la numeraci�n de la misma es parecida a la de la bater�a que
    vas a colocar nueva, que puedes comprar en una tienda especializada

    Ahora, tendr�s que desconectar los bornes de la bater�a para poder extraerla. En primer lugar deber�s retirar
    el que lleva el s�mbolo "-" y, a continuaci�n, el del s�mbolo "+". En funci�n del tipo de bater�a, para poder
    extraerla, tambi�n tendr�s que retirar una sujeci�n.

    Una vez que ya tienes la bater�a fuera de la moto, llega el momento de colocar la nueva. Ahora, tendr�s que
    hacer el proceso a la inversa, es decir, en primer lugar tienes que conectar el borne positivo y, a continuaci�n,
    el negativo.

    Ahora, ya solo te toca volver a colocar el asiento o las placas de protecci�n y ya habr�s cambiado la bater�a de
    tu moto. En todo caso, si consideras que no tienes la destreza o los conocimientos suficientes para hacerlo,
    conf�a en un profesional para realizar la operaci�n. '):-bateria1,!.



diagnostico('
            FALLA EN LA HORQUILLA TELESCOPICA
    SOLUCION:

    CAMBIAR RETENES DE HORQUILLA (TELESCOPIO)
    Afloja los dos tornillos que sujetan las barras de la horquilla al chasis y las tapas de cada barra. Luego,
    afloja los tornillos de la pinza de freno y el eje frontal completo de la motocicleta.
    Coloca la motocicleta en cambio y calza la rueda trasera.
    Levanta la rueda delantera del suelo cuanto sea necesario.
    Quita las pinzas de freno, el guardabarros, la rueda delantera y cualquier otro cable que cuelgue.

    Desmonta la horquilla.
    Afloja los tornillos un poco m�s y tira de la horquilla hacia abajo mientras la giras.
    Quita la tapa de la horquilla con cuidado. Ten cuidado porque la horquilla tiene un resorte. No te pongas cerca
    de la tapa cuando la quites.
    Quita el resorte y deja que el aceite se drene en una cubeta.
    Utiliza una herramienta para llegar hasta la barra del amortiguador y liberarlo.
    Memoriza el ensamblaje del muelle de suspensi�n, las arandelas y los separadores para que sea m�s f�cil volver a
    instalarlo.

    Quita el ret�n antiguo.
    Calza el amortiguador en la barra de la horquilla.
    Busca el ret�n de la horquilla. Est� sostenido con una pinza dentro de una ranura.
    Observa el ret�n minuciosamente.
    Enjuaga el �rea para quitar los desechos que est�n dentro de la horquilla.
    Agarra el tubo con una mano y el montante con la otra. Usa la fuerza para separarlos. Ver�s que el ret�n sale
    mientras lo haces.

    Prepara la horquilla para colocar el nuevo ret�n.
    Quita todo el �xido y repara las imperfecciones que hicieron que el ret�n anterior tuviera p�rdidas.
    Empapa un trapo con aceite y limpia la zona donde estaba el ret�n.

    Instala el nuevo ret�n.
    Frota con aceite la parte interna del nuevo ret�n.
    Coloca el ret�n arriba del montante y desl�zalo para instalarlo en el lugar correcto.
    Coloca el ret�n con un conductor de sello. De esta forma, podr�s colocar el sellador con cuidado y quedar� firme.

    Coloca la horquilla en su lugar.
    Coloca la pinza y el amortiguador en la horquilla. Instala la varilla del amortiguador.
    Vierte el aceite en la horquilla nueva y mide el nivel.
    Instala nuevamente el resorte y los tornillos de la tapa de la horquilla. Ajusta los tornillos.

    Repite el proceso con la otra barra de la horquilla.
    Arma nuevamente la parte delantera de la motocicleta.'):-horquillatelescopio1,!.



diagnostico('         FALLA EN LA TRANSMISION DE LA MOTOCICLETA
    SOLUCION:

    CAMBIAR KIT COMPLETO DE TRANSMISION
    � Quitar el eslab�n maestro y la cadena con la ayuda de unos alicates retiraremos el clip del eslab�n maestro
    y la placa lateral de la cadena. Retiramos el eslab�n maestro y quitaremos la cadena

    � Retirar el pi��n viejo e instalar el nuevo
    Con ayuda de los alicates de punta fina, retiraremos el clip de retenci�n que sujeta el pi��n en su posici�n.
    Una vez retirado este clip, procederemos a extraer el pi��n.
    Con la ayuda del limpiacontactos limpiaremos todo el �rea. No aseguraremos de que la superficie queda libre
    de polvo y grasa.
    Tras limpiar profundamente la zona, instalaremos el nuevo pi��n junto con el clip de retenci�n, asegur�ndonos
    que ambas piezas se ajustan de manera correcta.

    � Retirar el neum�tico trasero
    Afloja los pernos de la rueda trasera lo suficiente para que sea mas sencillo retirar la llanta.
    Aflojaremos la tuerca del eje, retiraremos el eje y el neum�tico trasero.

    � Retirar la corona dentada trasera
    Con la ayuda de una llave Allen retiraremos los tornillos que sujetan la corona a la rueda trasera Una vez
    hemos retirado todos los tornillos,con suavidad levantaremos la corona de dientes para extraerla de su posici�n.

    � Sustituir la corona
    Limpiaremos la zona utilizando limpiador de contactos y un pa�o limpio y seco.
    A continuaci�n insertaremos la corona nueva en su posici�n.
    Aplicaremos una peque�a cantidad de fijador de tornillos en a medida que vamos asegurando la corona.
    Instalaremos el tornillo a trav�s de cada uno de los agujeros junto con su arandela y su tuerca.
    Continua apretando los tornillos siguiendo el patr�n de la siguiente fotograf�a para asegurarte que la
    corona se ajusta de manera uniforme a la llanta.
    Una vez que tanto la corona como el pi��n est�n ajustadas, utiliza una llave dinamom�trica para terminar
    de ajustarlas al par correcto. Para ello utiliza el manual de taller de tu motocicleta.

    � Reinstalar el neum�tico trasero
    Colocaremos el neum�tico trasero en su posici�n e insertaremos el eje. Ya que tenemos el eje desmontado
    es conveniente engrasarlo y volver a montarlo.

    � Instala la cadena nueva
    Mant�n la cadena en su posici�n con la rueda trasera y luego enr�llala alrededor del pi��n delantero.
    Nota: Es posible que la cadena no ajuste perfectamente. Para subsanar este problema,
    podemos simplemente utilizar la cadena vieja como referencia y medir la longitud de ambas para saber
    por d�nde es necesario cortar, luego instalar el eslabon.'):-transmision1,!.



diagnostico('       FALLA POR FALTA DE LIQUIDO DE FRENOS

    SOLUCION:

    REALIZAR UN CAMBIO DE LIQUIDO DE FRENOS
    - Coloca la moto sobre su soporte de apoyo para que no pierda el equilibrio.

    - Desatornilla el compartimiento del dep�sito del l�quido para frenos.

    - Desatornilla la v�lvula de drenaje que se encuentra en el c�liper de freno.

    - Coloca una manguera en la boca de la v�lvula para que recojas el l�quido que se va a drenar.

    - Bombea el l�quido de frenos, accionando la palanca de freno del manubrio para drenarlo,
      pero sin vaciar por completo el compartimiento.

    - Ve reponiendo el l�quido de frenos con uno nuevo a medida que se vaya drenando, para evitar
      que entre aire en el compartimiento, si entrara aire al dep�sito podr�amos romper la resecar los
      retenes y da�ar las t�ricas de la bomba de freno.

    - Observa que el l�quido de frenos viejo haya sido expulsado completamente.
    - Cierra la v�lvula de vaciado y rellena con el liquido nuevo hasta el nivel deseado para luego
      cerrar el compartimiento del l�quido de frenos.

      Muy importante! cuando tengamos el l�quido sustitu�do y para que la bomba tenga presi�n debemos
      de aflojar los latiguillos, accionar la maneta de freno y sin soltar la maneta de freno apretar
      el latiguillo, de esa forma hemos quitado el aire del latiguillo de freno y
      la bomba "coger� presi�n", as� varias veces.

      Recuerda de limpiar correctamente la zona de la moto donde has trabajado con el l�quido de frenos
      ya que en algunos casos puede ser corrosivo para la pintura de las tapas.
      Con estos sencillos pasos habr�s completado la operaci�n de cambio de l�quido de frenos en tu moto.
      '):-liquidofrenos1,!.


diagnostico('
        FALLA POR FALTA DE CAMBIO DE ACEITE

  SOLUCION:

  REALIZAR UN CAMBIO DE ACEITE AL MOTOR DE LA MOTO

  El primer paso para cambiar el aceite de la moto consiste en acceder al dep�sito del mismo
  Una vez que ya tengas acceso al dep�sito para cambiar el aceite de la moto, ver�s que hay
  dos tapones. Uno es el de vaciado, en la parte inferior, y el otro el de llenado, en la superior.
  A continuaci�n, coloca un recipiente debajo de la moto que te permita recoger el aceite viejo.
  Despu�s, procede a quitar el tap�n de vaciado Pasados unos minutos, cuando ya no caiga m�s aceite
  del dep�sito, retira la bandeja de recogida y aparta el aceite viejo para reciclarlo
  Ahora, ya puedes cambiar el aceite de la moto colocando el nuevo en el dep�sito a trav�s del tap�n
  de llenado y con un embudo.
  Cierra, por �ltimo, el tap�n de llenado, cercior�ndote de que queda bien fijo para evitar fugas.'):-aceite1,!.


diagnostico('
        FALLA EN LAS ANILLAS DEL PISTON

    SOLUCION:

    LLEVAR LA MOTOCLICLETA AL TALLER MAS CERCANO, PARA UN CAMBIO EN LAS ANILLAS DEL PISTON, REVISION DE CILINDRO
    Y REGULACION DE BALBULAS. '):-anillapiston1,!.



diagnostico('         FALLA EN EL DISCO DE EMBRAGUE

  SOLUCION:

  CAMBIAR DISCO DE EMBRAGUE

  En primer lugar, hay que vaciar al completo el aceite de la moto. Para ello, debes retirar
  los tornillos de cierre del dep�sito. A veces, est�n un poco encajados, por lo que es probable
        que tengas que darle unos peque�os golpes para que cedan. Ser� la manera en la que el l�quido
  del aceite vaya saliendo poco a poco. Tras esto, hay que soltar y desmontar la tapa del embrague.
  Se afloja el cable que tiene y se retira para sustituirlo luego por otro.


  Una vez hayas retirado la tapa, ser� necesario limpiar los restos de aceite que hayan podido quedar.
  A continuaci�n se extraen los muelles del embrague. Esto se puede hacer f�cilmente con las manos aunque,
  si est�n un poco duros, es aconsejable emplear alguna peque�a herramienta de ayuda.


  Al retirar los muelles del embrague podr�s ver los discos. Lo �nico que tienes que hacer ahora es retirar
  los discos viejos y sustituirlos por los nuevos. Es muy importante que se hayan sumergido previamente en
  aceite de motor durante al menos 4 o 5 horas. De esta forma, una vez los cambies funcionar�n a pleno
  rendimiento desde el primer momento.

  Para terminar solo tienes que volver a colocar todas las piezas (muelles, tapa del embrague, cable y aceite)
  de la misma manera en la que estaban colocadas anteriormente.'):-embrague1,!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555




diagnostico('       NO SE ENCONTRO LA FALLA

    no se a encontrado la falla, lleve o consulte en el taller mecanico de motocicleta
    mas cercano de su ciudad.

    MUCHAS GRACIAS POR USAR EL DIAGNOSTICO DE MOTOCICLETA').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PREGUNTAS DE LAS OPCIONES POSIBLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CODIGO PREGUNTA



embrague:-opcion_1,opcion_1_1,opcion_1_2,opcion_1_3,opcion_1_4,opcion_1_5.
embrague:-opcion_1_1,opcion_1_2,opcion_1_3,opcion_1_4,opcion_1_5.
embrague:-opcion_1_2,opcion_1_3,opcion_1_4,opcion_1_5.
embrague:-opcion_1_3,opcion_1_4,opcion_1_5.
embrague:-opcion_1_4,opcion_1_5.
embrague:-opcion_1_5.

aceite:-opcion_2,opcion_2_1,opcion_2_2.
aceite:-opcion_2_1,opcion_2_2.
aceite:-opcion_2_2.

anillapiston:-opcion_3,opcion_3_1,opcion_3_2,opcion_3_3.
anillapiston:-opcion_3_1,opcion_3_2,opcion_3_3.
anillapiston:-opcion_3_2,opcion_3_3.
anillapiston:-opcion_3_3.

liquidofrenos:-opcion_4,opcion_4_1,opcion_4_2.
liquidofrenos:-opcion_4_1,opcion_4_2.
liquidofrenos:-opcion_4_2.

transmision:-opcion_5,opcion_5_1,opcion_5_2.
transmision:-opcion_5_1,opcion_5_2.
transmision:-opcion_5_2.

horquillatelescopio:-opcion_6,opcion_6_1.
horquillatelescopio:-opcion_6_1.

bateria:-opcion_7,opcion_7_1,opcion_7_2,opcion_7_3.
bateria:-opcion_7_1,opcion_7_2,opcion_7_3.
bateria:-opcion_7_2,opcion_7_3.
bateria:-opcion_7_3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CODIGO PREGUNTA%%%%

bateria1:-opcion_7;opcion_7_1;opcion_7_2;opcion_7_3.
horquillatelescopio1:-opcion_6,opcion_6_1.
transmision1:-opcion_5,opcion_5_1,opcion_5_2.
liquidofrenos1:-opcion_4;opcion_4_1;opcion_4_2.
anillapiston1:-opcion_3;opcion_3_1;opcion_3_2;opcion_3_3.
aceite1:-opcion_2;opcion_2_1;opcion_2_2.
embrague1:-opcion_1;opcion_1_1;opcion_1_2;opcion_1_3;opcion_1_4;opcion_1_5.





opcion_1:-pregunta('- �le toma esfuerzo arrancar al motor?'),!.

opcion_1_1:- pregunta('- �la moto perdio potencia?'),!.

opcion_1_2:- pregunta('- �al cambiar de caja, siente como raspa algo en el motor?'),!.

opcion_1_3:- pregunta('- �al cambiar de marcha el motor aumenta las revoluciones pero no la velocidad?'),!.

opcion_1_4:- pregunta('- �tiene dificultad a la hora de meter las marchas.?'),!.

opcion_1_5:- pregunta('- �al partir, siente un jaloneo brusco?'),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%% FALLA DE FALTA DE ACEITE EN LA MOTOCICLETA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opcion_2:-pregunta('-�el motor se escucha ruidoso?'),!.

opcion_2_1:-  pregunta('-�la moto presenta fuga de aceite?'),!.

opcion_2_2:-  pregunta('-�el motor se apago y ya no enciende?'),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%% FALLA DE ANILLA DE PISTON DA�ADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opcion_3:-    pregunta('�tu motocicleta esta humeando por el escape?'),!.

opcion_3_1:-  pregunta('-�se gasta mas rapido el aceite?'),!.

opcion_3_2:-  pregunta('-�a notado que su motocicleta tiene una aceleraci�n y un rendimiento deficiente?'),!.

opcion_3_3:-  pregunta('-�la motocicleta tiene menos potencia?'),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%% FALLA POR FALTA DE LIQUIDO DE FRENOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opcion_4:-pregunta('�presentas problemas al frenar?'),!.

opcion_4_1:-pregunta('-�ruidos o chillidos al frenar?'),!.

opcion_4_2:-pregunta('-�apretas m�s en�rgicamente que antes los frenos para conseguir una misma capacidad de frenado'),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%% FALLA EN LA TRANSMISION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


opcion_5:-pregunta('-�los tensores de la cadena llegan al final del recorrido, y ya no se pueden tensar mas?'),!.

opcion_5_1:-  pregunta('-�la parte de la cadena de tu moto presenta ruido?'),!.

opcion_5_2:- pregunta('-�los dientes de la corona estan afilados o inclinados hacia delante?'),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%% FALLA EN LA SUSPENCION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opcion_6:-pregunta('-�sientes mas los baches que antes?'),!.

opcion_6_1:- pregunta('-�el telescopio se encuentra sudando(derramando aceite por los retenes)?'),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%% FALLA BATERIA AGOTADA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


opcion_7:-pregunta('-�iluminacion de los faroles bajo?'),!.

opcion_7_1:-pregunta('-�desgaste o siente que no carga la bateria?'),!.

opcion_7_2:-pregunta('-�le cuesta encender o no enciende la motocicleta?'),!.

opcion_7_3:-pregunta('-�la bateria es ya es muy vieja?'),!.


%%%%%%%%%%%%%%%%%%%%%%%%% LA DINAMICA PARA CREAR LA INTERFAZ DE LAS PREGUNTAS A RESPONDER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-dynamic si/1,no/1.
preguntar(Problema):-new(Di,dialog('DIAGNOSTICO MOTORIZADO')),
  new(L2,label(texto,'RESPONDE LAS SIGUIENTES PREGUNTAS...   ')),
  new(La,label(prob,Problema)),
  new(B1,button(si,and(message(Di,return,si)))),
  new(B2,button(no,and(message(Di,return,no)))),
        send(Di,append(L2)),
  send(Di,append(La)),
  send(Di,append(B1)),
  send(Di,append(B2)),
  send(Di,default_button,si),
  send(Di,open_centered),get(Di,confirm,Answer),
  write(Answer),send(Di,destroy),

     (( Answer==si)->assert(si(Problema)); assert(no(Problema)),fail).


pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar:-retract(si(_)),fail.
limpiar:-retract(no(_)),fail.
limpiar.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

botones:- lim,
  send(@boton,free), % limpiar boton diagnostico
  send(@btnseguridad,free),
  diagnostico(Enfer),
  send(@respl,selection(Enfer)),


  new(@boton,button('Iniciar el diagnostico',message(@prolog,botones))),
  send(Menu,display,@boton,point(40,50)),
  send(Menu,display,@btnseguridad,point(20,50)),
  limpiar.
lim:- send(@respl,selection(' ')).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MATERIA INF-318 %%%%% PROGRAMACION  LOGICA Y FUNCIONAL%%%%% INGENIERIA INFORMATICA  %%%%%%%%%%%%%%%





