drop database if exists relacion6;
create database if not exists relacion6;
use relacion6;

create table if not exists departamento(
cddep char(2) primary key,
nombre varchar(30),
ciudad varchar(20)
);
create table if not exists empleado(
cdemp char(3) primary key,
nombre varchar (30),
fecha_ingreso Date,
cdjefe char(3),
cddep char(2),
foreign key (cddep) references departamento(cddep)
ON UPDATE CASCADE ON DELETE RESTRICT,
foreign key (cdjefe) references empleado (cdemp)
ON UPDATE CASCADE ON DELETE SET NULL
);
create table if not exists proyecto(
cdpro char(3) primary key,
nombre varchar(30),
cddep char(2),
foreign key(cddep) references departamento(cddep)
on update cascade on delete restrict
);
create table if not exists trabaja(
cdemp char(3),
cdpro char(3),
nhoras integer,
primary key(cdemp, cdpro),
foreign key(cdemp) references empleado(cdemp)
on update cascade on delete cascade,
foreign key (cdpro) references proyecto(cdpro)
on update cascade on delete cascade
);

insert into departamento 
values
('01', 'Contabilidad-1', 'Almería'),
('02', 'Ventas', 'Almería'),
('03', 'I+D', 'Málaga'),
('04', 'Gerencia', 'Córdoba'),
('05', 'Administración', 'Córdoba'),
('06', 'Contabilidad-2', 'Córdoba');


insert into empleado
values
('A11', 'Esperanza Amarillo', '1993-09-23', NULL, '04'),
('A07', 'Elena Blanco', '1994-04-09', 'A11', '02'),
('A03', 'Pedro Rojo', '1995-03-07', 'A11', '01'),
('B06', 'Carmen Violeta', '1997-02-03', 'A07', '02'),
('C04', 'Ana Verde', NULL, 'A07', '02'),
('B09', 'Pablo Verde', '1998-10-12', 'A11', '03'),
('C08', 'Javier Naranja', NULL, 'B09', '03'),
('A10', 'Dolores Blanco', '1998-11-15', 'A11', '04'),
('B12', 'Juan Negro', '1997-02-03', 'A11', '05'),
('A13', 'Jesús Marrón', '1999-02-21', 'A11', '05'),
('A14', 'Manuel Amarillo', '2000-09-01', 'A11', NULL),
('C01', 'Juan Rojo', '1997-02-03', 'A03', '01'),
('B02', 'María Azul', '1996-01-09', 'A03', '01'),
('C05', 'Alfonso Amarillo', '1998-12-03', 'B06', '02');

insert into proyecto
values
("GRE", "Gestión residuos", '03'),
("DAG", "Depuración de aguas", '03'),
("AEE", "Análisis económico energías", '04'),
("MES", "Marketing de energía solar", '02');

insert into trabaja
values
("C01", "GRE", 10),
("C08", "GRE", 54),
("C01", "DAG", 5),
("C08", "DAG", 150),
("B09", "DAG", 100),
("A14", "DAG", 10),
("A11", "AEE", 15),
("C04", "AEE", 20),
("A11", "MES", 0),
("A03", "MES", 0);

-- 1. Nombre de los empleados que han trabajado más de 50 horas en proyectos.
select e.* from empleado e
inner join trabaja t on t.cdemp = e.cdemp
where nhoras >= 50;
-- 2. Nombre de los departamentos que tienen empleados con apellido “Verde”.
select d.* from departamento d
inner join empleado e on e.cddep = d.cddep
where e.nombre like '% verde';
-- 3. Nombre de los proyectos en los que trabajan más de dos empleados.
SELECT p.nombre, COUNT(t.cdemp) AS num_empleados
FROM proyecto p
JOIN trabaja t ON p.cdpro = t.cdpro
GROUP BY p.cdpro, p.nombre
HAVING COUNT(t.cdemp) >= 2;
-- 4. Lista de los empleados y el departamento al que pertenecen, con indicación del dinero total que deben percibir, a razón de 35 euros la hora. La lista se presentará ordenada por orden alfabético de nombre de empleado, y en caso de que no pertenezcan a ningún departamento (NULL) debe aparecer la palabra “DESCONOCIDO”.
select e.nombre as nombreEmpleado,
coalesce(d.nombre, 'DESCONOCIDO') as NombreDepartamento,
coalesce(t.nhoras, 0)*35 as TotalDinero from empleado e
left join departamento d on e.cddep = d.cddep
left join trabaja t on e.cdemp = t.cdemp
order by e.nombre asc;
-- 5. Lista de los nombres de todos los empleados, y el número de proyectos en los que está trabajando (ten en cuenta que algunos empleados no trabajan en ningún proyecto). 
select e.nombre as NombreEmpleado,
count(t.cdpro) as NumeroProyectos from empleado e
inner join trabaja t on t.cdemp = e.cdemp
group by NombreEmpleado
order by NombreEmpleado asc;
-- 6. Lista de empleados que trabajan en Málaga o en Almería.
select e.* from empleado e
inner join departamento d on d.cddep = e.cddep
where d.ciudad like "malaga" or d.ciudad like "almeria";
-- 7. Lista alfabética de los nombres de empleado y los nombres de sus jefes. Si el empleado no tiene jefe debe aparecer la cadena “Sin Jefe”.
select e.nombre as Empleado, ifnull(jefe.nombre, "Sin Jefe") as jefe
from empleado e
left join empleado as jefe on e.cdjefe = jefe.cdemp
order by e.nombre;

