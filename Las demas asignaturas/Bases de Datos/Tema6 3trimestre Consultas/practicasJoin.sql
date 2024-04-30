drop database  if exists games;
create database if not exists games;
use Games;

create table if not exists juego(
id_juego int not null auto_increment,
nombre_juego varchar(255) default null,
primary key(id_juego)
)
Engine = InnoDB;

create table if not exists usuario(
id_usuario int not null,
username varchar(255)default null,
primary key(id_usuario)
)
Engine = InnoDB;

create table if not exists juegoyusuario(
id_juego int not null,
id_usuario int not null,
foreign key(id_juego) references juego(id_juego)
on delete cascade on update cascade,
foreign key(id_usuario) references usuario(id_usuario)
on delete cascade on update cascade,
primary key(id_juego, id_usuario)
)
Engine = InnoDB;

/*2. Insertar los siguientes valores:*/

 insert into juego values
(1, 'Final Fantasy VII'),
(2, 'Zelda: A link to the past'),
(3, 'Crazy Taxy'),
(4, 'Donkey Kong Country'),
(5, 'Fallout 4'),
(6, 'Saints Row III'),
(7, 'La taba');

insert into usuario values 
(1, 'vichaunter'),
(2, 'pepito'),
(3, 'jaimito'),
(4, 'ataulfo');

insert into juegoyusuario values
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(6, 1),
(7, 1),
(3, 2),
(7, 2),
(1, 4),
(2, 4),
(4, 4),
(7, 4);

-- A) Cuántos juegos tiene asignados cada usuario
select u.username as Usuario, count(ju.id_juego) as NumJuegos
from usuario u
inner join juegoyusuario ju on ju.id_usuario = u.id_usuario
group by ju.id_usuario;

select u.username as Usuario, count(ju.id_juego) as NumJuegos
from usuario u
right join juegoyusuario ju on ju.id_usuario = u.id_usuario
group by ju.id_usuario;
-- B) Queremos saber todos los juegos que tenemos, y a qué usuarios pertenecen
select j.nombre_juego, u.username
from juego j
inner join juegoyusuario ju on ju.id_juego = j.id_juego
inner join usuario u on u.id_usuario=ju.id_usuario;

select j.nombre_juego, u.username
from juego j
left join juegoyusuario ju on ju.id_juego = j.id_juego
left join usuario u on u.id_usuario=ju.id_usuario;

select j.nombre_juego, u.username
from juego j
right join juegoyusuario ju on ju.id_juego = j.id_juego
right join usuario u on u.id_usuario=ju.id_usuario;
-- C) Mostrar todos los usuarios que tienen asignados al menos un juego. 
