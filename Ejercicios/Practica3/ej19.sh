#!/bin/bash
#Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menu, el
#cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados
#en esta práctica. Las instrucciones de como proceder deben mostrarse junto con el menú.
#El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir. Por ejemplo:
#MENU DE COMANDOS
#03. Ejercicio 3
#12. Evaluar Expresiones
#13. Probar estructuras de control
#...
#Ingrese la opción a ejecutar: 03

while true; do
    echo "MENU DE COMANDOS"
    echo "12. Evaluar Expresiones"
    echo "13. Probar estructuras de control"
    echo "14. Renombrar solo archivos de un directorio pasado como parametro, agregandole una CADENA"
    echo "16. Ejercicio 16"
    echo "17. Ejercicio 17"
    echo "18. Ejercicio 18"
    echo "0. Salir"

    read num
    
    case $num in
        12)
            ./ej12.sh
            ;;
        13)
            ./ej13.sh
            ;;
        14)
            ./ej14.sh
            ;;
        16)
            ./ej16.sh
            ;;
        17)
            ./ej17.sh
            ;;
        18)
            ./ej18.sh
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Opcion invalida"
            ;;
    esac
done