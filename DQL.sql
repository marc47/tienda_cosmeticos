USE tienda_cosmeticos;

-- Seleccion de todos los productos
SELECT * FROM productos;

-- Productos cuyo nombre contiene "crema", junto con su categoría y existencias.
SELECT
    p.idProducto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.precio,
    p.stock
FROM Productos AS p
INNER JOIN Categorias AS c
    ON c.idCategoria = p.categoria_id
WHERE p.nombre LIKE '%Crema%'
ORDER BY p.nombre;

-- Detalle de ventas con cliente, empleado y subtotal por producto.
SELECT
    pv.idPedido,
    pv.fecha,
    c.nombre AS cliente,
    e.nombre AS empleado,
    p.nombre AS producto,
    dp.cantidad,
    dp.precioUnitario,
    dp.cantidad * dp.precioUnitario AS subtotal
FROM PedidosVenta AS pv
INNER JOIN Clientes AS c
    ON c.idCliente = pv.cliente_id
INNER JOIN Empleados AS e
    ON e.idEmpleado = pv.empleado_id
INNER JOIN DetallePedidosVenta AS dp
    ON dp.pedido_id = pv.idPedido
INNER JOIN Productos AS p
    ON p.idProducto = dp.producto_id
ORDER BY pv.fecha, pv.idPedido, dp.idDetallePedido;

-- Total vendido por cliente; incluye clientes sin pedidos.
SELECT
    c.idCliente,
    c.nombre AS cliente,
    COALESCE(SUM(pv.total), 0.00) AS total_compras
FROM Clientes AS c
LEFT JOIN PedidosVenta AS pv
    ON pv.cliente_id = c.idCliente
GROUP BY c.idCliente, c.nombre
ORDER BY total_compras DESC, c.nombre;
