#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Error: debe introducir un parametro"
else
	if [ -e $1 ]; then
	
		if [ -d $1 ]; then
			echo "La ruta $1 es un directorio"
		elif [ -f $1 ]; then
			echo "La ruta $1 es un fichero"
		fi
	else
		echo "La ruta $1 no existe. Creando Direcotrio..."
		mkdir $1
		echo "Directorio $1 creado"
	fi
fi
