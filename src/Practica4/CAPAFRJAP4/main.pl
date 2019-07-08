:- discontiguous 
	menu/0,
	buscaInfo/1,
	buscaPelicula3/2,
	buscaPelicula2/2,
	buscaPelicula/2,
	inserta/1,
	hazOpcion/1,
	modifica/1,
	elimina/1.
	
:-consult('Movies.pl').
menu:-
	write('Selecciona una opcion: '),
	nl,
	write('1.- Encontrar informacion de la pelicula'),
	nl,
	write('2.- Agregar informacion de una pelicula'),
	nl,
	write('3.- Modificar informacion de una pelicula'),
	nl,
	write('4.- Borrar informacion de una pelicula'),
	nl,
	write('5.- Realice una meta'),
	nl,
	read(Opcion),
	hazOpcion(Opcion).
	
hazOpcion(1):-
	write('Selecciona una opcion: '),
	nl,
	write('1- Buscar Pelicula por año '),
	nl,
	write('2- Buscar pelicula por nombre'),
	nl,
	write('3- Buscar pelicula por director'),
	nl,
	read(Opcion),
	buscaInfo(Opcion).
 

	
	
hazOpcion(2):-
	write('Dame una opcion'),nl,
	write('1 - Agregar un nueva pelicula'),nl,
    write('2 - Agregar un nuevo director'),nl,
    write('3 - Agregar un nuevo actor'),nl,
    write('4 - Agregar una nueva actriz'),nl,	
	read(Agrega),
	inserta(Agrega).
	
	
hazOpcion(3):-
	write('Dame una opcion'),nl,
	write('1 - Modificar Pelicula'),nl,
	write('2 - Modificar Actor'),nl,
	write('3 - Modificar Actriz'),nl,
	write('4 - Modificar Director'),nl,
	read(Modifica),
	modifica(Modifica).
	
	
hazOpcion(4):-
	write('1 - Eliminar Pelicula'),nl,
	write('2 - Eliminar Actor'),nl,
	write('3 - Eliminar Actriz'),nl,
	write('4 - Eliminar Director'),nl,
	write('5 - Cancelar'),nl,
	read(Elimina),
	elimina(Elimina).
	
	
hazOpcion(5):-
	write('Escribe la meta'),nl,
	read(M),call(M),write(M),nl,fail;true,nl,
	menu.
	
elimina(1):-
	write('Dame el nombre de la pelicula'),nl,
	read(M),	
	retract(movie(M,_)),
	retractall(director(M,_)),
	retractall(actor(M,_,_)),
	retractall(actress(M,_,_)),
	write('Se ha eliminado la pelicula:  '),
	write(M),nl,
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),	
	menu.

elimina(2):-
	write('Dame el nombre del actor'),nl,
	read(A),	
	retractall(actor(_,A,_)),	
	write('Se ha eliminado el actor '),
	write(A),nl,
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.
	
elimina(3):-
	write('Dame el nombre de la actriz'),nl,
	read(A),	
	retractall(actress(_,A,_)),	
	write('Se ha eliminado la actriz '),
	write(A),nl,
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.
	

elimina(4):-	
	write('Dame el nombre del director'),nl,
	read(D),	
	retractall(director(_,D)),	
	write('Se ha eliminado el director '),
	write(D),nl,
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.
	
	
modifica(1):-
	
	write('Dame el nombre de la pelicula que deseas modificar'),nl,
	read(M),
	write('Dame el nuevo nombre de la pelicula'),nl,
	read(N),	
	movie(M,An),
	findall(D,director(M,D),Ld),
	findall((A1,P1),actor(M,A1,P1),La1),
	findall((A2,P2),actress(M,A2,P2),La2),
	retract(movie(M,An)),
	retractall(director(M,_)),
	retractall(actor(M,_,_)),
	retractall(actress(M,_,_)),
	assert(movie(N,An)),
	(member(X,Ld),assert(director(N,X)),fail;true),
	(member((X,Y),La1),assert(actor(N,X,Y)),fail;true),
	(member((X,Y),La2),assert(actress(N,X,Y)),fail;true),
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.

