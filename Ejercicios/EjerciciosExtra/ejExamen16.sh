#!/bin/bash
#Ejercicio 16 del parcial

nomUsers=$(cat /etc/passwd | cut -d : -f1)

existe(){
	for usu in ${nomUsers[@]}; do
		if [[ "$1" == "$usu" ]]; then
			return 0
		else
			return 1
		fi
	done
}

eliminar_usuario(){
	for usu in ${numUsers[@]}; do
		if [[ "$1" == "$usu" ]]; then
			$((userdel $1))
			return 0
		else
			return 2
		fi
	done
}

usuarios_con_patron(){
	local cant=0
	for usu in ${nomUsers[@]}; do
		if [[ $(cat ${nomUsers[$usu]} | grep "$1" | wc -l) -gt 0 ]]; then
			echo "${nomUsers[$usu]}"
			$cant=(expr cant+1)
		fi
	done
	if [[ $cant -gt 1 ]]; then
		return 0
	else
		return 102
	fi
}

cantidad(){
	cant=${#nomUsers[@]}
	if [[ $cant -gt 1 ]]; then
		echo "La cantidad de usuarios es $cant"
		return 0
	else
		return 95
	fi
}

usuarios(){
	local cant=0
	for i in ${nomUsers[@]}; do
		echo "${nomUsers[$i]}"
		$cant=(expr cant+1)
	done
	if [[ $cant -eq 0 ]]; then
		return 95
	fi
	return 0
}

# Menu de opciones
#

