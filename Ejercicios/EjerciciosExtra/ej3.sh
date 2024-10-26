#!/bin/bash

if [ $# -ne 1 ]; then
	exit 1
fi

usuarios=()

# GUARDA LOS NOMBRES QUE CUMPLAN CON EL PATRON

for usu in $(cat /etc/passwd | cut -f1 -d:); do
	if [ $(echo $usu | grep -e $1 | wc -c) -gt 0 ]; then
		usuarios+=($usu)	
	fi
done

echo ${usuarios[@]}

# FUNCIONES
listar(){
	for usu in ${usuarios[@]}; do
		echo $usu
	done
}
eliminar(){
	count=0
	for usu in ${usuarios[@]}; do
		echo "USUARIO: $usu / INDICE: $count"
		count=$(expr $count + 1)
	done

	echo "INGRESE INDICE"

	read indice
	if ! [[ $indice -ge 0 && $indice -lt -1 ]];then
		echo "INGRESE UN INDICE VALIDO"
		return 1
	fi
	unset $usuarios[$indice]
}
contar() {
	echo ${usuarios[@]}
}

listar
eliminar
listar
exit 0
