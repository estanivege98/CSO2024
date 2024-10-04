#!/bin/bash
#Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
#terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
#acceder a la estructura creada:

#verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
#encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 5

#cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc

# borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
#usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
#validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 10

vecArch=($(ls /home | grep -e ".doc"))

# Funciones
function verArchivo(){
    echo "Introduzca nombre de archivo"
    read archivo
    for i in ${vecArch[@]}; do
        if [ $i == $archivo ]; then
            cat $archivo
            return 0
        fi
    done
    echo "Archivo no encontrado"
}

function cantidadArchivos(){
    echo "Cantidad de archivos .doc en /home: ${#veArch[@]}"
}

function borrarArchivo(){
    echo "Introduzca nombre de archivo"
    read archivo
    for i in ${vecArch[@]}; do
        if [ $i == $archivo ]; then
            read -p "¿Desea eliminar el archivo lógicamente? (Si/No): " respuesta
            if [ $respuesta == "Si" ]; then
                unset vecArch[$archivo]
            elif [ $respuesta == "No" ]; then
                rm $archivo
                unset vecArch[$archivo]
            else
                echo "Respuesta invalida"
            fi
            return 0
        fi
    done
    echo "Archivo no encontrado"
    return 10
}

# Menu de opciones
while true; do
    echo "MENU DE OPCIONES: "
    echo "1. Ver Archivo"
    echo "2. Cantidad de Archivos"
    echo "3. Borrar Archivo"
    echo "0. Salir"
    read -p "Introduzca una opcion: " opcion
    case $opcion in
        1) verArchivo
        ;;
        2) cantidadArchivos
        ;;
        3) borrarArchivo
        ;;
        0) exit 0
        ;;
        *) echo "Opcion invalida"
        ;;
    esac
done
exit 0
