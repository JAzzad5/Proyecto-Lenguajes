alumnos(carlos,m,is).
alumnos(alejandro,m,is).
alumnos(luisa,f,is).

alumnos(maria,f,medicina).
alumnos(angela,f,medicina).

alumnos(juan,m,ie).
alumnos(oscar,m,ie).
alumnos(helena,f,ie).

clasesCarrera(lenguajes,is).
clasesCarrera(poo,is).
clasesCarrera(redes,is).

clasesCarrera(morfologia,medicina).
clasesCarrera(salud,medicina).
clasesCarrera(biologia,medicina).

clasesCarrera(maquinas,ie).
clasesCarrera(circuitos,ie).
clasesCarrera(electronica,ie).



codigoClase(1,lenguajes).
codigoClase(2,poo).
codigoClase(3,redes).


codigoClase(4,morfologia).
codigoClase(5,salud).
codigoClase(6,biologia).


codigoClase(7,maquinas).
codigoClase(8,circuitos).
codigoClase(9,electronica).

notasAlumno(carlos,1,75).
notasAlumno(carlos,2,87).
notasAlumno(carlos,3,90).

notasAlumno(alejandro,1,68).
notasAlumno(alejandro,2,98).
notasAlumno(alejandro,3,61).

notasAlumno(luis,1,60).
notasAlumno(luis,2,70).
notasAlumno(luis,3,50).

notasAlumno(angela,4,75).
notasAlumno(angela,5,40).

notasAlumno(maria,4,70).
notasAlumno(maria,5,90).



claseAprobada(X,Y):-codigoClase(F,Y),notasAlumno(X,F,Z),comentario(Z).
clasesAprobadasAlumno(X):-notasAlumno(X,Y,Z),codigoClase(Y,N),write(N),comentario(Z).
listaClasesCarrera(X):-clasesCarrera(Y,X),write(Y).
listaAlumnosCarrera(X):-alumnos(Y,_,X),write(Y).
listaAlumnosClase(X):-codigoClase(Y,X),notasAlumno(N,Y,_),write(N).
listaAlumnosClaseAprobados(X):-codigoClase(Y,X),notasAlumno(N,Y,Z),write(N),write(" "),write(Z),comentario(Z).
promedioAlumnos(X,Y):-notasAlumno(X,Y,Z),write(Z),S is Y+1,promedioAlumnos(X,S).

comentario(X):-X>64,write(" aprobado ").
comentario(X):-X<65,write(" reprobado ").

%para ingresar datos con assert
:- dynamic alumnos/3.
:- dynamic notasAlumno/3.

%reglas para probar la tarea

%claseAprobada(carlos,poo).
%claseAprobada(carlos,lenguajes).
%claseAprobada(alejandro,redes).
%clasesAprobadasAlumno(carlos).
%clasesAprobadasAlumno(luisa).
%listaClasesCarrera(is).
%listaClasesCarrera(medicina).
%listaClasesCarrera(ie).
%listaAlumnosCarrera(is).
%listaAlumnosCarrera(medicina).
%listaAlumnosCarrera(ie).
%listaAlumnosClase(lenguajes).
%listaAlumnosClase(salud).
%listaAlumnosClaseAprobados(poo).
%listaAlumnosClaseAprobados(redes).
%listaAlumnosClaseAprobados(morfologia).
%promedioAlumnos(carlos,1).
%promedioAlumnos(alejandro,1).
%assert(alumnos(gabriela,f,medicina)).
%listaClasesCarrera(medicina).
%assert(notasAlumno(gabriela,4,88)).
%clasesAprobadasAlumno(gabriela).





