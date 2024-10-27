#!/bin/bash

arreglo=()
insertElemento(){
    if [[ $# -ne 1 ]]; then
        echo "Se debe recibir un parametro"
        return 1
    fi
    arreglo+=($1)
    return 0
}
rellenar(){
    if [[ $# -ne 1 ]]; then
        echo "Se debe recibir un parametro"
        return 1
    fi
    for ((i=1; i<=$1; i++)); do
        read -p "Ingrese un patron: " patron  
        arreglo+=($patron)
    done
    return 0
}

seleccionar(){
    if [[ $# -eq 0 ]]; then
        echo "Se debe recibir un parametro"
        return 1
    fi
    if [[ "$1" == "!" ]]; then
        for i in "${arreglo[@]}"; do
            echo "$i"
        done
        return 0
    else
        for i in "${arreglo[@]}"; do
            if [[ "$i" == "$1" ]]; then
                echo "$i"
                return 0
            fi
        done
        echo "Elemento no encontrado" 
    fi  
}
eliminar(){
    if [[ $# -ne 1 ]]; then
        echo "Se debe recibir un parametro"
        return 1
    fi
    if [[ "$1" == "!" ]]; then
        arreglo=()
        return 0
    else
        for i in "${!arreglo[@]}"; do
            if [[ "${arreglo[$i]}" == "$1" ]]; then
                unset arreglo[$i]
                return 0
            fi
        done
        echo "Elemento no encontrado"
    fi
}

# Menu de opciones
while true; do
    echo "1. Insertar elemento"
    echo "2. Rellenar arreglo"
    echo "3. Seleccionar elemento"
    echo "4. Eliminar elemento"
    echo "5. Salir"
    read -p "Ingrese una opcion: " opcion
    case $opcion in
        1)
            read -p "Ingrese el elemento a insertar: " elemento
            insertElemento $elemento
            ;;
        2)
            read -p "Ingrese la cantidad de veces a iterar: " cantidad
            rellenar $cantidad
            ;;
        3)
            read -p "Ingrese el elemento a seleccionar: " elemento
            seleccionar $elemento
            ;;
        4)
            read -p "Ingrese el elemento a eliminar: " elemento
            eliminar $elemento
            ;;
        5)
            break
            ;;
        *)
            echo "Opcion incorrecta"
            ;;
    esac
    echo ""
done
exit 0