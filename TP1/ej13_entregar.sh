#!/bin/bash

E_WRONG_ARGS=84
E_WRONG_N_ARGS=85
E_NOFILE=66
E_NODIR=67
spected_args=1
extension=".txt"


if [ $# -ne $spected_args ]; then
        echo "Metodo de uso: `basename $0` /ruta/del/directorio/archivo"
        exit $E_WRONG_N_ARGS
fi


if [ -f "$1" ]
then

	while true; do
		echo "========= MENÚ FICHEROS ========="
 		echo "1) Mostrar el tamaño del fichero"
		echo "2) Mostrar informacion sibre el fichero"
		echo "3) Salir"
    		echo "========================"
    		read -p "Elige una opción [1-3]: " opcion

    		case $opcion in
        	1)
            		echo -n "Tamaño del archivo: "
        		du -h "$1" | awk '{print $1}'
            		;;
        	2)
        		echo "Nombre del archivo: $1"
        		echo -n "Permisos del archivo: "
        		ls -l "$1" | awk '{print $1}'
        		echo -n "Propietario del archivo: "
        		ls -l "$1" | awk '{print $3}'
            		;;
        	3)
            		echo "Saliendo del script..."
            		break
            		;;
        	*)
            		echo "⚠️ Opción no válida, intenta de nuevo."
            		;;
	    	esac
    		echo ""  # Línea en blanco para mejor visualización
	done
elif [ -d "$1" ]
then	
	while true; do
		echo "========= MENÚ DIRECTORIO ========="
 		echo "1) Contar y Listar los ficheros del directorio"
		echo "2) Listar los enlaces simbolicos"
		echo "3) Buscar archivo en el directorio"
		echo "4) Listar archivos con extension .txt"
		echo "5) Generar un backuck del directorio al home"
		echo "6) Salir"
    		echo "========================"
    		read -p "Elige una opción [1-6]: " opcion

    		case $opcion in
        	1)
            		echo -n "Cantidad de archivos en el directorio: "
        		find "$1" -maxdepth 1 -type f | wc -l
        		find "$1" -maxdepth 1 -type f -printf "%f\n"
            		;;
        	2)
			echo -n "Cantidad de enlaces simbolicos en el directorio: "
        		find "$1" -maxdepth 1 -type l | wc -l
            		;;

		3)
			echo "Ingrese nombre de archivo que quiere buscar: "
        		read filename
        		find "$1" -maxdepth 1 -type f -name "*$filename*" -printf "%f\n"
			;;
		4)
        		find "$1" -maxdepth 1 -type f -name "*$extension" -printf "%f\n"
			;;
		5)        
			base_name=$(basename "$1")
       	 		dir_name=$(dirname "$1")
        		tar -czf "$HOME/$base_name.tar.gz" -C "$dir_name" "$base_name"
			;;	
        	6)
            		echo "Saliendo del script..."
            		break
            		;;
        	*)
            		echo "⚠️ Opción no válida, intenta de nuevo."
            		;;
	    	esac
    		echo ""  # Línea en blanco para mejor visualización
	done

        base_name=$(basename "$1")
        dir_name=$(dirname "$1")
        tar -czf "$HOME/$base_name.tar.gz" -C "$dir_name" "$base_name"
else
        #CATCH ALL. MEJORAR ESTA SECCION Y DECIRLE POR QUE LLEGO ACA, HACER UN TEST DE EXISTENCIA.
        echo "Argumento no valido"
        echo "Metodo de uso: `basename $0` /ruta/del/directorio/archivo"
        exit $E_WRONG_ARGS
fi







