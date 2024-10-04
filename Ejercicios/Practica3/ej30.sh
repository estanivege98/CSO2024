#!/bin/bash
#Realice un script que mueva todos los programas del directorio actual (archivos ejecutables)
#hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script
#debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o
#que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado.

# Crear directorio bin si no existe
mkdir -p ~/bin

archMovidos=0
# Mover archivos ejecutables a ~/bin
for i in $(ls); do
    if [ -x $i ]; then
        mv $i ~/bin
        echo "Archivo $i movido a ~/bin"
        archMovidos=$((archMovidos+1))
    fi
done

if [ $archMovidos -eq 0 ]; then
    echo "No se movió ningún archivo"
else
    echo "Se movieron $archMovidos archivos"
fi

exit 0