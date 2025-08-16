#!/bin/bash
#Realiza un script llamado menuFicheros.sh que reciba como argumento la ruta de un fichero o directorio. 
#El script, a través de un menú, realizará las siguientes operaciones sobre el argumento recibido:
#	Si el argumento es un fichero:
#		a) Mostrar el tamaño del fichero.
#		b) Mostrar información sobre el fichero (nombre, permisos que tiene, propietario)
#	Si el argumento es un directorio:
#		a) Contar y listar los ficheros que hay en el directorio.
#		b) Listar los enlaces simbólicos del directorio.
#		c) Obtener los archivos que coincidan con un nombre solicitado al usuario
#		d) Listar todos los archivos con extensión .txt.
#		e) Generar un backup .tar.gz del directorio en el Escritorio del usuario.

E_WRONG_ARGS=84
E_WRONG_N_ARGS=85
E_NOFILE=66
E_NODIR=67
spected_args=1
extension=".txt"
#echo La cantidad de parametros es $#;

if [ $# -ne $spected_args ]; then
        echo "Metodo de uso: `basename $0` /ruta/del/directorio/archivo"
	exit $E_WRONG_N_ARGS
else
        echo "La cantidad de argumentos es:" "$spected_args"
fi

if [ -f "$1" ]
then
	echo "Nombre del archivo: $1"
	echo -n "Permisos del archivo: "
	ls -l "$1" | awk '{print $1}'
	echo -n "Propietario del archivo: "
	ls -l "$1" | awk '{print $3}'
	echo -n "Tamaño del archivo: "
	du -h "$1" | awk '{print $1}'

elif [ -d "$1" ]
then
	echo -n "Cantidad de archivos en el directorio: "
	find "$1" -maxdepth 1 -type f | wc -l
	echo -n "Cantidad de enlaces simbolicos en el directorio: "
	find "$1" -maxdepth 1 -type l | wc -l
	echo "Ingrese nombre de archivo que quiere buscar: "
	read filename	
	find "$1" -maxdepth 1 -type f -name "*$filename*" -printf "%f\n"
	find "$1" -maxdepth 1 -type f -name "*$extension" -printf "%f\n"
	base_name=$(basename "$1")
	dir_name=$(dirname "$1")
	tar -czf "$HOME/$base_name.tar.gz" -C "$dir_name" "$base_name"
else
	#CATCH ALL. MEJORAR ESTA SECCION Y DECIRLE POR QUE LLEGO ACA, HACER UN TEST DE EXISTENCIA.
	echo "Argumento no valido"
        echo "Metodo de uso: `basename $0` /ruta/del/directorio/archivo"
	exit $E_WRONG_ARGS
fi
