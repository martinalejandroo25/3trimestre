drop database if exists examen_profesores_MartinGarbiso;
create database if not exists examen_profesores_MartinGarbiso;
use examen_profesores_MartinGarbiso;
create table if not exists instituto(
    cdinsti char(2) primary key,
    nombre varchar(30),
    ciudad varchar(20)
);
create table if not exists profesores(
    cdprofe char(3) primary key,
    nombre varchar(30),
    fech_ingreso date,
    cddirector char(3),
    cdinsti char(2),
    foreign key(cddirector) references profesores(cdprofe) 
    on update cascade on delete set null,
	foreign key(cdinsti) references instituto(cdinsti) 
	on update cascade on delete restrict
);
create table if not exists proyecto(
    cdpro char(3) primary key,
    nombre varchar(60),
    cdinsti char(2),
    foreign key (cdinsti) references instituto(cdinsti)
);
create table if not exists trabaja(
    cdprofe char(3),
    cdpro char(3),
    nhoras integer,
    primary key(cdprofe, cdpro),
    foreign key(cdprofe) references profesores(cdprofe) on update cascade on delete cascade,
    foreign key(cdpro) references proyecto(cdpro) on update cascade on delete cascade
);
insert into instituto
values ("01", "IES Jaroso", "Cuevas del Almanzora"),
    ("02", "IES El Palmeral", "Vera"),
    ("03", "IES Alyanub", "Vera"),
    ("04", "IES Cura Valera", "Huercal Overa"),
    ("05", "IES Albujaira", "Huercal Overa"),
    ("06", "IES Cardenal Cisneros", "Albox");
insert into profesores
VALUES
("A04","EDUARDO ROJO", 				"1997-09-01",NULL, "01"),
("A07","FRANCISCO CARMONA", 		"1996-09-01",NULL, "02"),
("A11","MARTIN FLORES", 			"2010-09-01",NULL, "05"),
("A14","JUAN ANGEL SOLER", 			"1995-09-01",NULL, "03"),
("A16","PEDRO GARCÍA GARCÍA", 		"1996-09-01",NULL, "06"),
("A01","ANA VICENTE BELMONTE", 		"2022-09-01", "A04", "01"),
("A02","CATALINA FLORES CAZORLA", 	"2002-09-01","A04", "01"),
("A03","JAVIER GUILLEN BENAVENTE", 	"2018-09-01","A04", "01"),
("A05","ELOY VILLAR", 				"2006-09-01","A04", "01"),
("A06","FRANCISCO MATIAS PRADO", 	"2016-09-01","A04", "01"),
("A08","MARI CARMEN SOLER", 		"1996-09-01","A07", "02"),
("A09","RICARDO MASIP", 			"1996-10-10","A07", "02"),
("A10","ESPERANZA MANZANERA",		NULL,		"A07", "02"),
("A12","FRANCISCA MARTÍNEZDE HARO", "2014-09-01","A11", "05"),
("A13","MANOLI DIAZ", 				"1995-09-01","A14", "03"),
("A15","PABLO FLORES DIAZ", 		"2021-09-01","A11", NULL),
("A17","JESÚS MELLADO GARCÍA", 		"1997-09-01","A16", NULL);

insert into proyecto
VALUES
("CAE", "CUIDADOS AUXILIARES DE ENFERMERÍA", "05"),
("DAW", "DESARROLLO DE APLICACIONES WEBS", "01"),
("GAM", "GESTION ADMINISTRATIVA GRADO MEDIO", "01"),
("GAS", "GESTION ADMINISTRATIVA GRADO SUPERIOR", "03"),
("SMR", "SISTEMAS MICROINFORMÁTICOS Y REDES", "04");

insert into trabaja
VALUES
("A01","DAW", 5),
("A02","DAW", 120),
("A02","SMR", 80),
("A03","DAW", 180),
("A03","SMR", 40),
("A04","DAW", 0),
("A04","SMR", 100),
("A05","GAM", 20),
("A06","GAS", 0),
("A11","CAE", 100),
("A13","GAM", 10),
("A14","GAS", 0),
("A16","DAW", 20);



/*CONSULTAS*/

-- 1. Nombre del profesor o profesores/as que han trabajado más número de horas en proyectos. La consulta debe mostrar el nombre del profesor y el número de horas.
select p.nombre as Profesor, sum(t.nhoras) as NumHoras
from profesores p, trabaja t
where p.cdprofe = t.cdprofe
group by p.nombre
having sum(t.nhoras)=(select sum(t.nhoras) 
						from trabaja t
                        group by t.cdprofe
                        order by 1 desc limit 1);
-- 2. Listado de la máxima fecha y mínima fecha de ingreso de los profesores por cada instituto (en el listado debe de aparecer la máxima fecha, mínima fecha y el nombre del instituto).
select i.nombre as Instituto, 
max(p.fech_ingreso) as Fecha_Maxima, 
min(p.fech_ingreso) as Fecha_Minima
from instituto i
inner join profesores p on p.cdinsti = i.cdinsti
group by i.nombre;

-- 3. Nombre de los proyectos en los que trabajan menos de dos profesores.
select p.nombre as Proyecto, count(t.cdprofe) as NumProfes
from proyecto p
inner join trabaja t on t.cdpro=p.cdpro
group by p.nombre
having count(t.cdprofe) <= 2; /*o <2 en caso de que no se quiera que aparezca los que contengan 2 profes*/

