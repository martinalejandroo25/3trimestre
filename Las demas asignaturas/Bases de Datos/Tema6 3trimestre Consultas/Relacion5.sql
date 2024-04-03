drop database if exists relacion5;

create database if not exists relacion5;

use relacion5;

create table if not exists Vendedores(
    id_vend varchar(3) primary key, 
    nom_vend varchar(15), 
    salario int, 
    id_tienda varchar(3) 
    );
create table if not exists Articulos(
    id_art varchar(3) primary key,
    nom_art varchar(15),
    precio int,
    id_tipo varchar(3)
    );
create table if not exists Vendart(
    id_vend varchar(3),
    id_art varchar(3),
    fech_venta date,
    primary key (id_vend, id_art, fech_venta)
    );
create table if not exists Tienda(
    id_tienda varchar(3) primary key,
    nom_tienda varchar(15), 
    id_ciudad varchar(3)
    );
create table if not exists Ciudad(
    #id_ciudad varchar(3),
    nom_ciudad varchar(15)
    );
create table if not exists Tipoart(
    #id_tipo varchar(3),
    nom_tipo varchar(15)
    );

    insert into Ciudad
    VALUES
    ("CI1", "SEVILLA"),
    ("CI2", "ALMERIA"),
    ("CI3", "GRANADA");

insert into Tipoart
VALUES
("TI1", "BAZAR"),
("TI2", "COMESTIBLES"),
("TI3", "PAPELERIA");

insert into Tienda
VALUES
("TD1", "BAZARES S.A.", "CI1"),
("TD2", "CADENAS S.A", "CI1"),
("TD3", "MIRROS S.L.", "CI2"),
("TD4", "LUNA", "CI3"),
("TD5", "MAS S.A.", "CI3"),
("TD6", "JOYMON", "CI2");

insert into Vendedores
VALUES
("VN1", "JUAN", 1090, "TD1"),
("VN2", "PEPE", 1034, "TD1"),
("VN3", "LUCAS", 1100, "TD2"),
("VN4", "ANA", 890, "TD2"),
("VN5", "PEPA", 678, "TD3"),
("VN6", "MANUEL", 567, "TD2"),
("VN7", "LORENA", 1100, "TD3");

insert into Articulos
VALUES
("AR1", "RADIO," 78, "TI1"),
("AR2", "CARNE," 15, "TI2"),
("AR3", "BLOC," 5, "TI3"),
("AR4", "DVD," 24, "TI1"),
("AR5", "PESCADO," 23, "TI2"),
("AR6", "LECHE," 2, "TI2"),
("AR7", "CAMARA," 157, "TI1"),
("AR8", "LAPIZ," 1, "TI3"),
("AR9", "BOMBILLA," 2, "TI1");

insert into Vendart
VALUES
("VN1", "AR1", "01-02-2005"),
("VN1", "AR2", "01-02-2005"),
("VN2", "AR3", "01-03-2005"),
("VN1", "AR4", "01-04-2005"),
("VN1", "AR5", "01-06-2005"),
("VN3", "AR6", "01-07-2005"),
("VN3", "AR7", "01-08-2005"),
("VN3", "AR8", "12-09-2001"),
("VN4", "AR9", "10-10-2005"),
("VN4", "AR8", "1-11-2005"),
("VN5", "AR7", "1-10-2005"),
("VN5", "AR6", "2-11-2005"),
("VN6", "AR5", "3-11-2005"),
("VN6", "AR4", "4-11-2005"),
("VN7", "AR3", "5-11-2005"),
("VN7", "AR2", "7-11-2005"),
("VN1", "AR2", "6-11-2005"),
("VN2", "AR1", "8-10-2004"),
("VN3", "AR2", "1-1-1999"),
("VN4", "AR3", "25-10-2005"),
("VN5", "AR4", "26-10-2005"),
("VN5", "AR5", "27-10-2005"),
("VN6", "AR6", "28-10-2005"),
("VN5", "AR7", "28-10-2005"),
("VN4", "AR8", "30-10-2005"),
("VN3", "AR9", "24-08-2005"),
("VN7", "AR9", "25-08-2005");