-- 8. Fechas de ingreso mínima. y máxima, por cada departamento.
select MIN(e.fecha_ingreso), MAX(e.fecha_ingreso) from empleado e 
inner join departamento d on d.cddep = e.cddep
group by d.cddep;
-- 9. Nombres de empleados que trabajan en el mismo departamento que Carmen Violeta.
select nombre from empleado
where cddep =(select cddep from empleado
                where nombre like "Carmen Violeta")
and nombre not like "carmen violeta";

-- 10. Media del año de ingreso en la empresa de los empleados que trabajan en algún proyecto.
select e.nombre, round(year(fecha_ingreso)) as media_año_ingreso
from empleado e
inner join trabaja t on t.cdemp = e.cdemp
where e.cdemp = t.cdemp;
-- 11. Nombre de los empleados que tienen de apellido Verde o Rojo, y simultáneamente su jefa es Esperanza Amarillo.
select distinct e.nombre 
from empleado as e, empleado as jefe
where e.cdjefe = jefe.cdemp 
and (e.nombre like "%verde" or e.nombre like "%rojo")
and jefe.nombre like "esperanza amarillo";

-- 12. Suponiendo que la letra que forma parte del código de empleado es la categoría laboral, listar los empleados de categoría B que trabajan en algún proyecto.
select e.nombre from empleado e
inner join trabaja t on t.cdemp = e.cdemp
and t.cdemp like "b%";

-- 13. Listado de nombres de departamento, ciudad del departamento y número de empleados del departamento. Ordenada por nombre de ciudad y a igualdad de esta por el nombre del departamento.
select d.nombre, d.ciudad, count(e.cddep) as numero_empleados
from departamento d
right join empleado e on e.cddep = d.cddep
group by d.cddep;

-- 14. Lista de nombres de proyecto y suma de horas trabajadas en él, de los proyectos en los que se ha trabajado más horas de la media de horas trabajadas en todos los proyectos.
select p.nombre, sum(t.nhoras)
from proyecto p
inner join trabaja t on t.cdpro=p.cdpro
group by t.cdpro
having sum(t.nhoras) > (select avg(nhoras) from trabaja);

-- 15. Nombre de proyecto y horas trabajadas, del proyecto en el que más horas se ha trabajado.
select p.nombre, sum(t.nhoras)
from proyecto p
join trabaja t on t.cdpro=p.cdpro
group by t.cdpro 
having sum(t.nhoras) = (select sum(nhoras)
						from trabaja
                        group by cdpro
                        order by 1 desc limit 1
                        );
-- 16. Lista de nombres de empleado que hayan trabajado entre 15 y 100 horas, entre todos los proyectos en los que trabajan.
select e.nombre, sum(nhoras)
from empleado e
inner join trabaja t on t.cdemp=e.cdemp
group by t.cdemp
having sum(nhoras) between 15 and 100;
-- 17. Lista de empleados que no son jefes de ningún otro empleado.
select distinct cdjefe
from empleado
where cdjefe is not null;

select e.*
from empleado e
where e.cdemp not in(select distinct cdjefe
						from empleado
						where cdjefe is not null); 
