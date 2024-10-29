#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Error, no se han pasado argumentos"
    exit 1
fi

cantidad=$#
archivos=("$@")
NoFile=0
for ((i=1; i<=cantidad; i+=2)); do
    archivo=${archivos[$i-1]}
    if [[ -d "$archivo" ]]; then
        echo "Es Directorio"
    elif [[ -f "$archivo" ]]; then
        echo "Es Archivo"
    else
        NoFile=$((NoFile+1))
    fi
done

echo "La cantidad de parametros que no son archivos ni directorios es: $NoFile"
exit 0