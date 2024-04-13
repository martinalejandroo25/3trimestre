drop database if exists relacion6;
create database if not exists relacion6;

create table if not exists departamento(
cddep char(2) primary key,
nombre varchar(30),
ciudad varchar(20)
);
create table if not exists empleado(
cdemp char(3),
nombre varchar (30),
fecha_ingreso Date,
cdjefe char(3),
cddep char(2),
foreign key (cddep) references departamento(cddep)
ON UPDATE CASCADE ON DELETE RESTRICT,
foreign key (cdjefe) references empleado (cdemp)
ON UPDATE CASCADE ON DELETE SET NULL
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
create table if not exists proyecto(
cdpro char(3) primary key,
nombre varchar(30),
cddep char(2),
foreign key(cddep) references departamento(cddep)
on update cascade on delete restrict
);

/*15*/
select sum(nhoras), trabaja.cdpro, proyecto.nombre
from trabaja
inner join proyecto
group by trabaja.cdpro
having sum(nhoras)=(select sum(nhoras)
					from trabaja
					group by cdpro
                    order by 1 desc limit 1);
                    
/*16*/
select empleado.nombre, sum(nhoras)
from empleado
inner join trabaja
on empleado.cdemp=trabaja.cdemp
group by trabaja.cdemp
having sum(nhoras) between 15 and 100;