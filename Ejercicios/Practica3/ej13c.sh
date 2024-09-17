#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Error: debe introducir un parametro"
else
	test -e $1  && echo "La ruta $1 existe"
	test -d $1 && echo "La ruta $1 es un directorio" $-o mkdir $1
	test -f $1 && echo "La ruta $1 es un fichero" $-o touch $1
fi
