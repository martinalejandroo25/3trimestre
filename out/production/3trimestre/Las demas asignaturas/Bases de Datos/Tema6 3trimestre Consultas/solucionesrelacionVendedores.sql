/*1- CIUDAD DONDE MAS SE VENDIO*/

    select nom_ciudad,count(*)
    from ciudad, tienda,vendedores,vendart
    where ciudad.id_ciudad=tienda.id_ciudad
    and tienda.id_tienda=vendedores.id_tienda
    and vendedores.id_vend=vendart.id_vend
    group by ciudad.id_ciudad
    having count(*)=(select count(*)
						from ciudad, tienda,vendedores,vendart
						where ciudad.id_ciudad=tienda.id_ciudad
						and tienda.id_tienda=vendedores.id_tienda
						and vendedores.id_vend=vendart.id_vend
						group by ciudad.id_ciudad
                        order by 1 desc limit 1);
      
					
					
                    
/*2-TIENDA DONDE MAS SE VENDIO-*/
select nom_tienda,count(*)
from tienda, vendedores, vendart
where tienda.id_tienda=vendedores.id_tienda
and vendedores.id_vend=vendart.id_vend
group by tienda.id_tienda
haVING count(*)=(select  count(*)
							from tienda, vendedores, vendart
							where tienda.id_tienda=vendedores.id_tienda
							and vendedores.id_vend=vendart.id_vend
							group by tienda.id_tienda
                            order by 1 desc limit 1);



/* 3. VENDEDOR QUE MAS VENDIO */
select nom_vend
from vendedores, vendart
where vendedores.id_vend=vendart.id_vend
group by vendart.id_vend
having count(*)=(select count(*)
					from vendart
                    group by id_vend
                    order by 1 desc limit 1);


/*4.- NOMBRE DE CIUDAD, VENDEDOR, ARTICULO,
TIENDA TIPO Y PRECIO DE TODO LO VENDIDO.*/
select  distinct nom_ciudad,nom_vend,nom_art,nom_tienda,nom_tipo,precio
from tipoart,articulos,vendart,vendedores,tienda,ciudad
where tipoart.id_tipo=articulos.id_tipo
and articulos.id_art=vendart.id_art
and vendart.id_vend=vendedores.id_vend
and vendedores.id_tienda=tienda.id_tienda
and tienda.id_ciudad=ciudad.id_ciudad
order by nom_tienda;


/*5- NOMBRE DEL TIPO DE ARTICULO MAS CARO*/
select t.nom_tipo, a.precio
from tipoart t, articulos a
where t.id_tipo=a.id_tipo
and  precio=(select  max(precio) from articulos);

select t.nom_tipo, a.precio
from tipoart t
inner join articulos a
on t.id_tipo=a.id_tipo
and  precio=(select  max(precio) from articulos);

/*6- DATOS DEL VENDEDOR QUE MAS GANA*/

select * from vendedores
where salario=(select max(salario) from vendedores);

/*7- ¿Cuantos articulos hay de tipo bazar?*/
select count(*) as 'numero de articulos' ,t.nom_tipo
from  articulos a,tipoart t
where a.id_tipo=t.id_tipo
and t.nom_tipo='bazar';

/*dinero ganado o montante de tipo bazar/*/
select sum(precio) as 'suma de articulos' ,t.nom_tipo
from  articulos a,tipoart t, vendart v
where a.id_tipo=t.id_tipo
and a.id_art=v.id_art
and t.nom_tipo='bazar';

/*8-MONTANTE DE TODO LO QUE SE VENDIO EN ALMERIA*/
select sum(a.precio) as 'total vendido', c.nom_ciudad as 'ciudad'
from  articulos a, vendart v,vendedores vend,tienda t, ciudad c
where a.id_art=v.id_art
and v.id_vend=vend.id_vend
and vend.id_tienda=t.id_tienda
and t.id_ciudad=c.id_ciudad
and c.nom_ciudad='almeria';

/*9- MONTANTE DE TODO LO QUE SE VENDIO EN  LUNA'*/
select sum(a.precio) as 'total vendido', t.nom_tienda as 'tienda'
from  articulos a, vendart v,vendedores vend,tienda t
where a.id_art=v.id_art
and v.id_vend=vend.id_vend
and vend.id_tienda=t.id_tienda
and t.nom_tienda='luna';
 

