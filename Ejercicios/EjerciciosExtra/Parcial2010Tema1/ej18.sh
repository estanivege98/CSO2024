#!/bin/bash

inicializar(){
    arreglo=()
}
agregar_elem(){
    arreglo+=($1)
}
eliminar_elem(){
    local elemento=$1
    for i in "${arreglo[@]}"; do
        if [ "${arreglo[$i]}" -eq $elemento]; then
            unset arreglo[$i]
        fi
    done
}
longitud(){
    echo ${#arreglo[@]}
}
imprimir(){
    for i in "${arreglo[@]}"; do
        echo $i
    done
}
inicializarConValores(){
    longitud=$1
    valorAsignar=$2
    arreglo=()
    for ((i=0; i<longitud; i++)); do
        arreglo+=("$valorAsignar")
    done
}