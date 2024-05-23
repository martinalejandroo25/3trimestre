#!/bin/bash
#SCRIPT  1: examen1-tu-nombre.sh
#Menú que actúe sobre un fichero (del directorio de trabajo) que se le pase como parámetro.
#Las opciones son:
#1. Mostrar el contenido del fichero. Si no existe el fichero se creará y se añadirá contenido
#2. Cambiar los permisos(en octal) al directorio para el usuario, grupo y otros. Previamente y posteriormente visualiza los permisos para comprobar que se han cambiado.
#3. Mover el fichero a un directorio que se solicita. 
#
#Las comprobaciones a realizar:
#    1. El número de parámetros es 1.
#        2. El parámetro es fichero.
#            3. Los valores de los permisos están entre 0 y 7.

archivo=$1
nombre=$(basename $archivo)
 if [ $# = 1 ]; then
menu() {
	echo "---------------------------"
	echo "1. Mostra el contenido del fichero, en caso de no existir se creará"
	echo "2. Cambiar los permisos en octal"
	echo "3. Mover el fichero a un nuevo directorio"
	echo "4. Salir"
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
			echo "Adioos"
			exit 1
			;;
		*)
			echo "Opción no válida, escoja otra"
			;;
	esac
}

opcion1() {
	if [ ! -e "$archivo" ]; then
		echo "El archivo no existe, creandolo ahora..."
		echo "1. Crear un nuevo directorio"
		echo "2. Crear un nuevo fichero de texto"
		read option
		case $option in
			1)
				mkdir "$nombre"
				;;
			2)
				nano "$nombre"
				;;
		esac
	elif [ -d "$archivo" ] && [ -s "$archivo" ]; then
		ls "$archivo"
	elif [ -d "$archivo" ]; then
		echo "El directorio existe pero está vacío"
	elif [ -f "$archivo" ] && [ -s "$archivo" ]; then
		cat "$archivo"
	elif [ -f "$archivo" ]; then
		echo "Este fichero existe pero está vacío"
	fi
}

opcion2() {
	echo "Cambiando permisos..."
	echo "inserte los nuevos permisos en octal"
	read permisos
	if [ ! -e "$archivo" ]; then
		echo "No se puede cambiar los permisos de un archivo que no existe, creélo"
	elif [ -e "$archivo" ]; then
		echo "A continuación se le pedirá permisos root"
		sudo chmod "$permisos" "$archivo"
		echo "Los permisos del fichero/directorio son actualmente: $( stat -c %a $archivo)"
	fi	
}

opcion3() {
	echo "Moviendo a nuevo directorio..."
       echo "Escribe el directorio donde moverá el archivo, en caso de no existir se creará"
       read directorio
       if [ ! -e "$directorio" ]; then
	      echo "creando y moviendo..."
	       mkdir "$directorio"
	       mv "$archivo" "$directorio"
	       echo "El directorio se ha creado y el archivo se removió al nuevo directorio"
	elif [ -d "$directorio" ]; then
		echo "moviendo..."
		mv "$archivo" "$directorio"
		echo "archivo movido con exito"
	elif [ -f "$directorio" ]; then
		echo "No se puede mover, no es un directorio"
	fi
}


while true; do
	menu
done

elif [ $# = 0 ]; then
	echo "Inserte un parámetro antes de ejecutar el script"
fi
