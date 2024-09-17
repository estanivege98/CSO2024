#!/bin/bash
#este script le solicita al usuario 2 numeros, para luego imprimir la suma, la multiplicacin
#la resta y cual es el mayor de los numeros
#
#solicito los numeros
if [ $# -ne 2 ] 
then
	echo "Introduce dos numeros (en la misma linea)"
	read num1 num2
else
	num1=$1
	num2=$2
fi
#Cual es el mayor
if [ $num1 -lt $num2 ]
then	
	echo "El $num1 es el numero mas grande"
else
	echo "El $num2 es el numero mas grande"
fi

#Suma
echo "Suma: $(($num1+$num2))"
#Resta
echo "Resta: $(($num1-$num2))"
#Multiplicacion
echo "Multiplicacion: $(($num1*$num2))"
echo "Fin del programa"
