%%%%%%%%%%%%%%%%INTERFAS PARA INICIALIZAR LAS IMAGENES ECT.%%%%%%%%%%%%%%%%%%%%%%

 :- use_module(library(pce)).
 :- pce_image_directory('./imagenes').
 :- use_module(library(pce_style_item)).
 :- dynamic color/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PARA COLOCAR LAS IMAGENES%%%%%%%%%%%%%%%%%%%%%%%%%/

 resource(img_principal, image, image('img_principal.jpg')).
 resource(fondo1, image, image('fondo1.jpg')).
 resource(puntos_100, image, image('paco.jpg')).
 resource(vejiga_natatoria, image, image('trat_vejiga.jpg')).
 resource(puntos_80, image, image('polici.jpg')).
 resource(puntos_60, image, image('veve.jpg')).
 resource(puntos_40, image, image('mauri.jpg')).
 resource(puntos_0, image, image('desconocido.jpg')).
 resource(aagresibo, image, image('aagresibo.jpg')).
 resource(tractor, image, image('tractor.jpg')).
 resource(viento, image, image('viento.jpg')).
 %%resource(puente, image, image('puente.jpg')).
 resource(equilibrio, image, image('equilibrio.jpg')).
 resource(segundo, image, image('segundo.jpg')).
 resource(mst, image, image('mst.jpg')).
 resource(gasolina, image, image('gasolina.jpg')).
 resource(pacito, image, image('pacito.jpg')).
 resource(semaforo, image, image('semaforo.jpg')).
 resource(auto, image, image('auto.jpg')).
 resource(vicii, image, image('vicii.jpg')).
 resource(bifurcacion, image, image('bifurcacion.jpg')).
 resource(bifurcacion_t, image, image('bifurcacion_t.jpg')).
 resource(calzada, image, image('calzada.jpg')).
 resource(calzada_r, image, image('calzada_r.jpg')).
 resource(camino, image, image('camino.jpg')).
 resource(cruz, image, image('cruz.jpg')).
 resource(trenes, image, image('trenes.jpg')).
 resource(curva, image, image('curva.jpg')).
 resource(izqierda, image, image('izqierda.jpg')).
 resource(derecha, image, image('derecha.jpg')).
 resource(curva_s, image, image('curva_s.jpg')).
 resource(zona, image, image('zona.jpg')).
 resource(escuela, image, image('escuela.jpg')).
 resource(estrechamiento, image, image('estrechamiento.jpg')).
 resource(estrechamiento_i, image, image('estrechamiento_i.jpg')).
 resource(estrechamiento_a, image, image('estrechamiento_a.jpg')).
 resource(silla, image, image('silla.jpg')).
 resource(zona_fin, image, image('zona_fin.jpg')).
 resource(puente, image, image('puente.jpg')).
 resource(piedra, image, image('piedra.jpg')).
 resource(tunel, image, image('tunel.jpg')).
 resource(pendiente, image, image('pendiente.jpg')).
 resource(pendiente_b, image, image('pendiente_b.jpg')).
 resource(doble, image, image('doble.jpg')).
 resource(jugar, image, image('jugar.jpg')).
 resource(rojo, image, image('rojo.jpg')).
 resource(seda, image, image('seda.jpg')).
 resource(doblee, image, image('doblee.jpg')).
 resource(diree, image, image('diree.jpg')).
 resource(giroo, image, image('giroo.jpg')).
 resource(limite_a, image, image('limite_a.jpg')).
 resource(limite_an, image, image('limite_an.jpg')).
 resource(limite_l, image, image('limite_l.jpg')).
 resource(limite_p, image, image('limite_p.jpg')).
 resource(limite_v, image, image('limite_v.jpg')).
 resource(limite_vi, image, image('limite_vi.jpg')).
 resource(proibido, image, image('proibido.jpg')).
 resource(proibido_e, image, image('proibido_e.jpg')).
 resource(proibido_es, image, image('proibido_es.jpg')).
 resource(proibido_ese, image, image('proibido_ese.jpg')).
 resource(proibido_esee, image, image('proibido_esee.jpg')).
 resource(proibido_c, image, image('proibido_c.jpg')).
 resource(proibido_cu, image, image('proibido_cu.jpg')).
 resource(proibido_pa, image, image('proibido_pa.jpg')).
 resource(proibido_ob, image, image('proibido_ob.jpg')).
 resource(proibido_obb, image, image('proibido_obb.jpg')).
 resource(proibido_adel, image, image('proibido_adel.jpg')).
 resource(caballo, image, image('caballo.jpg')).
 resource(autooo, image, image('autooo.jpg')).
 resource(viciio, image, image('viciio.jpg')).
 resource(motoo, image, image('motoo.jpg')).
 resource(avance, image, image('avance.jpg')).
 resource(circular, image, image('circular.jpg')).
 resource(pesadito, image, image('pesadito.jpg')).
 resource(pesaditoo, image, image('pesaditoo.jpg')).
 resource(gomeria, image, image('gomeria.jpg')).

 
 



