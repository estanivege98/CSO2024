#!/bin/bash
arreglo=$(cat /etc/passwd | cut -d: -f6)
if [ {#arreglo[@]} == 0 ]; then
    echo "Error. No hay directorios."
    exit 1
fi
echo "${arreglo[@]}"
