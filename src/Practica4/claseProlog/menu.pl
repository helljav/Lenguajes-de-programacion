menu:- 
	write('Dame una opcion'),
	nl,
	read(Opcion),
	hazOpcion(Opcion).
	
hazOpcion(1):-
	write('Esta es la opcion 1'), nl,
	menu.

hazOpcion(2):-
	write('Esta es la opcion 2 adios'), nl.

	