-- CONSULTAS --


--1.- CIUDAD DONDE MAS SE VENDIO

--2.- TIENDA DONDE MAS SE VENDIO

--3.- VENDEDOR QUE MAS VENDIO

--4.-NOMBRE DE CIUDAD, VENDEDOR, ARTICULO, TIENDA TIPO Y PRECIO DE TODO LO VENDIDO

--5.- NOMBRE DEL TIPO DE ARTICULO MAS CARO

--6.- DATOS DEL VENDEDOR QUE MAS GANA

--7.- MONTANTE DE TODOS LOS ARTICULOS DE TIPO BAZAR

--8.- MONTANTE DE TODO LO QUE SE VENDIO EN ALMERIA

--9.- MONTANTE DE TODO LO QUE SE VENDIO EN LUNA

--10.- NOMBRE DE ARTICULO, TIPO PRECIO, TIENDA, CIUDAD Y FECHA DE LO QUE VENDIO MANUEL

--11.- TOTAL DEL SALARIO DE TODOS LOS TRABAJADORES DFE ALMERIA

--12.- NOMBRE DE LOS QUE VENDIERON LECHE

--13.- NOMBRE DE LOS QUE VENDIERON ARTICULOS DE TIPO BAZAR.

--14.- ARTICULOS DE TIPO BAZAR MAS VENDIDOS

--15.- NOMBRE DEL TIPO CON QUE MAS SE GANA

--16.- SALARIO Y NOMBRE DE TODOS LOS QUE VENDIERON BOMBILLAS.

--17.- TIENDAS Y CIUDAD DONDE SE VENDIO ALGUNA RADIO.

--18.- SUBIR EL SUELDO UN 2% A LOS EMPLEADOS DE SEVILLA

--19.- BAJA EL SUELDO UN 1% A LOS QUE NO HAYAN VENDIDO LECHE

--20.- SUBIR EL PRECIO UN 3% AL ARTICULO MAS VENDIDO

--21.- SUBIR EL SUELDO UN 2% A LOS ARTICULOS DE TIPO MAS VENDIDO

--22.- BAJAR UN 3% TODOS LOS ARTICULOS DE PAPELERIA

--23.- SUBIR EL PRECIO UN 1% A TODOS LOS ARTICULOS VENDIDOS EN ALMERIA

--24.- BAJAR EL PRECIO UN 5% AL ARTICULO QUE MAS HACE QUE NO SE VENDE

--25.- CERRAR LA TIENDA QUE MENOS HA VENDIDO

--26.- LA TIENDA LUNA PASA A LLAMARSE SOL Y LUNA

--27.- DESPEDIR AL TRABAJADOR QUE MAS VENDIO

--28.- LAS TIENDAS QUE NO VENDIERON LAPICES PASAN TODAS A SEVILLA

--29.- DESPEDIR AL QUE MENOS DINERO HA HECHO VENDIENDO.

--30.- EL ARTICULO QUE MENOS SE HA VENDIDO DEJAR DE ESTAR EN STOCK

--31.- EL ARTICULO QUE MENOS DINERO HA GENERADO DEJA DE ESTAR EN STOCK

--32.- EL TIPO DE ARTICULO MENOS VENDIDO DEJA DE ESTAR EN STOCK

--33.- EL TIPO DE ARTICULO CON EL QUE MENOS SE HA GANADO DEJA DE ESTAR EN STOCK

--34.- SE DESPIDEN A TODOS LOS TRABAJADORES QUE NO HAN VENDIDO ARTICULOS DE BAZAR

--35.- SE CIERRA LA TIENDA QUE MENOS DINERO HA GANADO.

--36.- TODOS LOS TRABAJADORES DE SEVILLA PASAN A LA TIENDA JOYMO