-- 4. Listado de los nombres de todos los profesores y el nombre del instituto al que pertenecen, con indicación del dinero total que deben percibir, a razón de 20 euros la hora de los proyectos en que trabajan. La lista se presentará ordenada por orden alfabético de nombre del profesor, y en caso de que no pertenezcan a ningún instituto debe aparecer la palabra “Sin instituto de Referencia”.
select pf.nombre, i.nombre, sum(t.nhoras)*20 as DineroTotal
from profesores pf
left join instituto i on pf.cdinsti = i.cdinsti
left join proyecto p on p.cdinsti=i.cdinsti
left join trabaja t on t.cdpro = p.cdpro
group by pf.nombre, i.nombre
having sum(t.nhoras) = (select sum(t.nhoras)
						from trabaja
                        group by pf.nombre);


/////////////////////

-- 5. Lista de los nombres de todos los profesores, y el número de proyectos en los que está trabajando (ten en cuenta que algunos profesores no trabajan en ningún proyecto) ordenados por número de proyectos de menor a mayor.
select pf.nombre, count(ifnull(p.cdpro, "Sin proyectos")) as NumProyectos
from profesores pf, proyecto p
where p.;

-- 6. Listado de profesores que trabajan en Cuevas del Almanzora o en Huercal Overa.
select p.nombre, i.ciudad from profesores p
inner join instituto i on i.cdinsti = p.cdinsti
where i.ciudad like "Cuevas del almanzora" or i.ciudad like "Huercal overa";
-- 7. Lista alfabética de los nombres de profesores y los nombres de sus directores. Si el profesor no tiene director debe aparecer la cadena “Es el director”.
select p.nombre, director.nombre
from profesores p, profesores director
where director.cdprofe = p.cddirector;

-- 8. Media del año de ingreso de los profesores que trabajan en algún proyecto.
select p.nombre, round(avg(year(p.fech_ingreso)),0)
from profesores p 
inner join trabaja t on t.cdprofe = p.cdprofe
where p.cdprofe is not null
group by p.nombre;
-- 9. Nombre de los profesores que tienen de apellido Flores o Guillen, y simultáneamente su directores es Eduardo Rojo.
select p.nombre as profesor, director.nombre as Director
from profesores p, profesores director
where director.cdprofe= p.cddirector
having (p.nombre like "%flores%" 
or p.nombre like "%guillen%") 
and director.nombre like "Eduardo rojo";
-- 10. Listado de nombres de todos los instituto, ciudad del instituto y número de profesores del instituto. Ordenada por nombre de ciudad y a igualdad de esta por el nombre del instituto.
select i.nombre, i.ciudad, count(p.cdprofe) as NumProfesores
from instituto i
left join profesores p on p.cdinsti = i.cdinsti 
group by i.nombre, i.ciudad
order by 1 asc;
-- 11. Lista de nombres de profesor que hayan trabajado entre 20 y 100 horas, entre todos los proyectos en los que trabajan.
select p.nombre, sum(t.nhoras) as NumHoras
from profesores p
inner join trabaja t on p.cdprofe = t.cdprofe
group by p.nombre
having sum(t.nhoras) between 20 and 100;
-- 12. Listado de profesores que son directores.
select distinct director.nombre from profesores p, profesores director
where p.cddirector = director.cdprofe;

-- 13. Se quiere premiar a los profesores del instituto que mejor productividad tenga. Para ello se decide que una medida de la productividad puede ser el número de horas trabajadas por el profesor del instituto en proyectos, dividida por los profesores de ese
-- instituto.
-- ¿Qué instituto es el más productivo (nombre del instituto)?

-- 14. Listado de todos los profesores, donde aparezcan los nombres de profesores, nombres
-- de sus institutos y nombres de proyectos en los que trabajan. Los profesores sin
-- instituto aparecerá “Sin Instituto de referencia”, y los que no trabajen en proyectos
-- aparecerán “Sin Proyecto”.
-- 15. Lista de todos los profesores indicando el número de días que llevan trabajando en el
-- Instituto, en el caso de que no tengan fecha de ingreso que aparezca “Sin datos fecha
-- de ingreso”. Ordenados por nombre de profesor y luego por los días trabajados

-- 16. Lista de los profesores que son directores de más de 2 profesores, junto con el número
-- de profesores que están a su cargo.
select director.nombre, count(p.cdprofe) as NumProfesACargo
from profesores director, profesores p
where director.cdprofe = p.cddirector
group by director.nombre
having count(p.cdprofe) > 2;
-- 17. Listar los nombres de proyectos en los que aparezca la palabra “Aplicaciones”,
-- indicando también el nombre del instituto que lo gestiona.
select p.nombre, i.nombre
from proyecto p
inner join instituto i on i.cdinsti = p.cdinsti
where p.nombre like "%aplicaciones%";
-- 18. Asignar a la profesora “Catalina Flores Cazorla” al instituto del Profesor Martin Flores.
update profesores p
set p.nombre = "Catalina Flores Cazorla"
where p.cdinsti=(select p.cdinsti
					from profesores p
                    where p.nombre like "Martin Flores");
-- 19. Borrar los institutos que no tienen profesores.
delete i.* from instituto i
inner join profesores p
where p.cdprofe is null;

select * from instituto;
-- 20. Añadir todos los profesores del instituto 05 al proyecto “GAS”.
update profesores p
inner join instituto i on i.cdinsti = p.cdinsti
inner join trabaja t on t.cdprofe = p.cdprofe
set p.cdinsti="05"
where t.cdpro="GAS";