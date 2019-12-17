:- dynamic(estudiante/5).
:- dynamic(clase/5).
:- dynamic(clase/5).
:- dynamic(clasexalumno/5).

estudiante(20161002000,pedro_picapiedra,is,masculino).
estudiante(20161005458,carlos_perez,is,masculino).


clase(is,circuitos,is311).
clase(is,electronica,is411).
clase(is,basesI,is510).
clase(is,lenguajes,is513).
clase(is,redesI,511).
clase(mm,matematicaI,mm110).
clase(mm,geometria,mm11).
clase(mm,calculoI,mm201).
clase(mm,calculoII,mm202).
clase(mm,ecuaciones_diferenciales,mm411).
clase(mm,estadistica,mm402).
clase(mm,vectores,mm211).
clasexalumno(is411,20161002000,98).
clasexalumno(is411,20161005458,68).
clasexalumno(is411
,20141900230,68).

mostrarestudiantexCarrera(Carr):-estudiante(Cuent,Nomb,Carr,Sex),write(Cuent),tab(5),write(Nomb),tab(5),write(Carr),
    write(" "),write(Sex).


mostrarclasesxCarrera(Carr):-clase(Carr,Nom,Cod),write(Carr),tab(5),write(Nom),write(" "),write(Cod),tab(5).


apr(Cod,Cta):- estudiante(Cta,Nom,Carr,Sex),clase(Carr,NomClas,Cod),
    clasexalumno(Cod,Cta,Not), Not>=65, write(Nom),tab(5), write(NomClas),tab(5),
    write(Not),tab(5) ,write("APR").


promedioxestudiante(Cta):- clasexalumno(CodClas,Cta,Not), N is Not, write(N).


mostrarestudiantexclase(CodClas):-clasexalumno(CodClas,Cta,Not),
    clase(Carr,NomClas,CodClas),
    estudiante(Cta,Nomb,Carr,Sex),
    write(Nomb),tab(5), write(NomClas),tab(5),
    write(Not).


mostraretudiantexclaseapr(CodClas):-clasexalumno(CodClas,Cta,Not),
    clase(Carr,NomClas,CodClas),
    estudiante(Cta,Nomb,Carr,Sex),apr(CodClas,Cta).
















