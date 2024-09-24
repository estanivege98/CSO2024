#!/bin/bash
#Realice un script que simule el comportamiento de una estructura de PILA e implemente
#las siguientes funciones aplicables sobre una estructura global definida en el script:
#push: Recibe un parámetro y lo agrega en la pila 
#pop: Saca un elemento de la pila
#length: Devuelve la longitud de la pila 
#print: Imprime todos elementos de la pila

# Definir la pila
pila=()

# Funcion push
push() {
    local elem=$1
    pila+=("$elem")
}

# Funcion pop
pop() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "La pila esta vacia"
        return 1
    else
        local elem=${pila[-1]}
        unset pila[-1]
        echo "$elem"
    fi
}

# Funcion length
length() {
    echo ${#pila[@]}
}

# Funcion print
print() {
    for elem in "${pila[@]}"; do
        echo "$elem"
    done
}

# Menu de comandos
while true; do
    echo "MENU DE COMANDOS"
    echo "1. push"
    echo "2. pop"
    echo "3. length"
    echo "4. print"
    echo "0. Salir"

    read num

    case $num in
        1)
            echo "Ingrese el elemento a agregar"
            read elem
            push "$elem"
            ;;
        2)
            pop
            ;;
        3)
            length
            ;;
        4)
            print
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Opcion invalida"
            ;;
    esac
done