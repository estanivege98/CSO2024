#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: número de argumentos incorrecto"
    exit 1
fi
if [ $(cat /etc/passwd | grep -e $1 | wc -l) -eq 0 ]; then
    echo "Error: usuario no encontrado"
    exit 1
fi

cantVeces=0
user=$1
touch "access$user.log"
while [ $cantVeces -lt 30 ]; do
    sleep 1
    
    if [ $(users | grep -e $user | wc -l) -eq 1 ]; then
        cantVeces=$((cantVeces+1))
        echo "$user $(date)" >> "access$user.log"
    else
        echo "El usuario salio antes de las 30 veces"
    fi
    
done
exit 0

