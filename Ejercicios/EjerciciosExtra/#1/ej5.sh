#!/bin/bash
if [[ $# -eq 0 ]]; then
    echo "Se debe recibir al menos un parametro"
    exit 1
fi

parametros=("$@")
cantNoFile=0
for i in "${parametros[@]}"; do
    if [[ -f $i ]]; then
        tar -cvzf $i.tar.gz $i
    elif [[ -d $i ]]; then
        if [[ -r $i ]]; then
            tar -cvzf $i.tar.gz $i
        elif [[ -w $i ]]; then
            rm -r $i
        fi
    else
        cantNoFile=$((cantNoFile +1))
    fi
done
echo "La cantidad de parametros que no pertenecen al filesystem son $cantNoFile"
