#!/bin/bash
#Practico 1 Ejercicio 1
echo "##### Fecha y Hora #####" >> sys_info.txt
date >> sys_info.txt
echo "##### ID #####" >> sys_info.txt
id >> sys_info.txt
echo " ##### Sistema Operativo #####" >> sys_info.txt
uname >> sys_info.txt
echo "##### Epacio en el disco #####" >> sys_info.txt
df -h >> sys_info.txt
exit
Test line
