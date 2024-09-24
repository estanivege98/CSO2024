#!/bin/bash
# Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
#pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
#
#“-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso contrario, un mensaje de error.
# “-l”: Devuelve la longitud del arreglo
# “-i”: Imprime todos los elementos del arreglo en pantalla

# Declaracion el arreglo
userVec=$(cat /etc/group | grep -e users | cut -d ':' -f4 | tr ',' ' ')

# Si se paso un parametro
if [ $# -eq 1 ]; then
    echo "se paso un parametro"
    par1=$1
# Si se pasaron dos parametros
elif [ $# -eq 2 ]; then
    echo "se pasaron dos parametros"
    par1=$1
    par2=$2
else
    echo "ERROR: Cantidad de parametros incorrecta"
    echo "MODO DE USO: $0 [-b n] | [-l] | [-i]"
    exit 1
fi

# Si se paso el parametro -b n
if [ $par1 == "-b" ]; then
    if [ $par2 -lt ${#userVec[@]} ]; then
        echo ${userVec[$par2]}
    else
        echo "ERROR: No existe el elemento en la posicion $par2"
        exit 1
    fi
# Si se paso el parametro -l
elif [ $par1 == "-l" ]; then
    echo ${#userVec[@]}
# Si se paso el parametro -i
else
    for elem in "${userVec[@]}"; do
        echo "$elem"
    done
fi

exit 0