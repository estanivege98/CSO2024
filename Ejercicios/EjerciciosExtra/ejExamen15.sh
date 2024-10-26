#!/bin/bash
#Parcial primera fecha 

if [ $# -lt 1 ]; then
	echo "ERROR: Debe al menos recibir un parametro"
	exit 1
fi

archVec=($*)
cantNoFile=0
for i in ${archVec[@]}; do
	if [[ -f $i ]]; then
		$(tar -c $i $i)
	elif [[ -d $i ]]; then
		if [[ -r $i ]]; then
			$(tar -cvzf $i.tar.gz $i)
			echo "LEIBLE"
		elif [[ -w $i ]]; then
			$(sudo rm -r $i/)
			echo "ESCRIBIBLE"
		fi
	else
		cantNoFile=$((cantNoFile + 1))
	fi
done
echo "La cantidad de parametros que no pertenecen al filesystem son $cantNoFile"
exit 0
