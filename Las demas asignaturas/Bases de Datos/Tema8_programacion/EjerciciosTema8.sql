drop database if exists EjerciciosTema8;
create database if not exists EjerciciosTema8;
use EjerciciosTema8;

-- 1. Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.
delimiter $$
create procedure HolaMundo()
BEGIN
select 'Hola Mundo';
END;
$$

call HolaMundo();

-- 2. Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es positivo, negativo o cero.
create procedure ejercicio2()
-- 3. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor un número real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.
-- 4. Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
-- • [0,5) = Insuficiente
-- • [5,6) = Aprobado
-- • [6, 7) = Bien
-- • [7, 9) = Notable
-- • [9, 10] = Sobresaliente
-- • En cualquier otro caso la nota no será válida.
delimiter $$
drop procedure if exists Calificacion$$
create procedure Calificacion(in nota double, out calif varchar(25))
begin
	case
    when nota<5 then
		set calif="Insuficiente";
	when nota=5 and nota=6 then
		set calif="Aprobado";
	when nota=7 then
		set calif ="Bien";
	when nota=8 and nota=9 then
		set calif="Notable";
	when nota=10 then
		set calif="Sobresaliente";
	else
		set calif="El número introduccido no es válido";
	end case;
    end
    $$
    
    call Calificacion(6,@calif);
    select @calif;
-- 5. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor de la nota en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota correspondiente.
delimiter $$
drop procedure if exists diaSemana$$
create procedure diaSemana(in num double, out dia varchar(25))
begin
	case
    when num=1 then
		set dia="Lunes";
	when num=2 then
		set dia="Martes";
	when num=3 then
		set dia ="Miercoles";
	when num=4 then
		set dia="Jueves";
	when num=5 then
		set dia="Viernes";
	when num=6 then
		set dia="Sabado";
	when  num=7 then
		set dia="Domingo";
	else
		set dia="El número introduccido no es válido";
	end case;
    end
    $$
    
    call diaSemana(1,@dia);
    select @dia;
-- 6. Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
-- 7. Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.

/*Crea un procedimiento para la base de datos gestion de proyectos en el que le pase el codigo del departamento y me devuelva todos los empleados*/
use relacion6;
delimiter $$
drop procedure if exists EmpleadoDepartamento $$

create procedure EmpleadoDepartamento( in codigo char(2))
begin
select * from relacion6.empleado where empleado.cddep=codigo;
end
$$
call EmpleadoDepartamento('01');