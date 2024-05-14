drop database if exists pruebaUsuarios;
create database if not exists pruebaUsuarios;
use pruebaUsuarios;

create user 'usuario1'@'locahost' identified by 'contraseña1';
grant select, insert on pruebaUsuario.* to 'usuario1'@'localhost'; 			-- GRANT, dar privilegios
revoke delete on pruebaUsuario.* from 'usuario1'@'localhost'; 				-- REVOKE, quitar privilegios

create user 'usuario2'@'localhost' identified by 'contraseña2';
grant select on pruebaUsuario.clientes to 'usuario2'@'localhost';	

create user 'usuario3'@'localhost' identified by 'contraseña3';
grant create tablespace on global to 'usuario3'@'localhost'; 				-- PRIVILEGIOS GLOBALES

drop user 'usuario2'@'localhost'; 											-- ELIMINACION DE USUARIO

alter user 'usuario3'@'localhost' identified by 'nuevacontraseña';			-- MODIFICAR USUARIOS

grant select on pruebaUsuario.productos to 'usuario1'@'localhost';
grant insert on pruebaUsuario.pedidos to 'usuario1'@'localhost';

revoke all privileges on *.* from 'usuario1'@'localhost';					-- REVOCAR TODOS LOS PRIVILEGIOS

grant select(nombre) on pruebaUsuario.clientes to 'usuario1'@'localhost';	-- PERMISOS A NIVEL DE COLUMNA
revoke insert(correo) on pruebaUsuario.clientes from 'usuario1'@'localhost'	-- REVOCAR A NIVEL DE COLUMNA

create user 'Lector'@'localhost'
grant select on *.* to 'Lector'@'localhost'									-- PERMISOS GLOBALES DE SOLO LECTURA
revoke all privileges on *.* from 'Lector'@'localhost'
