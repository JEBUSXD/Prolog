menu :-repeat,nl,
    writeln('===== MENU ====='),
    writeln('1. Convertir Celsius a Kelvin'),
    writeln('2. Convertir Celsius a Fahrenheit'),
    writeln('Ingrese una opcion: '), 
    read(Opcion),
    procesar_opcion(Opcion),
    Opcion == 3, !.

procesar_opcion(1) :- 
    writeln('Ingrese la temperatura en Celsius: '),read(Celsius),Kelvin is Celsius + 273.15,
    writeln('Temperatura en Kelvin: '), writeln(Kelvin).

procesar_opcion(2) :- 
    writeln('Ingrese la temperatura en Celsius: '), read(Celsius),Fahrenheit is (Celsius * 9/5) + 32,
    writeln('Temperatura en Fahrenheit: '), writeln(Fahrenheit).

procesar_opcion(_) :- 
    writeln('Opcion invalida, intente de nuevo.').