#!/bin/bash
#Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
#columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se
#debe guardar el resultado en un archivo llamado reporte.txt

if [ $# -ne 1 ]
then
    echo "ERROR: no se introdujo un paramtero"
    echo "MODO DE USO: $0 [extension]"
    exit 1
else
	# Asignar el parametro a la variable extension
	ext=$1

	# Archivo donde se guarda el reporte
	output="reporte.txt"

	# Creo el archivo
	> "$output"
	
	# Itero sobre los directrorios de los usuarios en /home/
	for userdir in /home/*; do
		if [ -d "$userdir" ]; 
		then
			# Obtengo el nombre del usuario a partir del directorio
			user=$(basename "$userdir")

			# Cuento los archivos con la extencion proporcionada
			count=$(find "$userdir" -type f -name "*.$ext" | wc -l)

			# Escribo el resultado en el archivo
			#
			echo "$user $count" >> "$output"
		fi
	done
fi
echo "Reporte generado en $output"
