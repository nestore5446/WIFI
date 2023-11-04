import subprocess

# Intenta escanear con la interfaz wlan0
interface = "wlan0"
result = subprocess.run(["iwlist", interface, "scanning"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)

# Si wlan0 no está disponible, intenta con eth0
if result.returncode != 0:
    interface = "eth0"
    result = subprocess.run(["iwlist", interface, "scanning"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)

# Imprime la información de las redes encontradas
output_lines = result.stdout.split('\n')
for line in output_lines:
    if "ESSID" in line or "Address" in line or "Signal level" in line:
        print(line.strip())

# Imprime "Todo O.K." si el escaneo fue exitoso
if result.returncode == 0:
    print("Todo O.K.")
