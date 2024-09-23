#!/bin/bash
#Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
#columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se
#debe guardar el resultado en un archivo llamado reporte.txt

if [ $# -ne 2 ]
then
    echo "ERROR: no se introdujo un paramtero"
    echo "MODO DE USO: $0 [extension]"
else
    for i in $(ls)
    do
        $(cut 
