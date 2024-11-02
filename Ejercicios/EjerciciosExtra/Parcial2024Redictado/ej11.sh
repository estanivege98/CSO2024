#!/bin/bash
if [ $# -lt 3 ]; then
    if [ ! -d $1 ]; then
        echo "Error. El directorio $1 no existe."
        exit 1
    elif [ ! -d $3 ]; then
        echo "Error. El directorio $3 no existe."
        exit 1
    else
        echo "Error. Debe ingresar al menos un argumento."
        exit 1
    fi
fi

arregloArchivo=()
for arch in "$1"/*; do
    if [ -f $arch ]; then
        arregloArchivo=("${arregloArchivo[@]}" "$arch")
    fi
done

agregar(){
    #echo "$1"/*
    for arch in "$1"/*; do
        if [ -f $arch ]; then
            arregloArchivo=("${arregloArchivo[@]}" "$arch")
        fi
    done
    echo "${arregloArchivo[@]}"
    return 0
}

eliminar(){
    local indice=0
    for arch in "${arregloArchivo[@]}"; do
        if [ $(echo $arch | grep -e $1 | wc -l ) -gt 0 ]; then
            unset arregloArchivo[$indice]
            arregloArchivo=("${arregloArchivo[@]}")
        fi
        if [ $4 == "-f" ]; then
            rm $arch
        fi
        ((indice++))
    done
}

case $2 in
    -a)
        agregar "$3"
        ;;
    -d)
        eliminar "$3"
        ;;
    -f)
        eliminar "$3" "$4"
        ;;
    *)
        echo "Error. Opcion invalida."
        exit 1
        ;;
    esac