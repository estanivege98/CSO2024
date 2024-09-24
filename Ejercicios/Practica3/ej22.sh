#!/bin/bash
#Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad
#de elementos del arreglo puede variar). Implemente la función productoria dentro de este
#script, cuya tarea sea multiplicar todos los números del arreglo

# Funcion que calcula la productoria de un arreglo
function productoria {
    # Se recorre el arreglo y se multiplica cada elemento
    local prod=1
    for elem in "${num[@]}"; do
        prod=$((prod * elem))
    done
    echo $prod
}

# Declaracion del arreglo
num=(10 3 5 7 9 3 5 4)

# Se llama a la funcion productoria
productoria

exit 0