modifica(2):-
	
	write('Dame el nombre del actor que deseas modificar'),nl,
	read(A),
	write('Dame el nuevo nombre del actor'),nl,
	read(N),	
	findall((M,R),actor(M,A,R),Ld),	
	retractall(actor(_,A,_)),	
	(member((M,P),Ld),assert(actor(M,N,P)),fail;true),
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.

modifica(3):-
	
	write('Dame el nombre de la actriz que deseas modificar'),nl,
	read(A),
	write('Dame el nuevo nombre de la actriz'),nl,
	read(N),	
	findall((M,R),actress(M,A,R),Ld),	
	retractall(actor(_,A,_)),	
	(member((M,P),Ld),assert(actress(M,N,P)),fail;true),
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.
	
modifica(4):-
	
	write('Dame el nombre del director que deseas modificar'),nl,
	read(D),
	write('Dame el nuevo nombre del director'),nl,
	read(N),	
	findall(M,director(M,D),Ld),	
	retractall(director(_,D)),	
	(member(M,Ld),assert(director(M,N)),fail;true),
	open('Movies.pl',write,S),
	set_output(S),
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),nl(S),
	close(S),
	menu.
	
	
	
	
	

	
buscaInfo(1):-
	write('Dame el anio de la pelicula'),nl,
	read(Y),
	buscaPelicula(Peliculas,Y),
	write('Las Peliculas en el anio: '),
	write(Y),
	write(' son: '),
	write(Peliculas),nl,
	open('Salida.tx',write,S),set_output(S),write(Peliculas),nl,close(S).
	menu.
	
	
	
buscaInfo(2):-
	write('Dame el nombre de la Pelicula'),nl,
	read(Pelicula),
	buscaPelicula2(Pelicula,L),
	write('Las Peliculas con el nombre '),
	write(Pelicula),
	write(' son: '),
	write(L),nl,
	open('Salida.tx',write,S),set_output(S),write(L),nl,close(S).
	menu.
	
	
buscaInfo(3):-
	write('Dame el nombre del director de la pelicula'),nl,
	read(Director),
	buscaPelicula3(P,Director),
	write('Las Peliculas con el director '),
	write(Director),
	write(' son: '),
	write(P),nl,
	open('Salida.tx',write,S),set_output(S),write(P),nl,close(S).
	menu.
	

inserta(1):-
	write('Agregar informacion de pelicula'),nl,
	write('Dame el nombre de la pelicula'),nl,
	read(P),
	write('Dame el anio de la pelicula'),nl,
	read(Y),
	open('Movies.pl',write,S),
	assert(movie(P,Y)),
	set_output(S),		
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),	
	menu.


inserta(2):-
	write('Agregar informacion del director'),nl,
	write('Dame el nombre del director'),nl,
	read(N),
	write('Dame el nombre de la pelicula'),nl,
	read(P),
	open('Movies.pl',write,S),
	assert(director(P,N)),
	set_output(S),		
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),	
	menu.


inserta(3):-
	write('Agregar informacion de pelicula'),nl,
	write('Dame el nombre del actor'),nl,
	read(N),
	write('Dame el nombre de la pelicula'),nl,
	read(P),
	write('Dame el nombre del personaje del actor'),nl,
	read(R),
	open('Movies.pl',write,S),
	assert(actor(P,N,R)),
	set_output(S),		
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),	
	menu.


inserta(4):-
	write('Agregar informacion de pelicula'),nl,
	write('Dame el nombre del la actriz'),nl,
	read(N),
	write('Dame el nombre de la pelicula'),nl,
	read(P),
	write('Dame el nombre del personaje del la actris'),nl,
	read(R),
	open('Movies.pl',write,S),
	assert(actress(P,N,R)),
	set_output(S),		
	listing(movie/2),
	listing(director/2),
	listing(actor/3),
	listing(actress/3),	
	menu.
	

	
	
	

buscaPelicula(Peliculas,Y):-
	findall(P,movie(P,Y),Peliculas).


buscaPelicula2(Pelicula, L):-
	findall(P,movie(Pelicula,Y),L).

buscaPelicula3(P, D):-
	findall(P,director(P,D),P).
	
	
