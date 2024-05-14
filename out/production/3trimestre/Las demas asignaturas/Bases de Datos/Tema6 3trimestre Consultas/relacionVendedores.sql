create database relacion5;

/*Usamos la base de datos relacion4*/
use relacion5;

/*Ceamos la tabla ciudad*/
create table if not exists ciudad(
id_ciudad char(3) primary key,
nom_ciudad varchar(25) not null)
engine = InnoDB;

/*Creamos la tabla tipoart*/
create table if not exists tipoart(
id_tipo char(3) primary key,
nom_tipo varchar(25) not null)
engine = InnoDB;

/*Creamos la tabla tienda*/
create table if not exists tienda(
id_tienda char(3) primary key,
nom_tienda varchar(25) not null,
id_ciudad char(3) not null,
foreign key (id_ciudad) references ciudad(id_ciudad)
on delete cascade on update cascade)
engine = InnoDB;

/*Creamos la tabla Articulos*/
create table if not exists articulos(
id_art char(3) primary key,
nom_art varchar(25) not null,
precio double not null,
id_tipo char(3) not null,
foreign key (id_tipo) references tipoart(id_tipo)
on delete cascade on update cascade)
engine=InnoDB;

/*Creamos la tabla vendedores*/
create table if not exists vendedores(
id_vend char(3) primary key,
nom_vend varchar(25) not null,
salario double not null,
id_tienda char(3) not null,
foreign key (id_tienda) references tienda(id_tienda)
on delete cascade on update cascade)
engine=InnoDB;

/*Creamos la tabla Vendart*/
create table if not exists vendart(
id_vend char(3) not null,
id_art char(3) not null,
fech_venta date not null,
primary key (id_vend, id_art, fech_venta),
foreign key (id_art) references articulos(id_art)
on delete cascade on update cascade,
foreign key (id_vend) references vendedores(id_vend)
on delete cascade on update cascade)
engine=InnoDB;

/*Insertamos los datos de la tabla ciudad*/
insert into ciudad values
('CI1', 'SEVILLA'),
('CI2', 'ALMERÍA'),
('CI3', 'GRANADA');

/*Insertamos los datos de la tabla tipoart*/
insert into tipoart values
('TI1', 'BAZAR'),
('TI2', 'COMESTIBLES'),
('TI3', 'PAPELERÍA');

/*Insertamos los datos de la tabla tienda*/
insert into tienda values
('TD1', 'BAZARES S.A.', 'CI1'),
('TD2', 'CADENAS S.A', 'CI1'),
('TD3', 'MIRROS S.L.', 'CI2'),
('TD4', 'LUNA', 'CI3'),
('TD5', 'MAS S.A.', 'CI3'),
('TD6', 'JOYMON', 'CI2');

/*Insertamos los datos de la tabla vendedores */
insert into vendedores values
('VN1', 'JUAN', '1090', 'TD1'),
('VN2', 'PEPE', '1034', 'TD1'),
('VN3', 'LUCAS', '1100', 'TD2'),
('VN4', 'ANA', '890', 'TD2'),
('VN5', 'PEPA', '678', 'TD3'),
('VN6', 'MANUEL', '567', 'TD2'),
('VN7', 'LORENA', '1100', 'TD3');

/*Insertamos los datos de la tabla articulos*/
insert into articulos values
('AR1', 'RADIO', 78, 'TI1'),
('AR2', 'CARNE', 15, 'TI2'),
('AR3', 'BLOC', 5, 'TI3'),
('AR4', 'DVD', 24, 'TI1'),
('AR5', 'PESCADO', 23, 'TI2'),
('AR6', 'LECHE', 2, 'TI2'),
('AR7', 'CAMARA', 157, 'TI1'),
('AR8', 'LAPIZ', 1, 'TI3'),
('AR9', 'BOMBILLA', 2, 'TI1');

/*Insertamos los datos de la tabla vendart*/
insert into vendart values
('VN1', 'AR1', '2005/02/01'),
('VN1', 'AR2', '2005/02/01'),
('VN2', 'AR3', '2005/03/01'),
('VN1', 'AR4', '2005/04/01'),
('VN1', 'AR5', '2005/06/01'),
('VN3', 'AR6', '2005/07/01'),
('VN3', 'AR7', '2005/08/01'),
('VN3', 'AR8', '2001/09/04'),
('VN4', 'AR9', '2005/10/10'),
('VN4', 'AR8', '2005/11/01'),
('VN5', 'AR7', '2005/10/01'),
('VN5', 'AR6', '2005/11/02'),
('VN6', 'AR5', '2005/11/03'),
('VN6', 'AR4', '2005/11/04'),
('VN7', 'AR3', '2005/11/05'),
('VN7', 'AR2', '2005/11/07'),
('VN1', 'AR2', '2005/11/06'),
('VN2', 'AR1', '2004/10/08'),
('VN3', 'AR2', '1999/1/1'),
('VN4', 'AR3', '2005/10/25'),
('VN5', 'AR4', '2005/10/26'),
('VN5', 'AR5', '2005/10/27'),
('VN6', 'AR6', '2005/10/28'),
('VN5', 'AR7', '2005/10/28'),
('VN4', 'AR8', '2005/10/30'),
('VN3', 'AR9', '2005/08/24'),
('VN7', 'AR9', '2005/08/25');


