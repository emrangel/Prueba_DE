# carro.py
from IVehiculo import IVehiculo

class Carro(IVehiculo):
    def __init__(self, color: str, marca: str, velocidad: float = 0.0):
        super().__init__(color, marca, llantas=4, velocidad=velocidad)
