# moto.py
from IVehiculo import IVehiculo

class Moto(IVehiculo):
    def __init__(self, color: str, marca: str, velocidad: float = 0.0):
        super().__init__(color, marca, llantas=2, velocidad=velocidad)
