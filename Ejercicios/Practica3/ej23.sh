#!/bin/bash
#. Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla
#sólo los números pares y que cuente sólo los números impares y los informe en pantalla al
#finalizar el recorrido.

# Funcion que recorre un arreglo de numeros, imprime los pares y cuenta los impares
function recorrer {
    # Recorro el arreglo
    for elem in "${num[@]}"; do
        # Si el es par, lo imprimo
        if [ $((elem % 2)) -eq 0 ]; then
            echo "Numero par: $elem"
        else
            # Si es impar, incremento el contador
            ((impares++))
        fi
    done
    # Informo la cantidad de impares
    echo "Cantidad de numeros impares: $impares"
}

# Declaro un arreglo
num=(10 3 5 7 9 3 5 4)

# Inicializo el contador de impares
impares=0

# Llamo a la funcion recorrer
recorrer

exit 0