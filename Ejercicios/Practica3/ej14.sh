#!/bin/bash
# Este script renombra solo archivos de un directorio pasado como parametro, agregandole una CADENA
# Las opciones son:
#
# “-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del archivo
# “-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre del archivo

if [ $# -ne 3] 
then
    echo "ERROR: Debe introducir 3 parametros"
    echo "Uso: $0 [ruta] [-a|-b] [CADENA]"
else
    if [ -d $1 ]
    then
        if [ $2 = "-a" ]
        then
            for i in $(ls $1)
            do
                mv $1/$i $1/$i$3
            done
        elif [ $2 = "-b" ]
        then
            for i in $(ls $1)
            do
                mv $1/$i $1/$3$i
            done
        else
            echo "ERROR: La segunda opcion debe ser -a o -b"
        fi
    else
        echo "ERROR: La ruta $1 no existe"
    fi
fi