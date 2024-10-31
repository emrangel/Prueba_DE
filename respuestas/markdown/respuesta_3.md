
## a. Logica 

El proceso debe recibir la información de una Base de datos y trabajarlo como un dataframe con los campos.

COMERCIAL | FECHA | VENTAS

Y otro dataframe con los rangos de puntos según ventas por ejemplo 

VENTAS | PUNTOS 

Donde por cada 1000 dolares se asignan 10 puntos 

El algoritmo debe recibir estos dos dataframes y la logica es:


Desconocemos el valor del punto por venta es decir que la funcion debe recibir el dataframe con comercial fecha y ventas y un dataframe con los puntos por rango de ventas podemos imaginar que por cada 1000 dolares se asignan 10 puntos y aumenta proporcional es decir por 2000 dolares son 20 puntos
 
- Se debe saber si el mes siguiente del mes actual del año anterior vendio mas que el mes actual en ese caso son 50 puntos
- Se debe saber si el mes actual vendio mas que el mes siguiente del año anterior son 100 puntos 
- Se debe saber si en el mes actual no tiene ventas pero tiene ventas en algun mes del año anterior se debe promediar los puntos de los meses del año anterior y dejarlo en el mes faltante

===================================================

# [**PseudoCodigo**](../../respuestas/scripts/respuesta_3.py)

===================================================


## b. Llevar el Algoritmo a Producción

Para llevar este algoritmo a producción, seguiría estos pasos:

1. **Desarrollo en Python:**
   - Implementa la lógica del cálculo de puntos directamente en Python, como en el pseudocódigo anterior.
   - Usa una estructura de datos simple, como listas o diccionarios, para almacenar los puntos de ventas.

2. **Visualización:**
   - Utiliza bibliotecas como **Dash** o **Streamlit** para crear un tablero interactivo donde los empleados puedan ver sus puntos acumulados.
   - Configura gráficos para visualizar el rendimiento de ventas y los puntos de manera intuitiva, facilitando la autoevaluación.

3. **Flujo de Datos:**
   - Permite que los empleados ingresen sus datos de ventas en la aplicación.
   - Calcula automáticamente los puntos según las reglas establecidas y actualiza el tablero en tiempo real.

4. **Implementación:**
   - Ejecuta la aplicación localmente o en un servidor accesible para los empleados.
   - Asegúrate de que la interfaz sea fácil de usar, permitiendo a los empleados ver sus puntos sin complicaciones.

5. **Revisión y Ajustes:**
   - Recoge comentarios de los empleados sobre la utilidad del tablero.
   - Ajusta las reglas de puntos o la visualización según sea necesario para mantener el interés y la motivación.
