#!/data/data/com.termux/files/usr/bin/bash

# Escanea las redes Wi-Fi cercanas y almacena los resultados en un archivo temporal
termux-wifi-scaninfo > /tmp/redes_wifi.txt

# Verifica si el archivo temporal está vacío
if [ -s /tmp/redes_wifi.txt ]; then
    # Muestra la lista de redes encontradas junto con números de selección
    echo "Redes Wi-Fi disponibles:"
    cat -n /tmp/redes_wifi.txt

    # Solicita al usuario que elija un número de red
    read -p "Elige el número de la red Wi-Fi a la que deseas conectar: " numero_red

    # Obtiene el nombre de la red seleccionada
    nombre_red_wifi=$(sed -n "${numero_red}p" /tmp/redes_wifi.txt | awk '{ print $1 }')

    # Nombre del archivo de contraseñas
    archivo_contraseña="passw.txt"

    # Verifica si el archivo de contraseñas existe
    if [ -f "$archivo_contraseña" ]; then
        # Lee la contraseña desde el archivo
        contraseña=$(cat "$archivo_contraseña")

        # Intenta conectarse a la red Wi-Fi seleccionada
        termux-wifi-connect "$nombre_red_wifi" "$contraseña"
    else
        echo "El archivo de contraseñas '$archivo_contraseña' no existe. Asegúrate de que el archivo esté en el mismo directorio que este script."
    fi
else
    echo "No se han encontrado redes Wi-Fi, Good hacking ;)"
    exit 1  # Sale del script con código de error
fi

# Limpia el archivo temporal
rm /tmp/redes_wifi.txt
