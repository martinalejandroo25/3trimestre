#CON SENTENCIAS SQL

#1. Escribe una función para la base de datos tienda que devuelva el número total de productos que hay en la tabla productos.
delimiter $$
drop database if exists tienda;
create database if not exists tienda;
use tienda;


drop function if exists numProductos$$
create function numProductos()
returns int
reads sql data
begin
declare num int;
set num = (select count(articulos) from tienda_informática);
return num;
end
$$
delimiter  ;
#ejercicio nose el numero

set global log_bin_trust_function_creators = 1;
drop database if exists test;
create database if not exists test;
use test;

create table if not exists alumno(
id int unsigned,
nombre varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
primary key(id)
);

delimiter $$
drop procedure if exists insertarAlumno$$
create procedure insertarAlumno(id int unsigned, nombre varchar(50), apellido1 varchar(50), apellido2 varchar(50),
out error tinyint unsigned)
begin

	declare continue handler for 1062
    begin
		set error=1;
	end;
    set error = 0;
    insert into alumno values (id, nombre, apellido1, apellido2);
    
end
$$
delimiter ;
call insertarAlumno(1, 'Martin', 'Garbiso', 'Ortíz', @error);

select @error;
select * from alumno;+
