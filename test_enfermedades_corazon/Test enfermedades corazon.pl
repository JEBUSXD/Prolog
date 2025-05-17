%Siria Barriga Villarroel
%INF-318

:- use_module(library(pce)).                   %%libreria para realizarlo en modo grafico%
:-use_module(library(pce_style_item)).         %%libreria que permite crear label, button etc%
:- pce_image_directory('./').                  %%DIRECTORIO
:- dynamic color/2.

% IMAGEN DE INTERFAZ  %
resource(primeroo1,image,image('imagen.jpg')).

                     % PARA COLOCAR IMAGEN A LA INTERFAZ %

nueva_imagen(Ventana,Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display, Figura, point(10,8)).     %%POSICION DE IMAGEN

                    %  CREANDO EL PANEL DE LA INTERFAZ %

iniciar:-new(D,dialog('DIAGNOSTICO DE ENFERMEDAD ')),
	 new(L,label(nombre,'   TEST DE DIAGNOSTICO DE ENFRENEDADADES CARDIACAS '  )),
  	 new(@texto,label(nombre,' Selecciona Si o No en las diferentes')),
  	 new(@texto1,label(nombre,'preguntas, Buena Suerte...!!!')),
  	 new(@respl,label(nombre,'')),
  	 new(Salir,button('SALIR',and(message(D,destroy),message(D,free)))),
  	 new(@boton,button('INICIAR DIAGNOSTICO',message(@prolog,botones))),
      
	 nueva_imagen(D, primeroo1),

  	 send(D,append(L)),new(@btnseguridad,button('�Diagnostico?' )),
  	 send(D,display,L,point(300,5)),                         %%POSICION TITULO
  	 send(D,display,@boton,point(180,650)),                  %%POSICION BOTON DIAGNOSTICO
  	 send(D,display,@texto,point(200,580)),                  %%POSICION NOTA1
  	 send(D,display,@texto1,point(255,600)),                 %%POSICION NOTA2
  	 send(D,display,Salir,point(410,650)),                   %%POSICION BOTON SALIR
  	 send(D,display,@respl,point(10,160)),                   %%POSICION RESPUESTA
  	 send(@texto,font,font(cooper,bold,19)),                 %%TIPO LETRA NOTA1
  	 send(@texto1,font,font(cooper,bold,19)),                %%TIPO LETRA NOTA2
  	 send(L,font,font(times,bold,25)),                       %%TIPO,TAMA�O LETRA TITULO

         send(D,open,point(0,0)).                          	 %%POSICION DE LA VENTANA

% ANGINA %

