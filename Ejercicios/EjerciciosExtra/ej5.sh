#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Error: faltan argumentos"
	exit 1
fi


ips_guardadas=()

for ipe in $*; do
	ips_guardadas+=($ipe)
done
for ipe in ${ips_pasadas[@]}; do
	contador=0
	for log in $(ls -h ./logs); do
		# LEO ARCHIVO Y SEPARO POR ESPACIOS
		archivo=$(cat ./logs/$log)
		ip=$(echo $archivo | cut -f1 -d' ')
		fecha=$(echo $archivo | cut -f3 -d' ')

		if [[ $ip == $ipe && $fecha == $1 ]]; then
			contador=$(expr $contator + 1)
		fi
	done
	echo "$ipe , Cantidad $contador"
done
