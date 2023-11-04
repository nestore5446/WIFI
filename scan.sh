#!/bin/bash

# Verifica si iwlist está instalado
if ! command -v iwlist &> /dev/null; then
    echo "iwlist no está instalado. Por favor, instálalo antes de usar este script."
    exit 1
fi

# Solicita al usuario que ingrese el nombre de la interfaz de red
read -p "Ingresa el nombre de la interfaz de red (por ejemplo, wlan0): " interface

# Ejecuta iwlist para mostrar las redes disponibles
iwlist $interface scan | grep "ESSID" | awk -F '"' '{print $2}'

echo "Escaneo de redes WiFi completado."