-- 18. Se quiere premiar a los empleados del departamento que mejor productividad tenga. Para ello se decide que una medida de la productividad puede ser el número de horas trabajadas por empleados del departamento en proyectos, dividida por los empleados de ese departamento.¿Qué departamento es el más productivo?
-- Para encontrar el departamento más productivo basado en la descripción del ejercicio, debemos calcular el número total de horas trabajadas en proyectos por departamento y dividirlo por el número de empleados en ese departamento. Luego, seleccionar el departamento con la mayor productividad.

select d.nombre as NombreDepartamento, round(sum(t.nhoras)/count(e.cdemp),2) as Productividad
from departamento d
join empleado e on e.cddep = d.cddep
join trabaja t on t.cdemp = e.cdemp
group by
d.cddep, d.nombre
order by Productividad desc limit 1;

-- 19. Lista donde aparezcan los nombres de empleados, nombres de sus departamentos y nombres de proyectos en los que trabajan. Los empleados sin departamento, o que no trabajen en proyectos aparecerán en la lista y en lugar del departamento o el proyecto aparecerá “*****”.
select e.nombre as Empleado,
ifnull(d.nombre, "*****") as NombreDepartamento, 
ifnull(p.nombre, "*****") as NombreProyecto
from empleado e
left join departamento d on d.cddep = e.cddep
left join proyecto p on p.cddep = d.cddep;

-- 20. Lista de los empleados indicando el número de días que llevan trabajando en la empresa.
select e.*, ifnull(datediff(curdate(), fecha_ingreso), "No ha trabajado") as DiasTrabajados
from empleado e
order by DiasTrabajados;

-- 21. Número de proyectos en los que trabajan empleados de la ciudad de Córdoba.
select count(t.cdpro) as NumProyectos
from trabaja t, departamento d, empleado e
where t.cdemp = e.cdemp
and e.cddep = d.cddep
and d.ciudad like "cordoba";

-- 22. Lista de los empleados que son jefes de más de un empleado, junto con el número de empleados que están a su cargo.
select jefe.nombre, count(e.cdemp) as "Empleados a cargo"
from empleado e, empleado jefe
where e.cdjefe = jefe.cdemp
group by jefe.nombre
having count(e.cdemp) > 1
order by 1;


-- 23. Listado que indique años y número de empleados contratados cada año, todo ordenado por orden ascendente de año.
select year(fecha_ingreso) as fecha, count(cdemp) as NumEmpleados
from empleado
group by year(fecha_ingreso)
order by 1 asc;
-- 24. Listar los nombres de proyectos en los que aparezca la palabra “energía”, indicando también el nombre del departamento que lo gestiona.
select p.nombre, d.nombre
from proyecto p
inner join departamento d on d.cddep = p.cddep
where p.nombre like "%energia%";
-- 25. Lista de departamentos que están en la misma ciudad que el departamento “Gerencia”.
select d.nombre, d.ciudad
from departamento d
where ciudad=(select ciudad from departamento
			  where nombre like "gerencia"
			  )
and d.nombre not like "gerencia";

-- 26. Lista de departamentos donde exista algún trabajador con apellido “Amarillo”.
select d.nombre from departamento d
inner join empleado e on d.cddep = e.cddep
where e.nombre like "%amarillo%";

select d.nombre from departamento d, empleado e
where e.cddep = d.cddep
and e.nombre like "%amarillo%";
-- 27. Lista de los nombres de proyecto y departamento que los gestiona, de los proyectos que tienen 0 horas de trabajo realizadas.
select distinct p.nombre as proyecto, 
d.nombre as Departamento, sum(t.nhoras)
from proyecto p
inner join departamento d on d.cddep = p.cddep
inner join trabaja t on t.cdpro = p.cdpro
group by t.cdpro
having sum(t.nhoras)=0;
-- 28. Asignar el empleado “Manuel Amarillo” al departamento “05”
update empleado
set cddep = '05'
where nombre like "Manuel Amarillo";
select * from empleado;
-- 29. Borrar los departamentos que no tienen empleados.
delete 
from departamento
where cddep not in
					(select cddep
                    from empleado
                    where cddep is not null);
select * from departamento;
-- 30. Añadir todos los empleados del departamento 02 al proyecto MES.
insert into trabaja(cdemp, cdpro)
select cdemp, 'MES' from empleado where cddep='02';
select * from trabaja;