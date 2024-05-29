# Función 1: Verificar si un número es divisible por otro

set global log_bin_trust_function_creators = 1;

drop database if exists ejercicios;
Create database if not exists ejercicios;
use ejercicios;

delimiter $$
drop function if exists es_divisible $$
create function es_divisible(dividendo int, divisor int)
returns boolean
begin
	return dividendo % divisor = 0;
end$$
delimiter ;

select es_divisible(10,2); -- true es 1
select es_divisible(10,3);-- false es 0

# Ejercicio2: verificar si un numero es multiplo de 5
delimiter $$
drop function if exists esMultiplo5$$
create function esMultiplo5(num int)
returns boolean
begin
	return num % 5 = 0;
end$$
delimiter ;

select esMultiplo5(10);
select esMultiplo5(12);

/*ejercicio 3: calcular área de un triángulo*/
delimiter $$
drop function if exists area_triangulo$$
create function area_triangulo(base float, altura float)
returns float
begin
	return ((base*altura)/2);
end$$
delimiter ;
select area_triangulo(15, 20);

/*ejercicio4: funcion para devolver nombre del mes dado un numero*/
delimiter $$
drop function if exists meses$$
create function meses(mes int)
returns varchar(12)
begin
declare nombre varchar(12);
set nombre = case mes
when 1 then 'Enero'
when 2 then 'Febrero'
when 3 then 'Marzo'
when 4 then 'Abril'
when 5 then 'Mayo'
when 6 then 'Junio'
when 7 then 'Julio'
when 8 then 'Agosto'
when 9 then 'Septiembre'
when 10 then 'Octubre'
when 11 then 'Noviembre'
when 12 then 'Diciembre'
else 'No válido'
end;
return nombre;
end$$

delimiter ;

select meses(1);
select meses(6);
select meses(14);

/*ejercicio 5: devolver el menor de 3 numeros*/

delimiter $$
drop function if exists menor$$
create function menor(num1 int, num2 int, num3 int)
returns int
begin
	return least(num1, num2, num3);
end$$

delimiter ;

select menor(4, 7, 3);