/*10- NOMBRE DE ARTICULO, TIPO, 
PRECIO,TIENDA, CIUDAD Y FECHA DE LO 
QUE VENDIO MANUEL*/
select a.nom_art,tipo.nom_tipo,a.precio,t.nom_tienda,c.nom_ciudad, v.fech_venta
from tipoart tipo,articulos a,vendart v,vendedores vend,tienda t,ciudad c
where tipo.id_tipo=a.id_tipo
and a.id_art=v.id_art
and v.id_vend=vend.id_vend
and vend.id_tienda=t.id_tienda
and t.id_ciudad=c.id_ciudad 
and vend.nom_vend='manuel';

/*11-TOTAL DEL SALARIO DE TODOS LOS TRABAJADORES DE ALMERIA*/
select sum(salario)
from vendedores,tienda
where vendedores.id_tienda=tienda.id_tienda
and tienda.id_ciudad=(select id_ciudad 
						from 
						ciudad 
                        where nom_ciudad like 'almería');
/* o couna subconsulta*/
select sum(salario)
from vendedores,tienda
where vendedores.id_tienda=tienda.id_tienda
and tienda.id_ciudad=(select id_ciudad 
						from 
						ciudad 
                        where nom_ciudad like 'almería');

/*12-NOMBRE DE LOS TRABAJADORES QUE VENDIERON LECHE */
select nom_vend
from vendedores, articulos, vendart
where vendedores.id_vend=vendart.id_vend
and vendart.id_art=articulos.id_art
and nom_art like 'leche';

/*13- NOMBRE DE LOS QUE VENDIERON ARTICULOS DE TIPO BAZAR*/
select distinct nom_vend
from vendedores, articulos, vendart
where vendedores.id_vend=vendart.id_vend
and vendart.id_art=articulos.id_art
and id_tipo=(Select id_tipo 
				from tipoart
                where nom_tipo like'bazar')
				order by nom_vend;

/*-------*/
select distinct nom_vend
from vendedores, articulos, vendart,tipoart
where vendedores.id_vend=vendart.id_vend
and vendart.id_art=articulos.id_art
and articulos.id_tipo=tipoart.id_tipo
and nom_tipo like 'bazar';

/*14- ARTICULOS DE TIPO BAZAR MAS VENDIDOS*/
select nom_art,count(*)
from vendart,articulos,tipoart
where vendart.id_art=articulos.id_art
and articulos.id_tipo=tipoart.id_tipo
and nom_tipo like 'Bazar'
group by articulos.id_art
having count(*)=(select count(*)
				from vendart,articulos,tipoart
				where vendart.id_art=articulos.id_art
				and articulos.id_tipo=tipoart.id_tipo
				and nom_tipo like 'Bazar'
				group by articulos.id_art
				order by count(*) desc limit 1);


/*15- NOMBRE DEL TIPO  CON QUE MAS SE GANA*/
select  nom_tipo, sum(precio)
from vendart,tipoart,articulos
where vendart.id_art=articulos.id_art
and articulos.id_tipo=tipoart.id_tipo
group by nom_tipo
having sum(precio)=(select  sum(precio)
				from vendart,tipoart,articulos
				where vendart.id_art=articulos.id_art
				and articulos.id_tipo=tipoart.id_tipo
				group by nom_tipo
                order by 1 desc limit 1);


/*16- SALARIO Y NOMBRE DE TODOS LOS QUE VENDIERON BOMBILLAS*/
select nom_vend,salario
from vendedores,vendart
where vendedores.id_vend=vendart.id_vend
and id_art=(select id_art from articulos
					where nom_art like 'Bombilla')
					order by salario;

select nom_vend,salario
from vendedores,vendart,articulos
where vendedores.id_vend=vendart.id_vend
and vendart.id_art=articulos.id_art
and nom_art like 'Bombilla'
order by salario;

/*17- TIENDA Y CIUDAD  DONDE SE VENDIO ALGUNA RADIO*/
select distinct nom_tienda,nom_ciudad
from vendart, articulos,vendedores,tienda,ciudad
where vendart.id_art=articulos.id_art
and vendart.id_vend=vendedores.id_vend
and vendedores.id_tienda=tienda.id_tienda
and tienda.id_ciudad=ciudad.id_ciudad
and nom_art like 'Radio';

