# main.py
from carro import Carro
from moto import Moto

# Crear un objeto Carro
carro = Carro(color="Rojo", marca="Toyota", velocidad=60.0)
print("Marca del carro:", carro.marca)
print("Velocidad inicial del carro:", carro.velocidad)

# Aumentar velocidad
carro.aumentar_velocidad(20)
print("Velocidad después de aumentar:", carro.velocidad)

# Reducir velocidad
carro.reducir_velocidad(30)
print("Velocidad después de reducir:", carro.velocidad)

# Crear un objeto Moto
moto = Moto(color="Azul", marca="Yamaha", velocidad=30.0)
print("\nMarca de la moto:", moto.marca)
print("Velocidad inicial de la moto:", moto.velocidad)

# Aumentar velocidad
moto.aumentar_velocidad(15)
print("Velocidad después de aumentar en la moto:", moto.velocidad)

# Reducir velocidad
moto.reducir_velocidad(10)
print("Velocidad después de reducir en la moto:", moto.velocidad)
