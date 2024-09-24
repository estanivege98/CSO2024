#!/bin/bash
#escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se
#encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de
#eliminar la letra a (mayúscula o minúscula).

vectorNombre=$(ls -l | cut -d ' ' -f1)

for nom in vectorNombre 
do
	echo $nom | tr -d 'a' | tr -d 'A' | tr [:upper:][:lower:] [:lower:][:upper:]
done