select distinct nom_tienda,nom_ciudad
from vendart, vendedores,tienda,ciudad
where vendart.id_vend=vendedores.id_vend
and vendedores.id_tienda=tienda.id_tienda
and tienda.id_ciudad=ciudad.id_ciudad
and id_art=(select id_art 
			from articulos
            where nom_art like 'Radio');

/*18 subir el sueldo un 2% a los empleados de sevilla*/
update vendedores set salario=salario+(salario*2/100)
where id_tienda in (select id_tienda
					from tienda,ciudad
                    where tienda.id_ciudad=ciudad.id_ciudad
                    and nom_ciudad like 'sevilla');
                    
select * from vendedores;

/*19 Baja el sueldo un 1%  a los que no hayan vendido
 leche revisarla */
 
update  vendedores set salario=salario-(salario*1/100)
where id_vend  not in (select distinct id_vend
					from vendart,articulos 
					where vendart.id_art=articulos.id_art
                    and nom_art  like 'leche'); 
                    

                    
                    
/*20 subir el precio un 3% al articulo mas vendido*/
update articulos set precio=precio+(precio*3/100)
where id_art in (select id_art 
					from vendart
                    group by id_art
                    having count(*)=(select count(*)
										from vendart
                                        group by id_art
                                        order by 1 desc limit 1));
/*averiguo cual es el articulo mas vendido*/
select id_art 
					from vendart
                    group by id_art
                    having count(*)=(select count(*)
										from vendart
                                        group by id_art
                                        order by 1 desc limit 1);
select * from articulos;

/*21 subir el precio un 2% a los articulos del tipo mas vendido*/
/* crear una vista del tipo mas vendido*/
create view tipomasvendido as
select articulos.id_tipo
from vendart,articulos,tipoart
where vendart.id_art=articulos.id_art
group by articulos.id_tipo
having count(*)=(select count(*)
				from vendart,articulos
				where vendart.id_art=articulos.id_art
				group by articulos.id_tipo
                order by 1 desc limit 1);
/*muestro el tipo mas vendido*/
select * from tipomasvendido;
                
update articulos set precio=precio+(precio*2/100)
where id_tipo=(select id_tipo from tipomasvendido);
        
						
/*22 bajar un 3% a todos los articulos de papeleria*/

update articulos set precio=precio-(precio*3/100)
where id_tipo = (select id_tipo from tipoart where nom_tipo like 'papeleria');
/* las dos formas son correctas*/
update articulos, tipoart set precio=precio-(precio*3/100)
where articulos.id_tipo=tipoart.id_tipo
and nom_tipo like 'papeleria';

/*23 subir el precio un 1% a todos los articulos
 vendidos en almeria*/
update articulos set  precio=precio+(precio*1/100)
where id_art in (select distinct id_art
					from vendart,vendedores,tienda,ciudad
					where vendart.id_vend=vendedores.id_vend
					and vendedores.id_tienda=tienda.id_tienda
					and tienda.id_ciudad=ciudad.id_ciudad
					and nom_ciudad like 'Almeria');
                    
/*con una vista y luego actualizamos la tabla articulos*/
create view VendidosAlmeria as
select distinct id_art
					from vendart,vendedores,tienda,ciudad
					where vendart.id_vend=vendedores.id_vend
					and vendedores.id_tienda=tienda.id_tienda
					and tienda.id_ciudad=ciudad.id_ciudad
					and nom_ciudad like 'Almeria';
select * from VendidosAlmeria;
update articulos set  precio=precio+(precio*1/100)
where id_art in (select id_art from VendidosAlmeria);
			                
/*24 bajar el precio un 5%  al articulo que mas 
 hace que no se vende*/
update articulos set  precio=precio-(precio*5/100)
where id_art in (select id_art
				from vendart
				where fech_venta=(select min(fech_venta) 
                from vendart));

/*averiguo el articulo que hace mas tiempo se vendio*/
select id_art
				from vendart
				where fech_venta=(select min(fech_venta) 
                from vendart);


