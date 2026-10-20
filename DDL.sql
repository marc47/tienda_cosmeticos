create database tienda_cosmeticos;

use tienda_cosmeticos;

create table Clientes (
    idCliente int primary key auto_increment,
    nombre varchar(45) not null,
    correo varchar(45) not null,
    direccion varchar(45) not null,
    telefono varchar(9) not null
);

create table Empleados (
    idEmpleado int primary key auto_increment,
    nombre varchar(45) not null,
    puesto varchar(45) not null,
    fechaContratacion date not null,
    area varchar(45) not null
);

create table Categorias (
    idCategoria int primary key auto_increment,
    nombre varchar(45)
);

create table PedidosVenta (
    idPedido int primary auto_increment,
    fecha date not null,
    cliente_id int not null,
    empleado_id int not null,
    total decimal(10,2) not null,
    foreign key (cliente_id) references Clientes(idCliente),
    foreign key (empleado_id) references Empleados(idEmpleado)
);

create table Productos (
    idProducto int primary key auto_increment,
    nombre varchar(45) not null,
    descripcion varchar(45) not null,
    categoria_id int not null,
    precio decimal(5,2) not null,
    stock int not null,
    foreign key (categoria_id) references Categorias(idCategorias)
);

create table CamposAdicionalesProductos (
    idCamposAdicionales int primary key auto_increment,
    producto_id int not null,
    tipo varchar(45) not null,
    tono varchar(45) not null,
    fechaExpiracion date not null,
    tipoPiel varchar(45) not null,
    componentePrincipal varchar(45) not null,
    foreign key (producto_id) references Productos(idProducto)
);

create table Proveedores (
    idProveedor int primary key auto_increment,
    nombre varchar(45) not null,
    corre varchar(45) not null,
    direccion varchar(45) not null,
    telefono varchar(9) not null,
);

create table OrdenesCompra (
    idOrdenCompra int primary key auto_increment,
    fecha date not null,
    proveedor_id int not null,
    total decimal(10,2) not null,
    foreign key (proveedor_id) references Proveedores(idProveedor)
);

create table DetalleOrdenesCompra (
    idDetalleOrden int primary key auto_increment,
    producto_id int not null,
    cantidad int not null,
    costo decimal(5,2) not null,
    ordenCompra_id int not null,
    foreign key (producto_id) references Productos(idProducto),
    foreign key (ordenCompra_id) references OrdenesCompra(idOrdenCompra)

);