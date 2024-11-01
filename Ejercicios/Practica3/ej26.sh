#!/bin/bash
#Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta
#de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos, y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, el q
#verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo
#de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o
#directorios inexistentes en el sistema.

# Validar que se reciba al menos un parámetro
if [ $# -eq 0 ]; then
    echo "ERROR: Debe ingresar al menos un parámetro"
    echo "MODO DE USO: $0 [ruta1] [ruta2] ... [rutaN]"
    exit 1
fi

# Contadores
cant_inexistentes=0

params=("$@")
# Iterar por todos los parámetros recibidos
for ((i=0; i < ${#params[@]}; i++)); do
    if (( i % 2 == 1)); then
        # Verificar si el archivo o directorio existe
        if [ -e ${params[$i]} ]; then
            # Verificar si es un archivo
            if [ -f ${params[$i]} ]; then
                echo "El archivo $i existe"
            # Verificar si es un directorio
            elif [ -d ${params[$i]} ]; then
                echo "El directorio $i existe"
            fi
        else
            echo "El archivo o directorio $i no existe"
            ((cant_inexistentes++))
        fi
    fi
done
# Informo la cantidad de archivos inexistentes
echo "Cantidad de archivos inexistentes: $cant_inexistentes"
exit 0