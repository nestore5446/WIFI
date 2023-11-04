import random
import string

def generar_contrasena():
    longitud_minima = 8
    longitud_maxima = 63
    caracteres = string.ascii_letters + string.digits
    contrasena = ''.join(random.choice(caracteres) for _ in range(random.randint(longitud_minima, longitud_maxima)))
    return contrasena

def guardar_contrasena_en_archivo(contrasena):
    archivo = "passw.txt"
    with open(archivo, "a") as file:
        file.write(contrasena + '\n')

contrasenas_generadas = 0
contrasenas_guardadas = set()

while contrasenas_generadas < 100000000:
    contrasena_generada = generar_contrasena()
    
    if contrasena_generada not in contrasenas_guardadas:
        print("Contraseña generada:", contrasena_generada)
        contrasenas_guardadas.add(contrasena_generada)
        
        guardar_contrasena_en_archivo(contrasena_generada)
        print("Contraseña agregada al archivo 'passw.txt'")
        contrasenas_generadas += 1

print("Se generaron 100000000 contraseñas. El programa ha terminado.")
