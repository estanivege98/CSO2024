#!/bin/bash
#Realice un script que implemente a través de la utilización de funciones las operaciones
#básicas sobre arreglos:
#inicializar: Crea un arreglo llamado array vacío
#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la
#posición recibida como parámetro. Debe validar que se reciba una posición válida
#longitud: Imprime la longitud del arreglo en pantalla
#imprimir: Imprime todos los elementos del arreglo en pantalla
#inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud
#<parametro1>y en todas las posiciones asigna el valor <parametro2>

# Funciones
function inicializar() {
    array=()
}
function agregar_elem(){
    echo "Introduzca elemento a añadir"
    read elem
    array+=($elem)
}
function eliminar_elem(){
    echo "Introducir elemento a eliminar"
    read elem
    if [ $elem -lt ${#array[@]} ]; then
        unset array[elem]
    else
        echo "No existe elemento en el vector"
    fi
}
function longitud(){
    echo "Longitud del vector: ${#array[@]}"
}
function imprimir(){
    echo "Elementos del vector: ${array[@]}"
}
function inicializarConValores(){
    echo "Introduzca longitud del vector"
    read long
    echo "Introduzca valor a asignar"
    read valor
    for ((i=0; i<long; i++)); do
        array+=($valor)
    done
}
# Menu de opciones
while true; do
echo "MENU DE OPCIONES: "
echo "1. Inicializar"
echo "2. Agregar Elemento <parametro1>"
echo "3. Eliminar Elemento <paramtro1>"
echo "4. Longitud"
echo "5. Imprimir"
echo "6. Inicializar con Valores <parametro1> <parametro2>"
echo "0. Salir"

    read -p "Introduzca una opcion: " opcion
    case $opcion in
        1) inicializar
        ;;
        2) agregar_elem
        ;;
        3) eliminar_elem
        ;;
        4) longitud
        ;;
        5) imprimir
        ;;
        6) inicializarConValores
        ;;
        0) exit 0
        ;;
        *) echo "Opcion Invalida"
        ;;
    esac
done