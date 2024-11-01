#!/bin/bash

inicializar(){
    arreglo=()
}

agregar_elem(){
    arreglo+=($1)
}
eliminar_elem(){
    local elemento=$1
    local elimino=false
    local indice=0
    for elemArray in "${arreglo[@]}"; do
        if [[ $elemArray == $elemento ]]; then
            unset arreglo[$indice]
            arreglo=("${arreglo[@]}")
            elimino=true
        fi
        ((indice++))
    done
    if [[ $elimino == false ]]; then
        echo "El elemento no existe en el arreglo"
    fi
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
# Menu de opciones
while true; do
    echo "1. Inicializar arreglo"
    echo "2. Agregar elemento"
    echo "3. Eliminar elemento"
    echo "4. Longitud del arreglo"
    echo "5. Imprimir arreglo"
    echo "6. Inicializar arreglo con valores"
    echo "7. Salir"
    read -p "Ingrese una opcion: " opcion
    case $opcion in
        1)
            inicializar
            ;;
        2)
            read -p "Ingrese el elemento a agregar: " elemento
            agregar_elem $elemento
            ;;
        3)
            read -p "Ingrese el elemento a eliminar: " elemento
            eliminar_elem $elemento
            ;;
        4)
            longitud
            ;;
        5)
            imprimir
            ;;
        6)
            read -p "Ingrese la longitud del arreglo: " longitud
            read -p "Ingrese el valor a asignar: " valor
            inicializarConValores $longitud $valor
            ;;
        7)
            break
            ;;
        *)
            echo "Opcion incorrecta"
            ;;
    esac
done