/*25 cerrar la tienda que menos ha vendido*/
delete from tienda
where id_tienda in (select id_tienda
					from vendart, vendedores
					where vendart.id_vend=vendedores.id_vend
					group by id_tienda
					having count(*)=(select count(*)
									from vendart, vendedores
									where vendart.id_vend=vendedores.id_vend
									group by id_tienda
									order by 1 limit 1));

/*tienda que menos ha vendido*/

select id_tienda
from vendart, vendedores
where vendart.id_vend=vendedores.id_vend
group by id_tienda
having count(*)=(select count(*)
		from vendart, vendedores
		where vendart.id_vend=vendedores.id_vend
		group by id_tienda
        order by 1 limit 1);

/*compruebo que he borrado la tienda o cerrado la tienda*/
select * from tienda;

/* la puedo hacer creando una vista*/
create view cerrartienda as
select id_tienda
from vendart, vendedores
where vendart.id_vend=vendedores.id_vend
group by id_tienda
having count(*)=(select count(*)
		from vendart, vendedores
		where vendart.id_vend=vendedores.id_vend
		group by id_tienda
        order by 1 limit 1);
        
select * from cerrartienda;
/*para borrarla*/
delete from tienda
where id_tienda in (select id_tienda from cerrartienda);

select * from tienda;

/*26 la tienda luna pasa a llamarse sol y luna*/

update tienda set nom_tienda='Sol y Luna'
where nom_tienda like 'Luna';
 
 select * from tienda;
/*27 despedir al trabajador que mas vendio*/
/*trabajajador que mas vendio*/
select id_vend
from vendart
group by id_vend
having count(*)=(select count(*)
				from vendart
				group by id_vend
                order by 1 desc limit 1);
       /*lo elimino*/         
delete from vendedores
where id_vend in (select id_vend
					from vendart
					group by id_vend
					having count(*)=(select count(*)
									from vendart
									group by id_vend
									order by 1 desc limit 1));
                                    
                                    
/*tambien lo podeis hacer con una vista*/
/*28 las tiendas que no vendieron lapices 
pasan todas a sevilla*/

update tienda set id_ciudad=(select id_ciudad
							from ciudad
                            where nom_ciudad like 'Sevilla')
where id_tienda not in(select distinct id_tienda
						from vendart,vendedores,articulos
						where vendart.id_vend=vendedores.id_vend
						and vendart.id_art=articulos.id_art
						and nom_art like 'Lapiz');

/*tiendas que vendieron lapices*/
select distinct id_tienda
from vendart,vendedores,articulos
where vendart.id_vend=vendedores.id_vend
and vendart.id_art=articulos.id_art
and nom_art like 'Lapiz';

/*29 depedir al vendedore que menos dinero ha hecho vendiendo*/
/*averiguo quien es el vendedor*/
select id_vend 
from vendart,articulos
where vendart.id_art=articulos.id_art
group by id_vend
having sum(precio)=(select sum(precio)
				from vendart,articulos
				where vendart.id_art=articulos.id_art
				group by id_vend
                order by 1 limit 1);


delete from vendedores
where id_vend in (select id_vend 
					from vendart,articulos
					where vendart.id_art=articulos.id_art
					group by id_vend
					having sum(precio)=(select sum(precio)
										from vendart,articulos
										where vendart.id_art=articulos.id_art
										group by id_vend
										order by 1 limit 1));
/* pendiente hacerla con una vista*/
                
                
select * from vendedores;

/*30 el articulo que menos se ha vendido deja de estar en stock*/

select id_art, count(*)
from vendart
group by id_art
having count(*)=(select count(*)
				from vendart
				group by id_art
				order by 1 limit 1);

select * from vendart;

delete from articulos
where id_art in (select id_art
from vendart
group by id_art
having count(*)=(select count(*)
		from vendart
		group by id_art
        order by 1 limit 1));
        
select * from articulos;
/*31 el articulo que menos
 dinero ha generado deja de estar en stock*/
/*creaNDO UNA VISTA*/

create view articulosstock as 
select vendart.id_art
from vendart,articulos
where vendart.id_art=articulos.id_art
group by vendart.id_art
having sum(precio)=(select sum(precio)
					from vendart,articulos
                    where vendart.id_art=articulos.id_art
					group by vendart.id_art
                    order by 1 limit 1);
                    
