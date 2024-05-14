
/* 1- Nombre de los empleados que han trabajado mas de 50 horas en proyectos*/
select distinct  nombre, sum(nhoras)as 'Horas Trabajadas'
from empleado inner join trabaja
on empleado.cdemp=trabaja.cdemp
group by empleado.cdemp
having sum(nhoras)>50;

select distinct  nombre, sum(nhoras) as 'Horas Trabajadas'
from empleado, trabaja
where empleado.cdemp=trabaja.cdemp
group by empleado.cdemp
having sum(nhoras)>50;

/* 2- Nombre de los departamentos que tienen empleados con apellido "Verde*/

select departamento.nombre
from departamento, empleado
where departamento.cddep=empleado.cddep
and empleado.nombre like '%Verde%';

select nombre from departamento
where cddep in(select cddep from empleado where nombre like  '%Verde%');

/* 3- Nombre de los proyectos en los que trabajan mas de dos empleados*/

select nombre, count(cdemp) as 'Nº Empleados'
from proyecto, trabaja
where trabaja.cdpro=proyecto.cdpro
group by trabaja.cdpro
having count(cdemp)>2;


/* 4- Lista de los empleados y el departamento al que pertenece, 
con indicacion del dinero total que deben percibir,
 a razón de 35 euros la hora.
la lista se presentara ordenada por orden alfabético
 de nombre de empleado,
y en caso de que no pertenezcan a nigun departamneto (null)
debe aparecer la palabra desconocido*/
select empleado.nombre, ifnull(departamento.nombre,'Desconocido'), ifnull(sum(nhoras)*35,'No ha trabaja en ningun proyecto')
from empleado
left join departamento
on empleado.cddep=departamento.cddep
left join trabaja
on empleado.cdemp=trabaja.cdemp
group by empleado.cdemp
order by 1;

/*5- lista de los nombres de todos los empleados y 
el numero de proyectos en los que esta trabajando 
(ten en cuenta que algunos empleados no trabajan en ningun proyecto)*/
select empleado.nombre, count(cdpro) as 'Nº de Proyectos'
from empleado
left join trabaja
on empleado.cdemp=trabaja.cdemp
group by empleado.cdemp
order by count(cdpro), empleado.nombre;
 
 
/*
6. Lista de empleados que trabajan en Málaga o en Almería.*/
select empleado.nombre
from empleado, departamento
where empleado.cddep=departamento.cddep
and (ciudad like 'Malaga'or ciudad like'Almeria')
order by empleado.nombre;

select empleado.nombre
from empleado, departamento
where empleado.cddep=departamento.cddep
and  ciudad in ( 'Malaga','Almeria')
order by empleado.nombre;


/*
7. Lista alfabética de los nombres de empleado
 y los nombres de sus jefes. Si el empleado no tiene
jefe debe aparecer la cadena “Sin Jefe”.
*/
select empleado.nombre as Empleado , ifnull(jefe.nombre,'Sin Jefe') as Jefe
from empleado
left join empleado as jefe
on empleado.cdjefe=jefe.cdemp
order by empleado.nombre;


/*8. Fechas de ingreso mínima. y máxima, por cada departamento(queremos todos los departamentos).*/
select min(fecha_ingreso),max(fecha_ingreso),departamento.nombre
from empleado
right join  departamento
on empleado.cddep=departamento.cddep
group by departamento.cddep;
/* asi no me saldrian todos los departamentos*/
select min(fecha_ingreso),max(fecha_ingreso),departamento.nombre
from empleado,  departamento
where empleado.cddep=departamento.cddep
group by departamento.cddep;

/* asi tampoco*/
select min(fecha_ingreso),max(fecha_ingreso),departamento.nombre
from empleado
inner join  departamento
on  empleado.cddep=departamento.cddep
group by departamento.cddep;

/*9. Nombres de empleados que trabajan en el mismo
 departamento que Carmen Violeta.*/
 select nombre
 from empleado
 where cddep =(select cddep from empleado 
				where nombre like 'Carmen Violeta')
and nombre <>'Carmen Violeta';
 
 
select nombre
from empleado
where cddep =(select cddep from empleado 
				where nombre like 'Carmen Violeta')
and nombre not like 'Carmen Violeta';
 /*
10. Media del año de ingreso en la empresa de los empleados
 que trabajan en algún proyecto.*/
 
 select round(avg(year(fecha_ingreso))) as 'Media Año de Ingreso'
 from empleado, trabaja
 where empleado.cdemp=trabaja.cdemp;
 
 
 