diagnostico('       SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE LA ENFERMEDAD DE ANGINA

              �Qu� es la Angina?

    Es un dolor o molestia en el pecho que sucede cuando al coraz�n no llega la 
    cantidad de sangre y ox�geno que necesita. A veces, las arterias coronarias que
    proveen de sangre al coraz�n, se obstruyen con la acumulaci�n de grasas, colesterol 
    u otras sustancias. Y entonces, como el coraz�n no recibe sangre y ox�geno suficiente,
    se produce la angina.
    
    PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-angina,!.





% Insuficiencia cardiaca %

diagnostico('      SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE LA ENFERMEDAD DE 
     INSUFICIENCIA CARDIACA

                  �Qu� es la Insuficiencia cardiaca?

     Afecci�n cr�nica que provoca que el coraz�n no bombee sangre con la 
     eficacia necesaria.La insuficiencia card�aca puede producirse cuando el 
     coraz�n no bombea (s�stole) o no se llena (di�stole) correctamente.
       
        PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-insuficiencia,!.





% Arritmia %
diagnostico('     SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
     ARRITMIA CARDIACA

               �Qu� es la Arritmia Cardiaca?

     Latidos anormales del coraz�n, ya sea irregulares, demasiado 
     r�pidos o demasiado lentos.La arritmia card�aca ocurre 
     los impulsos el�ctricos del coraz�n no funcionan correctamente.
     Es posible que no se presenten s�ntomas.
           
        PARA ESTAR SEGURO VISITE A UN ESPECIALISTA  '):-arritmia,!.





% endocarditis%


diagnostico('      USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
      ENDOCARDITIS
                              
                �Qu� es la Endocarditis?

     La endocarditis es una inflamaci�n del revestimiento interno de las
     cavidades y las v�lvulas del coraz�n (endocardio) que puede poner
     en riesgo la vida.La endocarditis, por lo general, se debe a una infecci�n.
      
        PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-endocarditis,!.





%miocardiopatia %

diagnostico('       USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE
       MIOCARDIOPATIA
                              
                   �Qu� es la Miocardiopatia?

     Las miocardiopat�as son un conjunto de enfermedades que afectan al
     propio m�sculo cardiaco.Esta afectaci�n es primaria y no es debida a
     ninguna alteraci�n de las v�lvulas o de las arterias coronarias.
         
       PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-miocardiopatia,!.





% FIBRILACION %


diagnostico('      USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
      FIBRILACION AURICULAR
      		                        
                       �Qu� es fibrilacion auricular?

     La fibrilaci�n auricular es un ritmo card�aco irregular y a menudo muy r�pido
     (arritmia) que puede provocar co�gulos de sangre en el coraz�n. La fibrilaci�n 
     auricular aumenta el riesgo de accidente cerebrovascular, insuficiencia card�aca
     y otras complicaciones relacionadas con el coraz�n.

     Durante la fibrilaci�n auricular, las cavidades superiores (aur�culas)
     del coraz�n laten de forma ca�tica e irregular, de forma no sincronizada
     con las cavidades inferiores (ventr�culos) del coraz�n. En muchas personas, 
     la fibrilaci�n auricular puede ser asintom�tica.
        
         PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-fibrilacion,!.










% TUMOR %

diagnostico('       USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
     TUMOR CARDIACO
      		                        
              �Qu� es tumor cardiaco?

     Los tumores card�acos primarios son tumores que se originan en el coraz�n.
     Los tumores card�acos primarios son muy poco frecuentes y ocurren en menos
     de una de cada 2000 personas. La mayor�a de los tumores card�acos primarios
     son no cancerosos (benignos).

    Los tumores card�acos metast�sicos son c�nceres que se han desarrollado en
    otro �rgano y posteriormente se han extendido al coraz�n. La mayor�a de los
    c�nceres card�acos producen met�stasis y la mayor�a de dichos c�nceres se
    diseminan desde los pulmones.
      
       PARA ESTAR SEGURO VISITE A UN ESPECIALISTA  '):-tumor,!.

%ame%









%%%%%%%%%%RESPUESTAS%%%%%%%%%%%%%


diagnostico('     SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE LA ENFERMEDAD DE
        ANGINA

              �Qu� es la Angina?

    Es un dolor o molestia en el pecho que sucede cuando al coraz�n no llega la 
    cantidad de sangre y ox�geno que necesita. A veces, las arterias coronarias que
    proveen de sangre al coraz�n, se obstruyen con la acumulaci�n de grasas, colesterol 
    u otras sustancias. Y entonces, como el coraz�n no recibe sangre y ox�geno suficiente,
    se produce la angina
    
    PARA ESTAR SEGURO VISITE A UN ESPECIALISTA  '):-angina1,!.



diagnostico('      SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE LA ENFERMEDAD DE 
     INSUFICIENCIA CARDIACA

                �Qu� es la Insuficiencia cardiaca?

     Afecci�n cr�nica que provoca que el coraz�n no bombee sangre con la 
     eficacia necesaria.La insuficiencia card�aca puede producirse cuando el 
     coraz�n no bombea (s�stole) o no se llena (di�stole) correctamente.
    
     PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-insuficiencia1,!.



diagnostico('     SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
     ARRITMIA CARDIACA

               �Qu� es la Arritmia Cardiaca?

     Latidos anormales del coraz�n, ya sea irregulares, demasiado 
     r�pidos o demasiado lentos.La arritmia card�aca ocurre 
     los impulsos el�ctricos del coraz�n no funcionan correctamente.
     Es posible que no se presenten s�ntomas. 
    
     PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-arritmia1,!.





diagnostico('      USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
      ENDOCARDITIS
                              
                �Qu� es la Endocarditis?

     La endocarditis es una inflamaci�n del revestimiento interno de las
     cavidades y las v�lvulas del coraz�n (endocardio) que puede poner
     en riesgo la vida.La endocarditis, por lo general, se debe a una infecci�n.
     
      PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-endocarditis1,!.





diagnostico('       USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE
       MIOCARDIOPATIA
                              
                   �Qu� es la Miocardiopatia?

     Las miocardiopat�as son un conjunto de enfermedades que afectan al
     propio m�sculo cardiaco.Esta afectaci�n es primaria y no es debida a
     ninguna alteraci�n de las v�lvulas o de las arterias coronarias.
    
      PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-miocardiopatia1,!.





diagnostico('      USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
      FIBRILACION AURICULAR
      		                        
                   �Qu� es fibrilacion auricular?

     La fibrilaci�n auricular es un ritmo card�aco irregular y a menudo muy r�pido
     (arritmia) que puede provocar co�gulos de sangre en el coraz�n. La fibrilaci�n 
     auricular aumenta el riesgo de accidente cerebrovascular, insuficiencia card�aca
     y otras complicaciones relacionadas con el coraz�n.

     Durante la fibrilaci�n auricular, las cavidades superiores (aur�culas)
     del coraz�n laten de forma ca�tica e irregular, de forma no sincronizada
     con las cavidades inferiores (ventr�culos) del coraz�n. En muchas personas, 
     la fibrilaci�n auricular puede ser asintom�tica.
     
        PARA ESTAR SEGURO VISITE A UN ESPECIALISTA '):-fibrilacion1,!.



diagnostico('       USTED SEGUN EL TEST RELIZADO TIENE LOS SINTOMAS DE 
     TUMOR CARDIACO
      		                        
              �Qu� es tumor cardiaco?

     Los tumores card�acos primarios son tumores que se originan en el coraz�n.
     Los tumores card�acos primarios son muy poco frecuentes y ocurren en menos
     de una de cada 2000 personas. La mayor�a de los tumores card�acos primarios
     son no cancerosos (benignos).

    Los tumores card�acos metast�sicos son c�nceres que se han desarrollado en
    otro �rgano y posteriormente se han extendido al coraz�n. La mayor�a de los
    c�nceres card�acos producen met�stasis y la mayor�a de dichos c�nceres se
    diseminan desde los pulmones.
     
      PARA ESTAR SEGURO VISITE A UN ESPECIALISTA  '):-tumor1,!.






diagnostico('      Segun el test realizado no tiene sintomas de enfermedades del corazon, 
     para mayor seguridad. 
                         
                         VISITE A SU MEDICO DE CONFIANZA.').



%%%%%%% PREGUNTAS DE LAS OPCIONES POSIBLES %

  %%%%% CODIGO PREGUNTA

angina:-opcion_1,opcion_1_1,opcion_1_2,opcion_1_3,opcion_1_4,opcion_1_5.
angina:-opcion_1_1,opcion_1_2,opcion_1_3,opcion_1_4,opcion_1_5.
angina:-opcion_1_2,opcion_1_3,opcion_1_4,opcion_1_5.
angina:-opcion_1_3,opcion_1_4,opcion_1_5.
angina:-opcion_1_4,opcion_1_5.
angina:-opcion_1_5.

insuficiencia:-opcion_2,opcion_2_1,opcion_2_2,opcion_2_3.
insuficiencia:-opcion_2_1,opcion_2_2,opcion_2_3.
insuficiencia:-opcion_2_2,opcion_2_3.
insuficiencia:-opcion_2_3.

arritmia:-opcion_3,opcion_3_1,opcion_3_2,opcion_3_3.
arritmia:-opcion_3_1,opcion_3_2,opcion_3_3.
arritmia:-opcion_3_2,opcion_3_3.
arritmia:-opcion_3_3.

endocarditis:-opcion_4,opcion_4_1,opcion_4_2.
endocarditis:-opcion_4_1,opcion_4_2.
endocarditis:-opcion_4_2.

miocardiopatia:-opcion_5,opcion_5_1,opcion_5_2.
miocardiopatia:-opcion_5_1,opcion_5_2.
miocardiopatia:-opcion_5_2.

fibrilacion:-opcion_6,opcion_6_1,opcion_6_2.
fibrilacion:-opcion_6_1,opcion_6_2.
fibrilacion:-opcion_6_2.

tumor:-opcion_7,opcion_7_1,opcion_7_2,opcion_7_3.
tumor:-opcion_7_1,opcion_7_2,opcion_7_3.
tumor:-opcion_7_2,opcion_7_3.
tumor:-opcion_7_3.



%%%%%% CODIGO PREGUNTA%%%%%%%

angina1:-opcion_1;opcion_1_1;opcion_1_2;opcion_1_3;opcion_1_4;opcion_1_5.
insuficiencia1:-opcion_2;opcion_2_1;opcion_2_2;opcion_2_3.
arritmia1:-opcion_3;opcion_3_1;opcion_3_2;opcion_3_3.
endocarditis1:-opcion_4;opcion_4_1;opcion_4_2.
miocardiopatia1:-opcion_5;opcion_5_1;opcion_5_2.
fibrilacion1:-opcion_6;opcion_6_1;opcion_6_2.
tumor1:-opcion_7;opcion_7_1;opcion_7_2;opcion_7_3.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5


opcion_1:-pregunta('�Dolor de pecho intenso?'),!.

opcion_1_1:- pregunta(' �Mareos?'),!.

opcion_1_2:- pregunta(' �Fatiga?'),!.

opcion_1_3:- pregunta('�Falta de aire.?'),!.

opcion_1_4:- pregunta('�Nauseas.?'),!.

opcion_1_5:- pregunta(' �Sudoraci�n?'),!.






% insuficiencia cardiaca %

opcion_2:-pregunta('�Sensaci�n de falta de aire?'),!.

opcion_2_1:-  pregunta('�Inchaz�n en las piernas tobillos y pies?'),!.

opcion_2_2:-  pregunta('�Latidos del coraz�n rapido o irregulares?'),!.

opcion_2_3:-  pregunta('�Falta de apetito?'),!.





%ARRITMIA  %

opcion_3:-pregunta('�Palpitaciones y s�ncopes?'),!.

opcion_3_1:-  pregunta('�Dolor toraxico?'),!.

opcion_3_2:-  pregunta('�Dificultad para respirar?'),!.

opcion_3_3:-  pregunta('�Aceleraci�n de latidos del coraz�n?'),!.









% endocarditis%

opcion_4:-pregunta('�Dolor de pecho al respirar?'),!.

opcion_4_1:-pregunta('�Sudoraci�n nocturna?'),!.

opcion_4_2:-pregunta('�Escalofrios y fiebre'),!.









% miocardopatia %

opcion_5:-pregunta('�Dificultad para dormir en posici�n horizontal?'),!.

opcion_5_1:-  pregunta('�Inchaz�n del abdomen.?'),!.

opcion_5_2:- pregunta('�Tos al estar recostado?'),!.






% FIBRILISACION %

opcion_6:-pregunta('�Sensaci�n de latidos cardiacos rapidos?'),!.

opcion_6_1:-pregunta('�Aturdimiento?'),!.

opcion_6_2:-pregunta('�Falta de aliento?'),!.






% TUMOR%


opcion_7:-pregunta('�Dificultad para respirar respirar al estar acostado tanto de un lado como del otro?'),!.

opcion_7_1:-pregunta('�Opresi�n o dolor en el pecho?'),!.

opcion_7_2:-pregunta('�Mareos, desmayos?'),!.

opcion_7_3:-pregunta('�Dolores articulares?'),!.










  %%%%% INTERFAZ DE LAS PREGUNTAS A RESPONDER %

:-dynamic si/1,no/1.
preguntar(Problema):-new(Di,dialog('DIAGNOSTICO ENFERMEDADES DEL CORAZON')),
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