/*ejercicio 1: crear base de datos llamada procedimientos y tabla operaciones(num1, num2, suma, producto int unsigned), procedimiento calcular_operaciones(numero, tope int unsigned), calcula la suma y producto*/
drop database if exists procedimientos;
create database if not exists procedimientos;
use procedimientos;
create table if not exists operaciones(
num1 int unsigned,
num2 int unsigned,
suma int unsigned,
producto int unsigned
);

delimiter $$
drop procedure calcular_operaciones$$
create procedure calcular_operaciones(in num1 int unsigned, in tope int unsigned)
begin
	declare suma int unsigned default 0;
    declare producto int unsigned default 1;
    declare i int unsigned;
    delete from operaciones;
    
    set i = num1;
    
    while i <= tope DO
		set suma = suma + i;
        set producto = producto * i;
        set i = i+ 1;
	end while;
    insert into operaciones(num1, num2, suma, producto)
    values(num1, tope, suma, producto);
    end$$
    
    delimiter ;
    
    call calcular_operaciones(4, 9);
    
    select * from operaciones;
    
    
    /*Verificar si un número es positivo, negativo o cero*/
    delimiter $$
    drop procedure if exists comprobarNumero$$
    create procedure comprobarNumero(numero float)
    begin
	if numero > 0 then
		select 'numero positivo' as resultado;
    elseif numero < 0 then
		select 'numero negativo' as resultado;
	else
		select 'cero' as resultado;
	end if;
        end $$

delimiter ;
call comprobarNumero(20);
call comprobarNumero(0);
call comprobarNumero(-23);

    /*modifica el anterior proc para que tenga un parámetro de salida con una cadena de caracteres indicando si es pos, nega, cero*/
    delimiter $$
    drop procedure if exists comprobarNumero$$
    create procedure comprobarNumero(
    in numero float,
    out signo varchar(15)
    )
    begin
	if numero > 0 then
		set signo = 'numero positivo';
    elseif numero < 0 then
		set signo = 'numero negativo';
	else
		set signo = 'cero';
	end if;
        end $$

delimiter ;
call comprobarNumero(20, @signo);
select @signo;
call comprobarNumero(0, @signo);
select @signo;
call comprobarNumero(-23, @signo);
select @signo;

/*determina la nota de un alumno(in num real, devuelve varchar)*/

delimiter $$
drop procedure if exists notas$$
create procedure notas(
in num int,
out nota varchar(20)
)
begin
if num between 0 and 4 then
	set nota = 'insuficiente';
elseif num between 5 and 6 then
	set nota = 'aprobado';
elseif num between 7 and 9 then
	set nota = 'notable';
elseif num = 10 then
	set nota = 'sobresaliente';
else
	set nota = 'no válido';
end if;
end$$

delimiter ;
call notas(5, @nota);
select @nota;
call notas(10, @nota);
select @nota;
call notas(15, @nota);
select @nota;

/*Obtener Empleados de un departamento(in nombre departamento, out select empleados del departamento)*/
use relacion6;
delimiter $$
drop procedure  if exists EmpPorDept$$
create procedure EmpPorDept(
in nombre_dept varchar(30))
begin
	select * from empleado e
    inner join departamento d on d.cddep = e.cddep
    where d.nombre like nombre_dept;
end$$

delimiter ;
call EmpPorDept('ventas');

/*listado de empleados y horas trabajadas()*/
delimiter $$
drop procedure if exists listaEmpHoras$$
create procedure listaEmpHoras()
begin
	select e.nombre, sum(t.nhoras) as HorasTrabajadas from empleado e
	join trabaja t on t.cdemp = e.cdemp
    group by e.nombre;
end$$

delimiter $$
call listaEmpHoras();

/*modificar la ciudad de un departamento*/
delimiter $$
drop procedure if exists modLocalidad$$
create procedure modLocalidad(
in cddepartamento char(2), 
in nuevaCiudad varchar(20)
)
begin
	update departamento
    set ciudad = nuevaCiudad
    where cddep = cddepartamento;
end $$
delimiter ;

select cddep, ciudad from departamento;
call modLocalidad('01', 'Sevilla');

/*Obtener Departamentos de un proyecto(in nombre proyecto, out nombre departamento)*/
delimiter $$
drop procedure if exists DepPorPro$$
create procedure DepPorPro(
in nompro varchar(30)
)
begin
	select d.nombre from departamento d
    inner join proyecto p on p.cddep = d.cddep
    where p.nombre like nompro;
end $$
