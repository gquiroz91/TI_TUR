#!/bin/bash
#Genere un script que reciba un número variable de parámetros y luego:
#a) Indique la cantidad de argumentos recibidos.
#b) Si se han recibido 2 o más argumentos, se debe mostrar el que corresponde a la
#segunda posición. En caso contrario indicar al usuario.
#c) Imprimir la totalidad de los argumentos recibidos.

E_WRONG_ARGS=85
spected_params=2
echo La cantidad de parametros es $#;

if [ $# -ge $spected_params ]; then
	echo "El segundo parametro es:" $2
else
	echo "La cantidad de parametros es menor que:" $spected_params
fi
