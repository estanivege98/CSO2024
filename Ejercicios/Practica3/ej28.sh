#!/bin/bash
#Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
#el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
#directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
#dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
#tampoco deberán ser tenidos en cuenta para la suma a informar.
#
if [ $# -ne 1 ]; then
	echo "ERROR: se debe introducir un directorio como parametro"
	exit 1
    if [ ! -d $directorio ]; then
        echo "ERROR: el directorio no existe"
        exit 4
    fi
fi
directorio=$1
cantArchivos=0

for archivo in $(ls $directorio); do
    if [ -f $archivo ]; then
        # Si el archivo es legible y escribible por el usuario
        # '-a' es un operador logico 'and'
        if [ -r $archivo -a -w $archivo ]; then
            cantArchivos=$((cantArchivos+1))
        fi
    fi 
done
echo "La cantidad de archivos en el directorio $directorio que son legibles y escribibles por el usuario es: $cantArchivos"
exit 0
