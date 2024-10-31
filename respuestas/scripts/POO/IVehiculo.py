# IVehiculo.py
from abc import ABC, abstractmethod

class IVehiculo(ABC):
    def __init__(self, color: str, marca: str, llantas: int, velocidad: float = 0.0):
        self.color = color
        self.marca = marca
        self.llantas = llantas
        self.velocidad = velocidad

    @property
    def color(self) -> str:
        """Devuelve el color del vehículo."""
        return self.__color
    
    @color.setter
    def color(self, value: str) -> None:
        """Establece un nuevo color si es una cadena."""
        if isinstance(value, str):
            self.__color = value
        else:
            raise ValueError('Expected str for color')

    @property
    def marca(self) -> str:
        """Devuelve la marca del vehículo."""
        return self.__marca

    @marca.setter
    def marca(self, value: str) -> None:
        """Establece una nueva marca si es una cadena."""
        if isinstance(value, str):
            self.__marca = value
        else:
            raise ValueError('Expected str for marca')
    
    @property
    def llantas(self) -> int:
        """Devuelve el número de llantas del vehículo."""
        return self.__llantas

    @llantas.setter
    def llantas(self, value: int) -> None:
        """Establece un nuevo número de llantas si es un entero."""
        if isinstance(value, int):
            self.__llantas = value
        else:
            raise ValueError('Expected int for llantas')

    @property
    def velocidad(self) -> float:
        """Devuelve la velocidad actual del vehículo."""
        return self.__velocidad
    
    @velocidad.setter
    def velocidad(self, value: float) -> None:
        """Establece una nueva velocidad si es un número flotante."""
        if isinstance(value, (int, float)):
            self.__velocidad = float(value)
        else:
            raise ValueError('Expected float or int for velocidad')

    def aumentar_velocidad(self, incremento: float) -> None:
        if incremento > 0:
            self.velocidad += incremento
        else:
            raise ValueError("Incremento debe ser positivo")
    
    def reducir_velocidad(self, decremento: float) -> None:
        if 0 < decremento <= self.velocidad:
            self.velocidad -= decremento
        else:
            raise ValueError("Decremento inválido o superior a la velocidad actual")
