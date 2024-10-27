#!/bin/bash

arreglo=()
for i in "/var/log"/*; do
    if [[ -f $i ]]; then
        if [[ "$i" =~ "access" ]]; then
            arreglo+=($i)
        fi
    fi
done
cantidad(){
    echo "Cantidad ${#arreglo[@]}"
}
listar(){
    for i in ${arreglo[@]}; do
        echo "$i"
    done
}
eliminar(){
    if [[ $1 -le ${#arreglo[@]}-1 ]]; then
        if [[ $2 == "logico" ]]; then
            unset arreglo[$1]
        elif [[ $2 == "fisico" ]]; then
            $(rm "${arreglo[$1]}")
            unset arreglo[$1]
        else
            echo "El parametro es incorrecto"
        fi
    else
        echo "El indice no es valido"
    fi
}

# Menu de opciones
while true; do
    echo "1. Cantidad de archivos"
    echo "2. Listar archivos"
    echo "3. Eliminar archivo"
    echo "4. Salir"
    read -p "Ingrese una opcion: " opcion
    case $opcion in
        1)
            cantidad
            ;;
        2)
            listar
            ;;
        3)
            read -p "Ingrese el indice del archivo a eliminar: " indice
            read -p "Ingrese el tipo de eliminacion (logico/fisico): " tipo
            eliminar $indice $tipo
            ;;
        4)
            break
            ;;
        *)
            echo "Opcion incorrecta"
            ;;
    esac
done
