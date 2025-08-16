#!/bin/bash
#Genere un script que permita al usuario ingresar dos cadenas de
#caracteres y muestra la concatenación de las mismas. Antes de finalizar deberá informar la
#cantidad de caracteres de la cadena resultante.


echo Ingrese la primera cadena
read string1
echo Ingrese la segunda cadena
read string2
echo $string1$string2

echo -n "La cantidad de caracteres de las dos cadenas es: "
echo $string1$string2 | wc -c
