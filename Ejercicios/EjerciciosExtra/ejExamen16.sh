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
while true; do
	echo "1. Verificar si un usuario existe"
	echo "2. Eliminar un usuario"
	echo "3. Listar los usuarios que contienen un patrón"
	echo "4. Cantidad de usuarios"
	echo "5. Listar todos los usuarios"
	echo "6. Salir"
	echo "Ingrese una opción: "
	read opcion
	case $opcion in
		1) echo "Ingrese el nombre de usuario: "
			read usuario
			existe $usuario
			if [[ $? -eq 0 ]]; then
				echo "El usuario $usuario existe"
			else
				echo "El usuario $usuario no existe"
			fi
		;;
		2) echo "Ingrese el nombre de usuario: "
			read usuario
			eliminar_usuario $usuario
			if [[ $? -eq 0 ]]; then
				echo "El usuario $usuario ha sido eliminado"
			else
				echo "El usuario $usuario no existe"
			fi
		;;
		3) echo "Ingrese el patrón: "
			read patron
			usuarios_con_patron $patron
			if [[ $? -eq 0 ]]; then
				echo "Usuarios que contienen el patrón $patron: "
			else
				echo "No se encontraron usuarios con el patrón $patron"
			fi
		;;
		4) cantidad
			if [[ $? -eq 0 ]]; then
				echo "Cantidad de usuarios: "
			else
				echo "No se encontraron usuarios"
			fi
		;;
		5) usuarios
			if [[ $? -eq 0 ]]; then
				echo "Usuarios: "
			else
				echo "No se encontraron usuarios"
			fi
		;;
		6) break
		;;
		*) echo "Opción inválida"
		;;
	esac