select * from articulosstock;
                    
                    
delete from articulos
where id_art in (select id_art
				from articulosstock);



                    
                    
select * from articulosstock;
   /* sin vista*/
   
delete from articulos
where id_art in( select vendart.id_art
				from vendart,articulos
				where vendart.id_art=articulos.id_art
				group by vendart.id_art
				having sum(precio)=(select sum(precio)
									from vendart,articulos
									where vendart.id_art=articulos.id_art
									group by vendart.id_art
									order by 1 limit 1));                
                    
/*32 el tipo de articulo menos vendido deja de estar en stock*/

delete from tipoart
where id_tipo in (select id_tipo
				from vendart,articulos
				where vendart.id_art=articulos.id_art
				group by id_tipo
				having count(*)=(select count(*)
								from vendart,articulos
								where vendart.id_art=articulos.id_art
								group by id_tipo
								order by 1 limit 1));
                
                
//*CREADO VISTA*/
CREATE VIEW ARTICULOMENOSVENDIDO AS
select id_tipo
from vendart,articulos
where vendart.id_art=articulos.id_art
group by id_tipo
having count(*)=(select count(*)
				from vendart,articulos
				where vendart.id_art=articulos.id_art
				group by id_tipo
                order by 1 limit 1);


DELETE FROM ARTICULOS 
WHERE id_tipo in (select id_tipo from articulomenosvendido);
                
/*33 el tipo con el que menos se ha ganado deja de estar en stock
*/
create view  tipostock as
select id_tipo
from vendart,articulos
where vendart.id_art=articulos.id_art
group by id_tipo
having sum(precio)=(select sum(precio)
				from vendart,articulos
				where vendart.id_art=articulos.id_art
				group by id_tipo
                order by 1 limit 1);
                
delete from tipoart
where id_tipo in (select id_tipo from tipostock);
/*sin vista*/
delete from tipoart
where id_tipo in(select id_tipo
					from vendart,articulos
					where vendart.id_art=articulos.id_art
					group by id_tipo
					having sum(precio)=(select sum(precio)
									from vendart,articulos
									where vendart.id_art=articulos.id_art
									group by id_tipo
									order by 1 limit 1));

/*34 se despide a todos los 
trabajadores que no han vendido articulos  de bazar*/

delete from vendedores
where id_vend not in (select id_vend
					from vendart,articulos,tipoart
					where vendart.id_art=articulos.id_art
					and articulos.id_tipo=tipoart.id_tipo
					and nom_tipo like 'Bazar');


select id_vend
from vendart,articulos,tipoart
where vendart.id_art=articulos.id_art
and articulos.id_tipo=tipoart.id_tipo
and nom_tipo like 'Bazar';

/*35 se cierra LA TIENDA QUE MENOS DINERO HA GANADO*/

delete from tienda
where id_tienda in (select id_tienda
				from vendart,vendedores,articulos
				where vendart.id_vend=vendedores.id_vend
			and vendart.id_art=articulos.id_art
			group by id_tienda
			having sum(precio)=(select sum(precio)
								from vendart,vendedores,articulos
								where vendart.id_vend=vendedores.id_vend
								and vendart.id_art=articulos.id_art
								group by id_tienda
								order by 1 limit 1));

/*averiguo la tienda que menos ha vendido*/
select id_tienda
from vendart,vendedores,articulos
where vendart.id_vend=vendedores.id_vend
and vendart.id_art=articulos.id_art
group by id_tienda
 having sum(precio)=(select sum(precio)
					from vendart,vendedores,articulos
					where vendart.id_vend=vendedores.id_vend
					and vendart.id_art=articulos.id_art
					group by id_tienda
					order by 1 limit 1);
/*36 Todos los trabajadores de sevilla
 pasan a la tienda de Joymon*/
 
update vendedores set id_tienda=(select 
								id_tienda from tienda
                                where nom_tienda like 
								'Joymon')
where id_tienda in (select id_tienda
					from ciudad, tienda
					where ciudad.id_ciudad=tienda.id_ciudad
					and  nom_ciudad like 'Sevilla');








			