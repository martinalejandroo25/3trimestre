# !/bin/bash
# Se pasa un directorio como parámetro y debe comprimirlo con el formato fecha_nombre_directorio.tar.gz. La fecha debe estar en el formato dd-mm-yyyy

archivo=$1
echo "-------------------------"
echo "Compresor Automático"
fecha=$(date +"%d-%m-%y")
nombre=$(basename $archivo)
Comprimido=${fecha}_${nombre}.tar.gz

if [ -z $archivo ]; then
	echo "nombre de archivo no valido"
	exit 1
fi
if [ ! -e $archivo ]; then
	echo "El archivo especificado no existe"
	exit 1
fi
tar -czvf "$comprimido" "$archivo"

