#!/bin/bash
#crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
#(el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
#el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

if [ $# -ne 1 ]
then
    echo "ERROR: no se introdujo un parametro"
    echo "MODO DE USO: $0 [nombre de usuario]"
    exit 1
else
    # Asignar el parametro a la variable user 
    user=$1

    # Compruebo si el usuario existe
    if [ $(cat /etc/passwd | grep -c "^$user:") -eq 0 ]
    then
        echo "ERROR: el usuario $user no existe"
        exit 1
    else
        # Itero cada 10 segundos
        while true
        do
            # Compruebo si el usuario se ha logueado
            while [ $(users | grep -c "^$user") -eq 1 ]
            do
                echo "Usuario $user logueado en el sistema"
                sleep 10
            done
            exit 0
        done
    fi
fi