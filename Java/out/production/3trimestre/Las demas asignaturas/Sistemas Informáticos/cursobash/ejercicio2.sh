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
nombre= $(basename "$archivo")
menu(){
echo "1. Mostrar el contenido del fichero. Si no existe el fichero se creará y se añadirá contenido"
echo "2. Cambiar los permisos (en octal) al directorio para el usuario, grupo y otros"
echo "3. Mover el fichero a un directorio que se solicita"
echo "4. Salir"
read option

case $option in
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
		echo "Adioos, gracias por usarme"; exit 1
		;;
	*)
		echo "Opción no válida"
		;;
esac

}

opcion1() {
if [ -s "$archivo" ] && [ -f "$archivo" ]; then
	cat "$archivo"
elif [ -s "$archivo" ] && [  -d "$archivo" ]; then
	ls "$archivo"
elif [ ! -e "$archivo" ]; then
	echo "El archivo no existe... Creando uno"
	echo "1. Crear un nuevo directorio"
	echo "2. Crear fichero de texto"
	read option
	case $option in
		1)
			mkdir $archivo
			;;
		2)
			nano $archivo
			;;
		*)
			echo "Por favor, seleccione una opción válida"
			;;
	esac
fi

}
opcion2() {
	if [ ! -e $archivo ];then
		echo "El archivo no existe"
	elif [ -e $archivo ];then
		echo "cambiando permisos... Inserte nuevos permisos"
		read permiso
		sudo chmod "$permiso" "$archivo"
		echo "Los nuevos permisos son: $(stat -c %a "$archivo")"
	fi	
}

opcion3() {
	echo "Inserte el nuevo directorio donde quiere mover el archivo"
	read directorio
	if [ ! -e $directorio ]; then
		mkdir $directorio
		mv $archivo $directorio
	elif [ -d $directorio ]; then
		mv $archivo $directorio
	fi
}


while true; do
	menu
done
