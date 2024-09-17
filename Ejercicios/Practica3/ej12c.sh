#!/bin/bash
#este script le solicita al usuario 2 numeros y una operacion para imprimir en pantalla
#
#solicito los numeros
if [ $# -ne 3 ]
then
        echo "Introduce una operacion y dos numeros (en la misma linea)"
        read op num1 num2
else
	op=$1
        num1=$2
        num2=$3
fi

#case
case "$op" in
	"+")
		echo $(($num1+$num2))
	;;
"-")
	echo $(($num1-$num2))
	;;
"*")
	echo $(($num1*$num2))
	;;
"%")
	echo $((($num2*100) / $num1))
	;;
esac
echo "Fin del programa"
