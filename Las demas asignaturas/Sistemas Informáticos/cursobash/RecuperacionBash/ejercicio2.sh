#!/bin/bash
#SCRIPT2: examen2-tu-nombre.sh 
#Se debe trabajar como usuario root y en un disco donde no esté el sistema operativo.
#Crear un menú con las siguientes opciones :
#        1. Visualizar las particiones de todos los discos.
#                2. Hacer ping a una IP de la red.
#                        3. Visualizar la IP.
#                                4. Cambiar la IP.


#if [ ! -s $UID ]; then
	#echo "Este Script se debe ejecutar en modo root"
	#exit 1
#fi
menu() {
	echo "---------------------------"
	echo "1. Visualizar las particiones de todos los discos"
	echo "2. Hacer ping a una IP de la red"
	echo "3. Visualizar la IP"
	echo "4. Cambiar la IP"
	echo "5. Salir"
	echo "---------------------------"
	read opcion
	case $opcion in
		1)
			opcion1
			;;
		2)
			opcion2
			;;
		3)
			opcion3
			;;
		4)
			opcion4
			;;
		5)
			echo "Adioos"; exit 1
			;;
		*)
			echo "Opcion no válida"
			;;

	esac
}

opcion1() {
	fdisk -l
}

opcion2() {
	echo "Inserta una IP o direccion de internet para realizar PING"
	read ip
	ping $ip
}

opcion3() {
	ifconfig
}

opcion4() {
	ifconfig
	echo "------------------------"
	echo "Inserte interfaz de red a modificar"
	read interfaz
	echo "Inserte IP a reemplazar"
	read ipdel
	echo "Inserte máscara de red a reemplazar"
	read mascaradel
	echo "Inserte nueva IP"
	read ipadd
	echo "Inserte nueva máscara"
	read mascaraadd
	echo "------------------------"
	
	ip a del "$ipdel"/"$mascaradel" dev "$interfaz"
	ip a add "$ipadd"/"$mascaraadd" dev "$interfaz"

	echo "Nueva ip configurada"

	
}
while true; do
	menu
done