-- 1.- CIUDAD DONDE MAS SE VENDIO

-- 2.- TIENDA DONDE MAS SE VENDIO
select t.nom_tienda, count(*)
from tienda t, vendedores v, vendart va
where t.id_tienda = v.id_tienda
and v.id_vend = va.id_vend
group by t.nom_tienda
having count(*) = (select count(*)
					from tienda t, vendedores v, vendart va
					where t.id_tienda = v.id_tienda
					and v.id_vend = va.id_vend
                    group by t.id_tienda
                    order by 1 desc limit 1);
-- 3.- VENDEDOR QUE MAS VENDIO
select v.nom_vend, count(*)
from vendedores v, vendart va
where v.id_vend = va.id_vend
group by v.nom_vend
having count(*)=(select count(*)
				from vendedores v, vendart va
				where v.id_vend = va.id_vend
                group by v.id_vend
                order by 1 desc limit 1);
-- 4.-NOMBRE DE CIUDAD, VENDEDOR, ARTICULO, TIENDA TIPO Y PRECIO DE TODO LO VENDIDO
-- 5.- NOMBRE DEL TIPO DE ARTICULO MAS CARO
select va.id_tipo
-- 6.- DATOS DEL VENDEDOR QUE MAS GANA
-- 7.- MONTANTE DE TODOS LOS ARTICULOS DE TIPO BAZAR
-- 8.- MONTANTE DE TODO LO QUE SE VENDIO EN ALMERIA
-- 9.- MONTANTE DE TODO LO QUE SE VENDIO EN LUNA
-- 10.- NOMBRE DE ARTICULO, TIPO PRECIO, TIENDA, CIUDAD Y FECHA DE LO QUE VENDIO MANUEL
-- 11.- TOTAL DEL SALARIO DE TODOS LOS TRABAJADORES DFE ALMERIA
-- 12.- NOMBRE DE LOS QUE VENDIERON LECHE
-- 13.- NOMBRE DE LOS QUE VENDIERON ARTICULOS DE TIPO BAZAR.
-- 14.- ARTICULOS DE TIPO BAZAR MAS VENDIDOS
-- 15.- NOMBRE DEL TIPO CON QUE MAS SE GANA
-- 16.- SALARIO Y NOMBRE DE TODOS LOS QUE VENDIERON BOMBILLAS.
-- 17.- TIENDAS Y CIUDAD DONDE SE VENDIO ALGUNA RADIO.
-- 18.- SUBIR EL SUELDO UN 2% A LOS EMPLEADOS DE SEVILLA
-- 19.- BAJA EL SUELDO UN 1% A LOS QUE NO HAYAN VENDIDO LECHE
-- 20.- SUBIR EL PRECIO UN 3% AL ARTICULO MAS VENDIDO
-- 21.- SUBIR EL SUELDO UN 2% A LOS ARTICULOS DE TIPO MAS VENDIDO
-- 22.- BAJAR UN 3% TODOS LOS ARTICULOS DE PAPELERIA
-- 23.- SUBIR EL PRECIO UN 1% A TODOS LOS ARTICULOS VENDIDOS EN ALMERIA
-- 24.- BAJAR EL PRECIO UN 5% AL ARTICULO QUE MAS HACE QUE NO SE VENDE
-- 25.- CERRAR LA TIENDA QUE MENOS HA VENDIDO
-- 26.- LA TIENDA LUNA PASA A LLAMARSE SOL Y LUNA
-- 27.- DESPEDIR AL TRABAJADOR QUE MAS VENDIO
-- 28.- LAS TIENDAS QUE NO VENDIERON LAPICES PASAN TODAS A SEVILLA
-- 29.- DESPEDIR AL QUE MENOS DINERO HA HECHO VENDIENDO.
-- 30.- EL ARTICULO QUE MENOS SE HA VENDIDO DEJAR DE ESTAR EN STOCK
-- 31.- EL ARTICULO QUE MENOS DINERO HA GENERADO DEJA DE ESTAR EN STOCK
-- 32.- EL TIPO DE ARTICULO MENOS VENDIDO DEJA DE ESTAR EN STOCK
-- 33.- EL TIPO DE ARTICULO CON EL QUE MENOS SE HA GANADO DEJA DE ESTAR EN STOCK
-- 34.- SE DESPIDEN A TODOS LOS TRABAJADORES QUE NO HAN VENDIDO ARTICULOS DE BAZAR
-- 35.- SE CIERRA LA TIENDA QUE MENOS DINERO HA GANADO.
-- 36.- TODOS LOS TRABAJADORES DE SEVILLA PASAN A LA TIENDA JOYMON