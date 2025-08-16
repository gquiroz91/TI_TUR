#!/bin/bash
#Genere un script que reciba como parámetro una dirección IP. El mismo
#debe hacer ping a la dirección recibida e informar al usuario si el resultado fue exitoso o
#no.


E_WRONG_ARGS=85
spected_args=1
echo $#
if [ $# -ne $spected_args ]
then
	echo "Falta la dirección IP como argumento"
	exit $E_WRONG_ARGS
else
	ping -q -c 1 $1 > /dev/null 2>&1
	if [ $? -eq 0 ]
	then
		echo "El resultado fue exitoso" $?
	else
		echo "El Ping fallo" $?
	fi
fi
