#!/bin/bash

mostrarContenido(){
 read -p "Proporciona la ruta especifica:" ruta
 if [ -d "$ruta" ]; then
    echo "Contenido del directorio $ruta:"
    # Iterar sobre los elementos del directorio y mostrarlos con un número
    i=1
    for elemento in "$ruta"/*; do
        echo "$i) $(basename "$elemento")"
        ((i++))
    done
 else
    echo "La ruta proporcionada no es un directorio válido."
 fi
}
crearArchivo() {
    read -p "Introduce el nombre del archivo (incluye .txt): " nombre_archivo
    read -p "Introduce la cadena de texto a almacenar: " texto

    # Crear el archivo y escribir la cadena de texto en él
    echo "$texto" > "$nombre_archivo"

    echo "El archivo '$nombre_archivo' ha sido creado con el siguiente contenido:"
    cat "$nombre_archivo"
}

compararArchivos() {
    # Solicitar al usuario los dos archivos a comparar
    read -p "Introduce la ruta del primer archivo: " archivo1
    read -p "Introduce la ruta del segundo archivo: " archivo2

    # Comprobar si los archivos existen
    if [[ ! -f "$archivo1" ]]; then
        echo "El archivo '$archivo1' no existe."
    fi

    if [[ ! -f "$archivo2" ]]; then
        echo "El archivo '$archivo2' no existe."
    fi

    # Comparar los archivos utilizando diff
    echo "Comparando '$archivo1' y '$archivo2'..."
    diff_output=$(diff "$archivo1" "$archivo2")

    # Comprobar si diff encontró diferencias
    if [[ -z "$diff_output" ]]; then
        echo "Los archivos son idénticos."
    else
        echo "Los archivos son diferentes. Aquí están las diferencias:"
        echo "$diff_output"
    fi
}
usoAwk() {
    echo "Uso de 'awk':"
    echo "Awk es un poderoso lenguaje de programación para el procesamiento de texto."
    echo "Ejemplo: Para imprimir la primera columna de un archivo llamado 'datos.txt':"
    echo "    awk '{print \$1}' datos.txt"
}

# Función para mostrar el uso de grep
usoGrep() {
    echo "Uso de 'grep':"
    echo "Grep es una herramienta de búsqueda de texto en archivos."
    echo "Ejemplo: Para buscar la palabra 'error' en un archivo llamado 'log.txt':"
    echo "    grep 'error' log.txt"
}
#Menu
while true; do
	echo -e "\n---Servicios---"
	echo "1. Listar contenido de un fichero(carpeta)"
	echo "2. Crear archivo de texto"
	echo "3. Comparar archivos"
	echo "4. Mostrar uso del comando awk"
	echo "5. Mostrar uso del comando grep"
	echo "6. Salir"

	read -p "Capture la opción deseada:" opcion
	
	case $opcion in
		1)
			mostrarContenido
			;;

		2) 
			crearArchivo
			;;
			
		3)
			compararArchivos
			;;
			
		4)
			usoAwk
			;;
			
		5)
			usoGrep
			;;
		6)
			echo "Saliendo..."
			exit 0
			;;

		*)
			echo "Opcion no válida. Intente de nuevo."
			;;

	esac
done
