#!/bin/bash

archivo=/var/log/any-service/error.log
if [[ $# -eq 0 ]]; then
    echo "ERROR: no se introdujo un parametro"
    echo "MODO DE USO: $0 [directorio donde guardar el archivo comprimido]" 
    exit 1
elif [[ ! -d $1 ]]; then
    echo "ERROR: el directorio $1 no existe"
    exit 1
fi
while true; do
    if [ -f $archivo ]; then
        if [ $(cat $archivo | grep -c "FATAL ERROR") -gt 0 ]; then
            $(tar -cvzf $1/user-service.tar.gz /var/log/usr-service)
            echo $(cat $archivo | grep "FATAL ERROR" | wc -l)
            exit 2
        fi
    fi
    sleep 180
done
