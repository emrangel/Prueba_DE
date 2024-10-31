/*
a. Total de ventas por Canal de venta
Para obtener el total de ventas por canal de venta,
necesitamos agrupar por Id_canal_venta y sumar el Valor_venta.
*/
SELECT 
    cv.Descripcion_canal,
    SUM(v.Valor_venta) AS total_ventas
FROM 
    ventas v
JOIN 
    canal_de_venta cv ON v.Id_canal_venta = cv.Id_canal_venta
GROUP BY 
    cv.Descripcion_canal;

/*
b. Promedio de ventas por Género
Para calcular el promedio de ventas por género,
unimos la tabla de ventas con la de clientes y luego agrupamos por Genero calculando el promedio del Valor_venta.
*/

SELECT 
    c.Genero,
    AVG(v.Valor_venta) AS promedio_ventas
FROM 
    ventas v
JOIN 
    clientes c ON v.Id_cliente = c.Id_cliente
GROUP BY 
    c.Genero;


/*
c. Costo total por mes y por ciudad
Aquí necesitamos calcular el costo total,
que implica unir la tabla de ventas con productos y clientes.
Luego, extraemos el mes de Fecha_venta y agrupamos por mes y ciudad para obtener la suma del Costo_producto.
*/

SELECT 
    MONTH(v.Fecha_venta) AS mes,
    c.Ciudad,
    SUM(p.Costo_producto) AS costo_total
FROM 
    ventas v
JOIN 
    productos p ON v.Id_producto = p.Id_producto
JOIN 
    clientes c ON v.Id_cliente = c.Id_cliente
GROUP BY 
    mes, c.Ciudad
ORDER BY 
    mes, c.Ciudad;
