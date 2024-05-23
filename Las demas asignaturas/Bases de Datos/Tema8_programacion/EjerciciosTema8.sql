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

#PROCEDIMIENTOS CON SENTENCIA SQL
# 7. Crea una base de datos llamada "procedimientos" que contenga una tabla llamada "ejercicio". La tabla debe tener una única columna llamada "numero" y el tipo de dato de esta columna debe ser INT UNSIGNED
drop database if exists procedimientos;
create database if not exists procedimientos;
use procedimientos;

create database if not exists ejercicio(
 int unsigned numero
);

#Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado "calcular_numero" con las siguientes características.
#el procedimiento recibe un parámetro de entrada llamado "valor_inicial" de tipo INT UNSIGNED y deberá almacenar en a tabla "ejercicio" toda a secuencia de números desde el valor inicial pasado como entrada hasta el 1
DELIMITER $$
create procedure calcular_numeros (in valor_inicial int unsigned)
begin
	declare contador int unsigned;
    set contador = valor_inicial;
    
	while contador >= 1 do
		insert into ejercicio (numero) values(contador);
		set contador = contador - 1;
	end while;
end $$
DELIMITER ;
# 8. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.

drop database if exists procedimientos;
create database if not exists procedimientos;
use procedimientos;

create database if not exists ejercicio(
 int unsigned numero
);

#Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado "calcular_numero" con las siguientes características.
#el procedimiento recibe un parámetro de entrada llamado "valor_inicial" de tipo INT UNSIGNED y deberá almacenar en a tabla "ejercicio" toda a secuencia de números desde el valor inicial pasado como entrada hasta el 1
DELIMITER $$
create procedure calcular_numeros (in valor_inicial int unsigned)
begin
	declare contador int unsigned;
    set contador = valor_inicial;
    
	while contador >= 1 do
		insert into ejercicio (numero) values(contador);
		set contador = contador - 1;
	end while;
end $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle_repeat$$
CREATE PROCEDURE ejemplo_bucle_repeat(IN tope INT, OUT suma INT)
BEGIN
DECLARE contador INT;
SET contador = 1;
#9. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
#10. Crea una base de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. Las dos tablas deben tener única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.

# Funciones sin sentencias SQL
#1. Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.
delimiter $$
drop function if exists numerotruefalse$$
create function numerotruefalse(num1)
returns boolean
begin
	declare num1 int
    if num1%2 == 0 then return true
		else return false
	end if
end
#2. Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.
delimiter $$

drop function if exists hipotenusaTriangulo$$
create function hipotenusaTriangulo(lado1 double, lado2 double)
returns double
begin
	declare hipotenusa double;
	set hipotenusa =sqrt(pow(lado1,2) + pow(lado2,2));
    return hipotenusa;
end

$$
#3. Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
delimiter $$

drop function if exists diasemana$$
create function diasemana(dia int)
returns varchar(10)
begin
	declare dia int;
    declare nombre varchar(10);
    case 
		when dia = 1 then set nombre = 'Lunes';
        when dia = 2 then set nombre = 'Martes';
        when dia = 3 then set nombre = 'Miercoles';
        when dia = 4 then set nombre = 'Jueves';
        when dia = 5 then set nombre = 'Viernes';
        when dia = 6 then set nombre = 'Sabado';
        when dia = 7 then set nombre = 'Domingo';
        else set nombre = 'no válido';
	end case;
    
    return nombre;
end$$
select diasemana(3);
	
#4. Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor de los tres.
delimiter $$

drop function mayorque$$
create function mayorque(num1 int, num2 int, num3 int)
returns int
begin
	
	if num1 >= num2 && num1 >= num3 then return num1;
		elseif num2 > num1 && num2 >= num3 then return num2;
		else return num3;
	end if;
end

$$
#5. Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como parámetro de entrada.
delimiter $$

drop function areacirculo$$
create function areacirculo(radio double)
returns double
begin
	declare area double;
    set area = round(pi()*pow(radio*2)
end
$$
#6. Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben como parámetros de entrada. Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01 la función tiene que devolver que han pasado 10 años.
#delimiter $$
# set datediff(fech_final,fech_ini)/365;

#curdate() es la fecha de hoy
#drop function if exists years
#create function if not exists years()

#7. Escribe una función que reciba una cadena de entrada y devuelva la misma cadena pero sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.


