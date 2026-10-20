CREATE DATABASE IF NOT EXISTS tienda_cosmeticos
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE tienda_cosmeticos;

CREATE TABLE IF NOT EXISTS Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Empleados (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(60) NOT NULL,
    fechaContratacion DATE NOT NULL,
    area VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Categorias (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Proveedores (
    idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Productos (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    categoria_id INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT fk_productos_categoria
        FOREIGN KEY (categoria_id) REFERENCES Categorias(idCategoria)
);

CREATE TABLE IF NOT EXISTS CamposAdicionalesProductos (
    idCamposAdicionales INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL UNIQUE,
    tipo VARCHAR(60) NOT NULL,
    tono VARCHAR(60),
    fechaExpiracion DATE,
    tipoPiel VARCHAR(60),
    componentePrincipal VARCHAR(100),
    CONSTRAINT fk_campos_adicionales_producto
        FOREIGN KEY (producto_id) REFERENCES Productos(idProducto)
);

CREATE TABLE IF NOT EXISTS PedidosVenta (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_pedidos_venta_cliente
        FOREIGN KEY (cliente_id) REFERENCES Clientes(idCliente),
    CONSTRAINT fk_pedidos_venta_empleado
        FOREIGN KEY (empleado_id) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE IF NOT EXISTS DetallePedidosVenta (
    idDetallePedido INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    pedido_id INT NOT NULL,
    CONSTRAINT fk_detalle_pedido_producto
        FOREIGN KEY (producto_id) REFERENCES Productos(idProducto),
    CONSTRAINT fk_detalle_pedido_pedido
        FOREIGN KEY (pedido_id) REFERENCES PedidosVenta(idPedido)
);

CREATE TABLE IF NOT EXISTS OrdenesCompra (
    idOrdenCompra INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    proveedor_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_ordenes_compra_proveedor
        FOREIGN KEY (proveedor_id) REFERENCES Proveedores(idProveedor)
);

CREATE TABLE IF NOT EXISTS DetalleOrdenesCompra (
    idDetalleOrden INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    ordenCompra_id INT NOT NULL,
    CONSTRAINT fk_detalle_compra_producto
        FOREIGN KEY (producto_id) REFERENCES Productos(idProducto),
    CONSTRAINT fk_detalle_compra_orden
        FOREIGN KEY (ordenCompra_id) REFERENCES OrdenesCompra(idOrdenCompra)
);
