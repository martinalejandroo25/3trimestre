#!/bin/bash
#SCRIPT2: examen2-tu-nombre.sh 
#Se debe trabajar como usuario root y en un disco donde no esté el sistema operativo.
#Crear un menú con las siguientes opciones :
#        1. Visualizar las particiones de todos los discos.
#                2. Hacer ping a una IP de la red.
#                        3. Visualizar la IP.
#                                4. Cambiar la IP.
#                                Se debe comprobar que el usuario que ejecuta el script es root.

menu() {
	echo "1. Visualizar las particiones de todos los discos"
	echo "2. hacer ping a una IP de la red"
	echo "3. Visualizar la IP"
	echo "4. Cambiar la IP"
	read opcion
	case $opcion in
		1)
			opcion1
			;;
		4)
			echo "Adioos"
			;;
		*)
			echo "inserte opción válida"
}
opcion1() {
fdiks -l
}
opcion2() {

}

while true do
	menu
done
