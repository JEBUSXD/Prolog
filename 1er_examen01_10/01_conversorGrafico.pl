celsius(C,K,F):-atom_number(C,CC),
		KE is CC+273.15,
		FA is (CC *9/5)+32,
		send(K,selection,KE),
		send(F,selection,FA).                 
kelvin(C,K,F):-atom_number(K,KK),
		CE is KK-273.15,
		FA is (KK-273.15)*9/5+32,
		send(C,selection,CE),
		send(F,selection,FA). 
fahrenheit(C,K,F):-atom_number(F,FF),
		CE is (FF-32)*5/9,
		KE is (FF-32)*5/9+273.15,
		send(C,selection,CE),
		send(K,selection,KE).
:- use_module(library(pce)).
inicio:-new(Ventana, dialog('Conversion Grafica.')),
	new(Etiqueta, label(nombre,'Conversor de temperaturas')),
	new(C, text_item('Celsius')),
	new(K, text_item('Kelvin')),
	new(F, text_item('Fahrenheit')),

	new(CeBoton, button('Celsius a', message(@prolog,
		celsius, C?selection, K, F))),
	new(KeBoton, button('Kelvin a', message(@prolog,
		kelvin, C , K?selection, F))),
	new(FaBoton, button('Fahrenheit a', message(@prolog,
		fahrenheit, C, K, F?selection))),
	new(Salir, button('salir', message(Ventana, destroy))),
   
	send(Ventana, append, Etiqueta),
	send(Ventana, append, C),
	send(Ventana, append, K),
	send(Ventana, append, F),
        send(Ventana, append, CeBoton),
	send(Ventana, append, KeBoton),
	send(Ventana, append, FaBoton),
	send(Ventana, append, Salir),
send(Ventana, open).