/*11. Nombre de los empleados que tienen de apellido Verde
 o Rojo, y simultáneamente su jefa es
Esperanza Amarillo.*/
select distinct e.nombre
from empleado as e, empleado as jefe
where e.cdjefe=jefe.cdemp
and (e.nombre like'%Verde%' or e.nombre like '%Rojo%')
and jefe.nombre like 'Esperanza Amarillo';

select distinct e.nombre
from empleado as e
inner join  empleado as jefe
on e.cdjefe=jefe.cdemp
and (e.nombre like'%Verde%' or e.nombre like '%Rojo%')
and jefe.nombre like 'Esperanza Amarillo';


/*12. Suponiendo que la letra que forma parte 
del código de empleado es la categoría laboral, listar los
empleados de categoría B que trabajan en algún proyecto.*/

select empleado.nombre
from empleado, trabaja
where empleado.cdemp=trabaja.cdemp
and trabaja.cdemp like 'b%';

select empleado.nombre
from empleado
inner join trabaja
on  empleado.cdemp=trabaja.cdemp
and trabaja.cdemp like 'b%';

/*13. Listado de nombres de departamento, ciudad del departamento 
y número de empleados del departamento.
Ordenada por nombre de ciudad y a igualdad de esta por el nombre del
departamento.*/
select departamento.nombre, ciudad,count(cdemp)  as 'Nº Empleados'
from empleado right join departamento
on empleado.cddep=departamento.cddep
group by departamento.cddep;


/*14. Lista de nombres de proyecto y suma de horas trabajadas en él, de los proyectos en los que se ha
trabajado más horas de la media de horas trabajadas
 en todos los proyectos.*/
 
 select proyecto.nombre, sum(nhoras)
 from trabaja, proyecto
 where trabaja.cdpro=proyecto.cdpro
 group by trabaja.cdpro
 having sum(nhoras)>(select avg(nhoras) from trabaja);
 
select proyecto.nombre, sum(nhoras)
 from trabaja
 inner join proyecto
 on trabaja.cdpro=proyecto.cdpro
 group by trabaja.cdpro
 having sum(nhoras)>(select avg(nhoras) from trabaja);
 
/*15. Nombre de proyecto y horas trabajadas, del proyecto en
 el que más horas se ha trabajado.*/
 select proyecto.nombre, sum(nhoras)
 from proyecto,trabaja
 where proyecto.cdpro=trabaja.cdpro
 group by trabaja.cdpro
 having sum(nhoras)=(select sum(nhoras)
					from trabaja
					group by cdpro
					order by 1 desc limit 1);
 
 
/*16. Lista de nombres de empleado que hayan 
trabajado entre 15 y 100 horas, entre todos los
proyectos en los que trabajan.*/

select empleado.nombre, sum(nhoras)
from empleado, trabaja
where empleado.cdemp=trabaja.cdemp
group by trabaja.cdemp
having sum(nhoras) between 15 and 100;

/*17. Lista de empleados que no son jefes de
 ningún otro empleado.*/
  /*averiguar quien son los jefes*/
select distinct cdjefe
					from empleado
                    where cdjefe is not null;
/*y luego la hago entera*/
select nombre 
from empleado
where cdemp not in(select distinct cdjefe
					from empleado
                    where cdjefe is not null)
order by nombre;
 

/*18. Se quiere premiar a los empleados del 
departamento que mejor productividad tenga. 
Para ello se decide que una medida de la productividad
puede ser el número de horas trabajadas por
empleados del departamento en proyectos,
dividida por los empleados de ese departamento.
¿Qué departamento es el más productivo?*/
select departamento.nombre, 
round(sum(nhoras)/count(trabaja.cdemp),2) as Productividad
from empleado,departamento,trabaja
where empleado.cddep=departamento.cddep
and empleado.cdemp=trabaja.cdemp
group by trabaja.cdemp
having sum(nhoras)/count(trabaja.cdemp)=(select sum(nhoras)/count(cdemp)
                        from trabaja
						group by cdemp
                        order by 1 desc limit 1);


select sum(nhoras)/count(cdemp)
                        from trabaja
						group by cdemp;



/*19. Lista donde aparezcan los nombres de empleados, 
nombres de sus departamentos y nombres de
proyectos en los que trabajan.
Los empleados sin departamento, o que no trabajen en proyectos
aparecerán en la lista y en lugar del departamento
o el proyecto aparecerá “*****”.*/
 select empleado.nombre as Empleado, 
 ifnull(departamento.nombre,'*****') as Departamento,
 ifnull(proyecto.nombre,'*****') as Proyecto
 from empleado
 left join trabaja
 on empleado.cdemp=trabaja.cdemp
 left join proyecto
 on trabaja.cdpro=proyecto.cdpro
 left join departamento
 on empleado.cddep=departamento.cddep
 order by 1;
 
