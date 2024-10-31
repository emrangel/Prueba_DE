import pandas as pd

def calcular_compensacion(ventas_df, puntos_df):
    # Asegurarse de que la columna de fecha sea de tipo datetime
    ventas_df['fecha'] = pd.to_datetime(ventas_df['fecha'])

    # Obtener el mes y año de las fechas
    ventas_df['mes'] = ventas_df['fecha'].dt.month
    ventas_df['anio'] = ventas_df['fecha'].dt.year

    # Agrupar ventas por comercial, mes y año
    ventas_agrupadas = ventas_df.groupby(['comercial', 'anio', 'mes'])['ventas'].sum().reset_index()

    # Crear un DataFrame para almacenar las compensaciones
    compensaciones = []

    for _, row in ventas_agrupadas.iterrows():
        comercial = row['comercial']
        mes_actual = row['mes']
        anio_actual = row['anio']
        ventas_actuales = row['ventas']

        # Calcular el mes del año anterior
        mes_anterior = mes_actual
        anio_anterior = anio_actual - 1

        # Obtener las ventas del mes correspondiente del año anterior
        ventas_anterior = ventas_agrupadas.loc[
            (ventas_agrupadas['comercial'] == comercial) &
            (ventas_agrupadas['mes'] == mes_anterior) &
            (ventas_agrupadas['anio'] == anio_anterior),
            'ventas'
        ]

        # Si no hay ventas del año anterior, se ignora
        if not ventas_anterior.empty:
            ventas_anterior = ventas_anterior.values[0]

            # Evaluar la condición de puntos
            if ventas_anterior > ventas_actuales:
                # Calcular los puntos
                puntos_previos = puntos_df.loc[
                    puntos_df['rango_minimo'] <= ventas_anterior,
                    'puntos'
                ].max()

                compensacion = 50 + puntos_previos
                compensaciones.append({'comercial': comercial, 'compensacion': compensacion})

    # Convertir la lista de compensaciones a un DataFrame
    compensaciones_df = pd.DataFrame(compensaciones)

    return compensaciones_df

# Ejemplo de DataFrames
ventas_data = {
    'comercial': ['A', 'A', 'B', 'B', 'A', 'B', 'A'],
    'fecha': ['2023-10-01', '2023-10-15', '2023-10-01', '2023-10-15', '2022-10-01', '2022-10-15', '2022-10-10'],
    'ventas': [1200, 1300, 1100, 1000, 1000, 1200, 1500]
}

puntos_data = {
    'rango_minimo': [0, 1000, 2000, 3000],
    'puntos': [0, 10, 20, 30]
}

ventas_df = pd.DataFrame(ventas_data)
puntos_df = pd.DataFrame(puntos_data)

# Llamar a la función
compensaciones_resultado = calcular_compensacion(ventas_df, puntos_df)

print(compensaciones_resultado)
