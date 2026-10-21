-- Consulta 1

DELIMITER $$

CREATE PROCEDURE sp_listar_productos_por_tipo(IN p_tipo VARCHAR(45))
BEGIN
    SELECT p.idProducto, p.nombre, p.descripcion, c.tipo, p.precio, p.stock
    FROM Productos p
    INNER JOIN CamposAdicionalesProductos c ON p.idProducto = c.producto_id
    WHERE c.tipo = p_tipo;
END $$

DELIMITER ;

-- Prueba
CALL sp_listar_productos_por_tipo('Labial');



-- Consulta 2

DELIMITER $$

CREATE PROCEDURE sp_productos_bajo_stock(IN p_idCategoria INT, IN p_limiteStock INT)
BEGIN
    SELECT idProducto, nombre, precio, stock
    FROM Productos
    WHERE categoria_id = p_idCategoria AND stock < p_limiteStock;
END $$

DELIMITER ;

-- Prueba
CALL sp_productos_bajo_stock(1, 50);


-- Consulta 3

DELIMITER $$

CREATE PROCEDURE sp_ventas_cliente_fechas(
    IN p_idCliente INT, 
    IN p_fechaInicio DATE, 
    IN p_fechaFin DATE
)
BEGIN
    SELECT idPedido, fecha, total
    FROM PedidosVenta
    WHERE cliente_id = p_idCliente 
      AND fecha BETWEEN p_fechaInicio AND p_fechaFin;
END $$

DELIMITER ;

-- Prueba
CALL sp_ventas_cliente_fechas(1, '2026-08-01', '2026-09-30');


-- Consulta 4

DELIMITER $$

CREATE FUNCTION fn_total_ventas_empleado(p_idEmpleado INT, p_mes INT, p_anio INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);
    
    SELECT IFNULL(SUM(total), 0) INTO v_total
    FROM PedidosVenta
    WHERE empleado_id = p_idEmpleado 
      AND MONTH(fecha) = p_mes 
      AND YEAR(fecha) = p_anio;
      
    RETURN v_total;
END $$

DELIMITER ;

-- Prueba
SELECT fn_total_ventas_empleado(2, 9, 2026) AS TotalVendido;



-- Consulta 5

DELIMITER $$

CREATE PROCEDURE sp_productos_mas_vendidos(IN p_fechaInicio DATE, IN p_fechaFin DATE)
BEGIN
    SELECT p.idProducto, p.nombre, SUM(dp.cantidad) AS totalVendidos
    FROM DetallePedidosVenta dp
    INNER JOIN PedidosVenta pv ON dp.pedido_id = pv.idPedido
    INNER JOIN Productos p ON dp.producto_id = p.idProducto
    WHERE pv.fecha BETWEEN p_fechaInicio AND p_fechaFin
    GROUP BY p.idProducto, p.nombre
    ORDER BY totalVendidos DESC;
END $$

DELIMITER ;

-- prueba
CALL sp_productos_mas_vendidos('2026-09-01', '2026-09-30');



-- Consulta 6

DELIMITER $$

CREATE FUNCTION fn_obtener_stock_producto(p_idProducto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_stock INT;
    
    SELECT IFNULL(stock, 0) INTO v_stock
    FROM Productos
    WHERE idProducto = p_idProducto;
    
    RETURN v_stock;
END $$

DELIMITER ;

-- Prueba
SELECT fn_obtener_stock_producto(1) AS StockDisponible;



-- Consulta 7

DELIMITER $$

CREATE PROCEDURE sp_ordenes_proveedor_ultimo_anio(IN p_idProveedor INT)
BEGIN
    SELECT idOrdenCompra, fecha, total
    FROM OrdenesCompra
    WHERE proveedor_id = p_idProveedor
      AND fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END $$

DELIMITER ;

-- Prueba
CALL sp_ordenes_proveedor_ultimo_anio(1);



-- Consulta 8

DELIMITER $$

CREATE PROCEDURE sp_empleados_mas_un_anio()
BEGIN
    SELECT idEmpleado, nombre, puesto, fechaContratacion
    FROM Empleados
    WHERE fechaContratacion <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END $$

DELIMITER ;

-- Prueba
CALL sp_empleados_mas_un_anio();


-- Consulta 9

DELIMITER $$

CREATE FUNCTION fn_total_productos_vendidos_dia(p_fecha DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_cantidadTotal INT;
    
    SELECT IFNULL(SUM(dp.cantidad), 0) INTO v_cantidadTotal
    FROM DetallePedidosVenta dp
    INNER JOIN PedidosVenta pv ON dp.pedido_id = pv.idPedido
    WHERE pv.fecha = p_fecha;
    
    RETURN v_cantidadTotal;
END $$

DELIMITER ;

-- Prueba
SELECT fn_total_productos_vendidos_dia('2026-09-18') AS UnidadesVendidas;



-- consulta 10

DELIMITER $$

CREATE PROCEDURE sp_resumen_ventas_producto(IN p_idProducto INT)
BEGIN
    SELECT 
        p.idProducto,
        p.nombre,
        SUM(dp.cantidad) AS totalUnidadesVendidas,
        SUM(dp.cantidad * dp.precioUnitario) AS montoTotalRecaudado
    FROM Productos p
    LEFT JOIN DetallePedidosVenta dp ON p.idProducto = dp.producto_id
    WHERE p.idProducto = p_idProducto
    GROUP BY p.idProducto, p.nombre;
END $$

DELIMITER ;

-- prueba
CALL sp_resumen_ventas_producto(1);