/*20. Lista de los empleados indicando 
el número de días que llevan trabajando en la empresa.*/
select empleado.nombre, 
ifnull(datediff(curdate(),fecha_ingreso),'no ha trabajado')as Dias
from empleado
order by Dias;

/*21. Número de proyectos en los que trabajan empleados 
de la ciudad de Córdoba.*/
select count(trabaja.cdpro) as 'Nº de Proyectos'
from trabaja, empleado,departamento
where  trabaja.cdemp=empleado.cdemp
and  empleado.cddep=departamento.cddep
and ciudad like'Córdoba';
 //*con inner join*/
select count(trabaja.cdpro) as 'Nº de Proyectos'
from trabaja 
inner join empleado
on  trabaja.cdemp=empleado.cdemp
inner join departamento
on   empleado.cddep=departamento.cddep
and ciudad like'Córdoba';

/*22. Lista de los empleados que son jefes de más 
de un empleado,
junto con el número de empleados
que están a su cargo.*/

select jefe.nombre,count(empleado.cdemp) as 'Empleados a su cargo'
from empleado , empleado as jefe
where empleado.cdjefe=jefe.cdemp
group by jefe.nombre
having count(empleado.cdemp)>1
order by 1;
 /*con inner join*/
select jefe.nombre,count(empleado.cdemp) as 'Empleados a su cargo'
from empleado 
inner join  empleado as jefe
on empleado.cdjefe=jefe.cdemp
group by jefe.nombre
having count(empleado.cdemp)>1
order by 1;

/*23. Listado que indique años
 y número de empleados contratados cada año,
 todo ordenado por orden
ascendente de año.*/

select year(fecha_ingreso) as fecha,count(empleado.cdemp) as 'nº de Empleados'
from empleado
group by year(fecha_ingreso)
order by 1 asc;

/*24. Listar los nombres de proyectos
 en los que aparezca la palabra “energía”, indicando también el
nombre del departamento que lo gestiona.*/
select proyecto.nombre as  Proyecto, Departamento.nombre as Departamento
from proyecto, departamento
where departamento.cddep=proyecto.cddep 
and proyecto.nombre  like '%energía%' ;

/*25. Lista de departamentos que están en la misma ciudad
 que el departamento “Gerencia”.*/
 select nombre,ciudad
 from departamento 
 where ciudad in (Select  ciudad 
				from departamento 
                where nombre like 'Gerencia')
 and nombre <>'Gerencia';
                
SELECT nombre, ciudad
from departamento
where ciudad=(select ciudad 
			from departamento
            where nombre ='Gerencia')
and nombre<>'Gerencia';
 
 
/*26. Lista de departamentos donde exista algún trabajador
 con apellido “Amarillo”.*/
 select departamento.nombre
 from departamento, empleado
 where departamento.cddep=empleado.cddep
 and empleado.nombre like'%Amarillo%';
 
/*27. Lista de los nombres de proyecto 
y departamento que los gestiona, de los proyectos que tienen 0
horas de trabajo realizadas.*/
select   proyecto.nombre as proyecto,
departamento.nombre as departamento, sum(nhoras)
from proyecto, departamento, trabaja
where proyecto.cddep=departamento.cddep
and trabaja.cdpro=proyecto.cdpro
group by trabaja.cdpro
having sum(nhoras)=0;

select proyecto.nombre, departamento.nombre
from departamento, proyecto
where proyecto.cddep=departamento.cddep
and cdpro in (select cdpro
				from trabaja 
                group by cdpro
                having sum(nhoras)=0);
                
               
 
/*
28. Asignar el empleado “Manuel Amarillo” al departamento “05”*/

update empleado
set cddep='05'
where nombre like 'Manuel Amarillo';

select * from empleado;

/*29. Borrar los departamentos
 que no tienen empleados.*/
 Delete
 from departamento
 where cddep not in
				(select cddep 
                from empleado 
                where cddep is not null);
 
	select * from departamento;				
                    
/*30. Añadir todos los empleados
 del departamento 02 al proyecto MES.*/
 insert into trabaja (cdemp,cdpro)
 select cdemp,'MES'from empleado where cddep='02';
 
 select * from trabaja;