%%%%%%%%%%%%%%%%%HACER LLAMADOS DE IMAGNES Y MOSTRARLO EN PANTALLA%%%%%%%%%%%%%%%%%%%%%%%% 

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


 %%%%%%%%%%%%%%%%%%%%%%%%%%%% BOTONES DEL PROYECTO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  botones:-borrado,
                send(@boton, free),
                send(@btntratamiento,free),
                mostrar_diagnostico(Enfermedad),
                send(@texto, selection('SU CONOCIMIENTO ES:')),
                send(@resp1, selection(Enfermedad)),
                new(@boton, button('Iniciar consulta',
                message(@prolog, botones)
                )),

                new(@btntratamiento,button('VER RESULTADO',
                message(@prolog, mostrar_tratamiento,Enfermedad)
                )),
                send(@main, display,@boton,point(20,450)),
                send(@main, display,@btntratamiento,point(138,450)).



  mostrar_tratamiento(X):-new(@tratam, dialog('Tratamiento')),
                          send(@tratam, append, label(nombre, 'Explicacion: ')),
                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@tratam, display,@lblExp2,point(50,80)),
                          tratamiento(X),
                          send(@tratam, transient_for, @main),
                          send(@tratam, open_centered).

tratamiento(X):- send(@lblExp1,selection('DE ACUERDO AL TEST SU CONOCIMIENTO DE SEÑALES DE TRANSITO ES:')),
                 mostrar_imagen_tratamiento(@tratam,X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   preguntar(Preg,Resp):-new(Di,dialog('Colsultar Datos:')),
                        new(L2,label(texto,'Responde las siguientes preguntas')),
                        id_imagen_preg(Preg,Imagen),
                        imagen_pregunta(Di,Imagen),
                        new(La,label(prob,Preg)),
                        new(B1,button(si,and(message(Di,return,si)))),
                        new(B2,button(no,and(message(Di,return,no)))),
                        send(Di, gap, size(25,25)),
                        send(Di,append(L2)),
                        send(Di,append(La)),
                        send(Di,append(B1)),
                        send(Di,append(B2)),
                        send(Di,default_button,'si'),
                        send(Di,open_centered),get(Di,confirm,Answer),
                        free(Di),
                        Resp=Answer.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  interfaz_principal:-new(@main,dialog('TEST DE INFRACCIONES DE SEÑALES DE TRANSITO',
        size(1000,1000))),
        new(@texto, label(nombre,'SU CONOCIMIENTO ES:',font('times','roman',18))),
        new(@resp1, label(nombre,'',font('times','roman',22))),
        new(@lblExp1, label(nombre,'',font('times','roman',14))),
        new(@lblExp2, label(nombre,'',font('times','roman',14))),
        new(@salir,button('SALIR',and(message(@main,destroy),message(@main,free)))),
        new(@boton, button('Iniciar consulta',message(@prolog, botones))),

        new(@btntratamiento,button('¿Tratamiento?')),

        nueva_imagen(@main, img_principal),
        send(@main, display,@boton,point(138,450)),
        send(@main, display,@texto,point(20,130)),
        send(@main, display,@salir,point(300,450)),
        send(@main, display,@resp1,point(20,180)),
        send(@main,open_centered).

       borrado:- send(@resp1, selection('')).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  crea_interfaz_inicio:- new(@interfaz,dialog('TEST DE INFRACCIONES DE SEÑALES DE TRANSITO',
  size(1000,1000))),

  mostrar_imagen(@interfaz, fondo1),

  new(BotonComenzar,button('COMENZAR',and(message(@prolog,interfaz_principal) ,
  and(message(@interfaz,destroy),message(@interfaz,free)) ))),
  new(BotonSalir,button('SALIDA',and(message(@interfaz,destroy),message(@interfaz,free)))),
  send(@interfaz,append(BotonComenzar)),
  send(@interfaz,append(BotonSalir)),
  send(@interfaz,open_centered).

  :-crea_interfaz_inicio.



%%%%%%%%%%%%%%%PREGUNTAS DEL PREYECTO AQUI VIENE TODAS LAS PREGUNTA QUE DESEA PREGUNTAR AL USUARIO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


conocimiento('puntos_100',
['Animales sueltos: alerta de presencia de animales en la vía, ubicada en zonas rurales. 
Se la puede encontrar con otra imagen como una vaca o alce. También puede indicar "Animales libres" o "Animales en la vía".SI o NO', 'Acantilados: ubicada en zonas costeras, éstas indican que hay que tomar precaución para evitar todo tipos caídas hacia el vacío.SI o NO',
'Altura limitada o máxima: esta señal está diseñada especialmente para aquellos vehículos de carga 
como camiones o que trasportan una carga superior en altura a lo normal.SI o NO','Bifurcación en Y: muchas rutas y calles sufren lo que se llama bifurcación, 
un cambio de dirección o la apertura de una nueva ruta o camino.SI o NO','Bifurcación o empalme en T: Al igual que la bifurcación en V también tenemos 
la bifurcación o empalme en forma de T.SI o NO','Calzada dividida o camino dividido: como su nombre lo indica, esta señal indica una división en el camino, 
generado así 2 senderos de ida y vuelta.SI o NO','Calzada resbaladiza: simboliza concretamente a sectores de la calzada que pueden generar peligro, 
como por ejemplo calzada de tierra o con zanjas.SI o NO','Camino en Zig Zag: esta señalización vial significa que el camino es en zig zag y que hay que tener precaución.SI o NO','Cruce de caminos: como su figura lo indica, 2 caminos que se cruzan alertan al conductor a tomar precauciones. 
También es conocida esta señal como "Cruce peligroso de vías".SI o NO','Cruce de trenes o ferroviario: perteneciente a las señales ferroviarias, en este caso indicado presencia o cruce de vías de tren.SI o NO','Curva: esta señal de tránsito es de las más conocidas, 
quedando en claro que indica la aproximación de una curva.SI o NO','Curva peligrosa hacia la izquierda: este tipo de señales son muy eficaces a la hora de evitar 
derrapes o salidas de ruta estrepitosas.SI o NO','Curva peligrosa hacia la derecha: igual que la anterior pero distinta dirección.SI o NO','Curva en S: similar a la anterior señal de tránsito, sólo que esta hace alusión a un camino con forma de 
"S" con curvas y contra curvas.SI o NO','Zona de Derrumbes: generalmente ubicada en zonas montañosas, 
pero también cuando se acumulan grandes cantidades de nieve.SI o NO','Escuela cerca: esta señal de tránsito es muy útil todas las instituciones educativas, especialmente donde concurren niños. 
Similares "Despacio escuela", "Cuidado escuela" o "Zona de escuela".SI o NO','Estrechamiento de calzada derecha: señal muy importante en ocasiones donde los caminos están siendo reparados,
 o cuando el camino empalma con una ruta vieja y más angosta.SI o NO','Estrechamiento de calzada izquierda: igual que la anterior pero el estrachamiemto es por izquierda.SI o NO','Estrechamiento de calzada de ambas mano: a diferencia de las 2 anteriores, 
en este caso se estrechan ambas manos del camino.SI o NO','Exclusivo discapacitados: esta señal indica la presencia o circulación de personas 
con ciertas limitaciones motrices.SI o NO','Fin de zona de derrumbe: con colores diferentes a las señales de este grupo, 
esta muestra el fin de una zona de derrumbe en el camino.SI o NO']).


conocimiento('puntos_80',['Indicador de semáforo: esta señalización previene al conductor que está próximo a un semáforo.SI o NO',
'Maquinaria agrícola: indicador de precencia de tracores o maquinarias agrícolas.SI o NO', 'Fuertes vientos laterales: muy común encontrarlas en zonas geográficas donde el clima es extremo, 
muy tomada en cuenta por vehículos que trasportan mercaderías a altas alturas.SI o NO','Puente angosto: proximidad de un puente angosto.SI o NO','Proyección de piedras: en muchos caminos podemos encontrar la existencia de gran cantidad de piedras sobre el pavimento, 
éstas pisarlas causan daños a otros vehículos o personas.SI o NO','Túnel: indicador de proximación de un túne.SI o NO','Pendiente ascendente: esta señal indica que a metros el camino se vuelve ascendente, 
teniendo que tomar las precauciones correspondientes.SI o NO','Pendiente descendente: igual que la anterior pero en este caso es descendiente.SI o NO','Inicio de doble circulación, vía o sentido: después de ir en un camino de una sola mano, 
podemos toparnos con un camino de doble circulación.SI o NO','Niños jugando: la solemos encontrar en espacio exclusivos para juegos o lugares públicos como plazas. 
También son conocidas como "Niños en la vía" o "Niños cruzando".Si o NO','Semáforo de ferrocarril: éste tipo de semáforos los encontramos cuando hay un cruce de vías con calles.SI o NO','Ceda el paso: señal indicadora de la posibilidad de darle el paso a aquellos
vehículos que circular a mayor velocidad que otros.SI o NO','Comienzo doble mano: esta señal es de una gran importancia, ya que alerta a los conductores sobre 
la presencia o cercanía de una calle o avenida de doble mano.SI o NO','Direcciones permitidas: esta señal de tránsito indica que sólo se pueden tomar las direcciones que esta señala.SI o NO','Giro obligatorio: esta señal indica al conductor que debe girar obligatoriamente
hacia la dirección que esta indica, y no hacia otra.SI o NO','Límite de altura: muy similar a la señal preventiva "Altura limitada", advierte al conductor la imposibilidad 
de pasar por ese trayecto si sobrepasa la altura que indica el cartel.SI o NO','Límite de ancho: es de la misma familia de señales que indican altura y ancho permitida para pasar por determinados caminos.SI o NO','Límite de largo: otra señal que indica en este caso el largo permitido que puede
tener un vehículo para acceder a determinados lugares.SI o NO','Límite de peso: esta señal es muy común en ciudades y advierte sobre el peso máximo que puede tener un vehículo, 
también es muy común encontrarlas en puentes.SI o NO','Límite de velocidad: de las más comunes de las señales de tránsito,la podemos encontrar en rutas y caminos o calles de ciudad.SI o NO','Límite de velocidad mínima: esta señal la encontramos en sectores de rutas, autopistas o caminos donde 
la velocidad de los vehículos no debe ser menor a la indicada por la señal.SI o NO','Prohibido avanzar: como su nombre y diseño lo indica, prohíbe determinantemente el avance de cualquier vehículo.SI o NO','Prohibido estacionar: la podemos encontrar en hospitales, o instituciones públicas como escuelas o juzgados. 
También se la conoce como No estacionar.SI o NO','Prohibido estacionar o detenerse: a diferencia de la anterior señal, esta prohíbe a los conductores 
no sólo estacionar sino también a detenerse.SI o NO','Prohibido girar a la derecha: esta señal prohíbe determinantemente a los conductores girar a la derecha.SI o NO','Prohibido girar a la izquierda: similar a la anterior pero indicado que bajo ningún motivo se puede girar a la izquierda.SI o NO','Prohibido girar en U: señal muy común y útil, la solemos encontrar en avenidas de varias manos, 
logrando así que se eviten colisiones.SI o NO','Prohibido ruidos molestos: la solemos encontrar en hospitales o lugares donde se necesitan un límite de ruido.SI o NO','Pare o Alto: otra de las señales más comunes, indicando esta la obligación de detener el vehículo. 
La solemos conocer también como "Alto".SI o NO','Paso obligado: por lo general esta señal indica al conductor que debe circular obligatoriamente por el lugar indicado por la figura.SI o NO','Peatones por izquierda: para evitar inconvenientes con el tránsito, 
muchas veces se obliga a los peatones a circular por determinados lugares, en este caso por la izquierda.SI o NO','Prohibido adelantarse: la solemos encontrar en calles o caminos donde estos son demasiado angostos o que son demasiado transitados.SI o NO']).


conocimiento('puntos_60',
['Prohibido cambiar de carril: muy similar a la anterior señal, pero esta indica que no se puede cambiar de carril.SI o NO', 'Prohibido circular con animales: esta señal también hace referencia a la circulación de vehículos que son de tracción a sangre.SI o NO',
'Prohibido circular autos: como su nombre lo indica, queda determinantemente prohibido la circulación de vehículos por la zona indicada.SI o NO','Prohibido circular bicicletas: esta señal restringe la circulación de bicicletas
en el lugar donde se encuentra la misma.SI o NO','Prohibido circular camiones: del mismo grupo de señales prohibitorias, esta hace referencia a vehículos 
de gran porte como puede ser los camiones.SI o NO','Prohibido circular motos: hace referencia a la prohibición 
total para circular en motocicletas.SI o NO','Avance: señal que indica que no hay que parar ni detenerse.SI o NO','Sentido circulación: señal que indica en qué sentido se debe circular.SI o NO','Transporte pesado por la derecha: micros, camiones, maquinarias agrícolas u otros vehículos 
de porte pesado deben circular por la derecha.SI o NO','Uso cadenas para la nieve: la imagen avisa del uso reglamentario de cadenas para las ruedas de los vehículos en caminos donde hay nieve.SI o NO']).


conocimiento('puntos_40',
['Estación de servicio o gasolinera: indica presencia o cercanía de una estación de servicio, 
muchas de ellas también poseen mercado de compras u otros servicios.SI o NO', 'Gomería: presencia de lugar o comercio que se dedica al recambio, reparación o compra y venta de neumáticos y llantas.SI o NO',
 'Policía: clara indicación de la presencia de una comisaria o destacamento policial. 
A veces indica la presencia de un policía de guardia.SI o NO']).






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%LAS PREGUNTA CON LAS SEÑALES DE IMAGENES HACEMOS EL LLAMADO A LAS IMAGENES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



id_imagen_preg('Animales sueltos: alerta de presencia de animales en la vía, ubicada en zonas rurales. 
Se la puede encontrar con otra imagen como una vaca o alce. También puede indicar "Animales libres" o "Animales en la vía".SI o NO','segundo').

id_imagen_preg('Acantilados: ubicada en zonas costeras, éstas indican que hay que tomar precaución para evitar todo tipos caídas hacia el vacío.SI o NO','auto').

id_imagen_preg('Altura limitada o máxima: esta señal está diseñada especialmente para aquellos vehículos de carga 
como camiones o que trasportan una carga superior en altura a lo normal.SI o NO','mst').

id_imagen_preg('Bifurcación en Y: muchas rutas y calles sufren lo que se llama bifurcación, 
un cambio de dirección o la apertura de una nueva ruta o camino.SI o NO','bifurcacion').

id_imagen_preg('Bifurcación o empalme en T: Al igual que la bifurcación en V también tenemos 
la bifurcación o empalme en forma de T.SI o NO','bifurcacion_t').


id_imagen_preg('Calzada dividida o camino dividido: como su nombre lo indica, esta señal indica una división en el camino, 
generado así 2 senderos de ida y vuelta.SI o NO','calzada').

id_imagen_preg('Calzada resbaladiza: simboliza concretamente a sectores de la calzada que pueden generar peligro, 
como por ejemplo calzada de tierra o con zanjas.SI o NO','calzada_r').

id_imagen_preg('Camino en Zig Zag: esta señalización vial significa que el camino es en zig zag y que hay que tener precaución.SI o NO','camino').

id_imagen_preg('Cruce de caminos: como su figura lo indica, 2 caminos que se cruzan alertan al conductor a tomar precauciones. 
También es conocida esta señal como "Cruce peligroso de vías".SI o NO','cruz').

id_imagen_preg('Cruce de trenes o ferroviario: perteneciente a las señales ferroviarias, en este caso indicado presencia o cruce de vías de tren.SI o NO','trenes').

id_imagen_preg('Curva: esta señal de tránsito es de las más conocidas, 
quedando en claro que indica la aproximación de una curva.SI o NO','curva').

id_imagen_preg('Curva peligrosa hacia la izquierda: este tipo de señales son muy eficaces a la hora de evitar 
derrapes o salidas de ruta estrepitosas.SI o NO','izqierda').

id_imagen_preg('Curva peligrosa hacia la derecha: igual que la anterior pero distinta dirección.SI o NO','derecha').


id_imagen_preg('Curva en S: similar a la anterior señal de tránsito, sólo que esta hace alusión a un camino con forma de 
"S" con curvas y contra curvas.SI o NO','curva_s').

id_imagen_preg('Zona de Derrumbes: generalmente ubicada en zonas montañosas, 
pero también cuando se acumulan grandes cantidades de nieve.SI o NO','zona').

id_imagen_preg('Escuela cerca: esta señal de tránsito es muy útil todas las instituciones educativas, especialmente donde concurren niños. 
Similares "Despacio escuela", "Cuidado escuela" o "Zona de escuela".SI o NO','escuela').

id_imagen_preg('Estrechamiento de calzada derecha: señal muy importante en ocasiones donde los caminos están siendo reparados,
 o cuando el camino empalma con una ruta vieja y más angosta.SI o NO','estrechamiento').

id_imagen_preg('Estrechamiento de calzada izquierda: igual que la anterior pero el estrachamiemto es por izquierda.SI o NO','estrechamiento_i').

id_imagen_preg('Estrechamiento de calzada de ambas mano: a diferencia de las 2 anteriores, 
en este caso se estrechan ambas manos del camino.SI o NO','estrechamiento_a').

id_imagen_preg('Exclusivo discapacitados: esta señal indica la presencia o circulación de personas 
con ciertas limitaciones motrices.SI o NO','silla').

id_imagen_preg('Fin de zona de derrumbe: con colores diferentes a las señales de este grupo, 
esta muestra el fin de una zona de derrumbe en el camino.SI o NO','zona_fin').


id_imagen_preg('Maquinaria agrícola: indicador de precencia de tracores o maquinarias agrícolas.SI o NO','tractor').

id_imagen_preg('Indicador de semáforo: esta señalización previene al conductor que está próximo a un semáforo.SI o NO','semaforo').

id_imagen_preg('Fuertes vientos laterales: muy común encontrarlas en zonas geográficas donde el clima es extremo, 
muy tomada en cuenta por vehículos que trasportan mercaderías a altas alturas.SI o NO','viento').

id_imagen_preg('Puente angosto: proximidad de un puente angosto.SI o NO','puente').

id_imagen_preg('Proyección de piedras: en muchos caminos podemos encontrar la existencia de gran cantidad de piedras sobre el pavimento, 
éstas pisarlas causan daños a otros vehículos o personas.SI o NO','piedra').

id_imagen_preg('Túnel: indicador de proximación de un túne.SI o NO','tunel').

id_imagen_preg('Pendiente ascendente: esta señal indica que a metros el camino se vuelve ascendente, 
teniendo que tomar las precauciones correspondientes.SI o NO','pendiente').

id_imagen_preg('Pendiente descendente: igual que la anterior pero en este caso es descendiente.SI o NO','pendiente_b').

id_imagen_preg('Inicio de doble circulación, vía o sentido: después de ir en un camino de una sola mano, 
podemos toparnos con un camino de doble circulación.SI o NO','doble').

id_imagen_preg('Niños jugando: la solemos encontrar en espacio exclusivos para juegos o lugares públicos como plazas. 
También son conocidas como "Niños en la vía" o "Niños cruzando".Si o NO','jugar').

id_imagen_preg('Semáforo de ferrocarril: éste tipo de semáforos los encontramos cuando hay un cruce de vías con calles.SI o NO','rojo').

id_imagen_preg('Ceda el paso: señal indicadora de la posibilidad de darle el paso a aquellos
vehículos que circular a mayor velocidad que otros.SI o NO','seda').

id_imagen_preg('Comienzo doble mano: esta señal es de una gran importancia, ya que alerta a los conductores sobre 
la presencia o cercanía de una calle o avenida de doble mano.SI o NO','doblee').

id_imagen_preg('Direcciones permitidas: esta señal de tránsito indica que sólo se pueden tomar las direcciones que esta señala.SI o NO','diree').

id_imagen_preg('Giro obligatorio: esta señal indica al conductor que debe girar obligatoriamente
hacia la dirección que esta indica, y no hacia otra.SI o NO','giroo').

id_imagen_preg('Límite de altura: muy similar a la señal preventiva "Altura limitada", advierte al conductor la imposibilidad 
de pasar por ese trayecto si sobrepasa la altura que indica el cartel.SI o NO','limite_a').

id_imagen_preg('Límite de ancho: es de la misma familia de señales que indican altura y ancho permitida para pasar por determinados caminos.SI o NO','limite_an').

id_imagen_preg('Límite de largo: otra señal que indica en este caso el largo permitido que puede
tener un vehículo para acceder a determinados lugares.SI o NO','limite_l').

id_imagen_preg('Límite de peso: esta señal es muy común en ciudades y advierte sobre el peso máximo que puede tener un vehículo, 
también es muy común encontrarlas en puentes.SI o NO','limite_p').

id_imagen_preg('Límite de velocidad: de las más comunes de las señales de tránsito,la podemos encontrar en rutas y caminos o calles de ciudad.SI o NO','limite_v').

id_imagen_preg('Límite de velocidad mínima: esta señal la encontramos en sectores de rutas, autopistas o caminos donde 
la velocidad de los vehículos no debe ser menor a la indicada por la señal.SI o NO','limite_vi').

id_imagen_preg('Prohibido avanzar: como su nombre y diseño lo indica, prohíbe determinantemente el avance de cualquier vehículo.SI o NO','proibido').

id_imagen_preg('Prohibido estacionar: la podemos encontrar en hospitales, o instituciones públicas como escuelas o juzgados. 
También se la conoce como No estacionar.SI o NO','proibido_e').

id_imagen_preg('Prohibido estacionar o detenerse: a diferencia de la anterior señal, esta prohíbe a los conductores 
no sólo estacionar sino también a detenerse.SI o NO','proibido_es').

id_imagen_preg('Prohibido girar a la derecha: esta señal prohíbe determinantemente a los conductores girar a la derecha.SI o NO','proibido_ese').

id_imagen_preg('Prohibido girar a la izquierda: similar a la anterior pero indicado que bajo ningún motivo se puede girar a la izquierda.SI o NO','proibido_esee').

id_imagen_preg('Prohibido girar en U: señal muy común y útil, la solemos encontrar en avenidas de varias manos, 
logrando así que se eviten colisiones.SI o NO','proibido_c').

id_imagen_preg('Prohibido ruidos molestos: la solemos encontrar en hospitales o lugares donde se necesitan un límite de ruido.SI o NO','proibido_cu').

id_imagen_preg('Pare o Alto: otra de las señales más comunes, indicando esta la obligación de detener el vehículo. 
La solemos conocer también como "Alto".SI o NO','proibido_pa').

id_imagen_preg('Paso obligado: por lo general esta señal indica al conductor que debe circular obligatoriamente por el lugar indicado por la figura.SI o NO','proibido_ob').

id_imagen_preg('Peatones por izquierda: para evitar inconvenientes con el tránsito, 
muchas veces se obliga a los peatones a circular por determinados lugares, en este caso por la izquierda.SI o NO','proibido_obb').

id_imagen_preg('Prohibido adelantarse: la solemos encontrar en calles o caminos donde estos son demasiado angostos o que son demasiado transitados.SI o NO','proibido_adel').


id_imagen_preg('Prohibido cambiar de carril: muy similar a la anterior señal, pero esta indica que no se puede cambiar de carril.SI o NO','aagresibo').

id_imagen_preg('Prohibido circular con animales: esta señal también hace referencia a la circulación de vehículos que son de tracción a sangre.SI o NO','caballo').

id_imagen_preg('Prohibido circular autos: como su nombre lo indica, queda determinantemente prohibido la circulación de vehículos por la zona indicada.SI o NO','autooo').


id_imagen_preg('Prohibido circular bicicletas: esta señal restringe la circulación de bicicletas
en el lugar donde se encuentra la misma.SI o NO','vicii').

id_imagen_preg('Prohibido circular camiones: del mismo grupo de señales prohibitorias, esta hace referencia a vehículos 
de gran porte como puede ser los camiones.SI o NO','viciio').


id_imagen_preg('Prohibido circular motos: hace referencia a la prohibición 
total para circular en motocicletas.SI o NO','motoo').


id_imagen_preg('Avance: señal que indica que no hay que parar ni detenerse.SI o NO','avance').

id_imagen_preg('Sentido circulación: señal que indica en qué sentido se debe circular.SI o NO','circular').

id_imagen_preg('Transporte pesado por la derecha: micros, camiones, maquinarias agrícolas u otros vehículos 
de porte pesado deben circular por la derecha.SI o NO','pesadito').

id_imagen_preg('Uso cadenas para la nieve: la imagen avisa del uso reglamentario de cadenas para las ruedas de los vehículos en caminos donde hay nieve.SI o NO','pesaditoo').


id_imagen_preg('Estación de servicio o gasolinera: indica presencia o cercanía de una estación de servicio, 
muchas de ellas también poseen mercado de compras u otros servicios.SI o NO','gasolina').



id_imagen_preg('Policía: clara indicación de la presencia de una comisaria o destacamento policial. 
A veces indica la presencia de un policía de guardia.SI o NO','pacito').

id_imagen_preg('Gomería: presencia de lugar o comercio que se dedica al recambio, reparación o compra y venta de neumáticos y llantas.SI o NO','gomeria').



%%%%%%%%%%%%%%%%%%%%%%%%%preguntas que se encargar su conocimiento%%%%%%%%%%%%%%%%%%%%%%%%



:- dynamic conocido/1.

  mostrar_diagnostico(X):-haz_diagnostico(X),clean_scratchpad.
  mostrar_diagnostico(puntos_0):-clean_scratchpad .

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
pregunta_sobre(Diagnosis, Sintoma, Reply), Reply = 'si'.


pregunta_sobre(Diagnosis, Sintoma, Reply):- preguntar(Sintoma,Respuesta),
                          process(Diagnosis, Sintoma, Respuesta, Reply).


process(Diagnosis, Sintoma, si, si):- asserta(conocido(Sintoma)).
process(Diagnosis, Sintoma, no, no):- asserta(conocido(is_false(Sintoma))).


clean_scratchpad:- retract(conocido(X)), fail.
clean_scratchpad.


conocido(_):- fail.

not(X):- X,!,fail.
not(_).
