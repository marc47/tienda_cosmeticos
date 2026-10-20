USE tienda_cosmeticos;

INSERT INTO Categorias (idCategoria, nombre) VALUES
(1,  'Maquillaje'),
(2,  'Cuidado Facial'),
(3,  'Cuidado Corporal'),
(4,  'Cabello'),
(5,  'Perfumería'),
(6,  'Uñas'),
(7,  'Protección Solar'),
(8,  'Higiene Personal'),
(9,  'Accesorios'),
(10, 'Cuidado Masculino');

INSERT INTO Productos
(idProducto, nombre, descripcion, categoria_id, precio, stock) VALUES
(1,  'Base Líquida Mate',       'Base de cobertura media con acabado mate', 1, 129.00, 40),
(2,  'Labial Rojo Intenso',     'Labial cremoso de larga duración', 1, 59.00, 75),
(3,  'Crema Hidratante Facial', 'Crema hidratante con ácido hialurónico', 2, 145.50, 30),
(4,  'Sérum Vitamina C',        'Sérum antioxidante iluminador', 2, 210.00, 22),
(5,  'Loción Corporal Karité',  'Loción nutritiva con manteca de karité', 3, 85.00, 50),
(6,  'Champú Reparador',        'Champú para cabello dañado', 4, 68.75, 60),
(7,  'Perfume Floral 50ml',     'Agua de perfume con notas florales', 5, 389.00, 15),
(8,  'Esmalte Gel Rosa',        'Esmalte de uñas con efecto gel', 6, 35.00, 90),
(9,  'Protector Solar FPS 50',  'Protector Crema solar facial resistente al agua', 7, 120.00, 45),
(10, 'Set de Brochas',          'Set de cinco brochas para maquillaje', 9, 175.00, 18);

INSERT INTO CamposAdicionalesProductos
(idCamposAdicionales, producto_id, tipo, tono, fechaExpiracion, tipoPiel, componentePrincipal) VALUES
(1,  1,  'Maquillaje', 'Beige Natural', '2027-08-15', 'Mixta', 'Dimeticona'),
(2,  2,  'Maquillaje', 'Rojo Cereza',   '2027-05-20', 'Todo tipo', 'Cera de abeja'),
(3,  3,  'Facial',     NULL,            '2027-03-10', 'Seca', 'Ácido hialurónico'),
(4,  4,  'Facial',     NULL,            '2026-12-30', 'Normal', 'Vitamina C'),
(5,  5,  'Corporal',   NULL,            '2027-09-01', 'Seca', 'Manteca de karité'),
(6,  6,  'Capilar',    NULL,            '2028-01-15', 'Todo tipo', 'Queratina'),
(7,  7,  'Fragancia',  NULL,            '2029-06-30', 'Todo tipo', 'Esencia floral'),
(8,  8,  'Uñas',       'Rosa Pastel',   '2027-11-25', NULL, 'Nitrocelulosa'),
(9,  9,  'Solar',      NULL,            '2027-02-14', 'Sensible', 'Óxido de zinc'),
(10, 10, 'Accesorio',  'Negro',         NULL,         NULL, 'Fibra sintética');

INSERT INTO Clientes 
(idCliente, nombre, correo, direccion, telefono) VALUES
(1,  'María López Ramírez',      'maria.lopez@correo.com',      'Zona 10, Ciudad de Guatemala', '5512-3401'),
(2,  'Carlos Méndez Pérez',      'carlos.mendez@correo.com',    'Zona 1, Ciudad de Guatemala', '5523-8812'),
(3,  'Ana Sofía Castillo',       'ana.castillo@correo.com',     'Mixco, Guatemala', '4134-2290'),
(4,  'José Luis Hernández',      'jose.hernandez@correo.com',   'Zona 7, Ciudad de Guatemala', '5890-1123'),
(5,  'Lucía Fernanda Morales',   'lucia.morales@correo.com',    'Villa Nueva, Guatemala', '4021-7745'),
(6,  'Diego Alejandro Ruiz',     'diego.ruiz@correo.com',       'Antigua Guatemala, Sacatepéquez', '5567-9034'),
(7,  'Valeria Estrada',          'valeria.estrada@correo.com',  'Zona 15, Ciudad de Guatemala', '4456-3321'),
(8,  'Pedro Pablo Gómez',        'pedro.gomez@correo.com',      'Quetzaltenango, Quetzaltenango', '5701-6658'),
(9,  'Karla Mishel Ortiz',       'karla.ortiz@correo.com',      'Zona 11, Ciudad de Guatemala', '3098-4472'),
(10, 'Andrés Felipe Soto',       'andres.soto@correo.com',      'San Miguel Petapa, Guatemala', '5345-2287');

INSERT INTO Empleados 
(idEmpleado, nombre, puesto, fechaContratacion, area) VALUES
(1,  'Laura Gabriela Pineda',    'Gerente de Tienda',   '2019-03-04', 'Administración'),
(2,  'Roberto Carlos Juárez',    'Vendedor',            '2021-06-15', 'Ventas'),
(3,  'Sandra Patricia Girón',    'Vendedora',           '2020-09-21', 'Ventas'),
(4,  'Marvin Eduardo Alvarado',  'Encargado de Bodega', '2018-01-10', 'Inventario'),
(5,  'Daniela Beatriz Cruz',     'Cajera',              '2022-02-07', 'Caja'),
(6,  'Héctor Manuel Tzoc',       'Comprador',           '2020-05-18', 'Compras'),
(7,  'Gabriela Alejandra Rivas', 'Vendedora',           '2023-04-03', 'Ventas'),
(8,  'Oscar René Barrios',       'Auxiliar de Bodega',  '2023-08-14', 'Inventario'),
(9,  'Mónica Lucrecia Paz',      'Contadora',           '2019-11-25', 'Contabilidad'),
(10, 'Julio César Ixcoy',        'Vendedor',            '2024-01-22', 'Ventas');

INSERT INTO Proveedores 
(idProveedor, nombre, correo, direccion, telefono) VALUES
(1,  'Distribuidora Belleza GT',   'ventas@bellezagt.com',       'Zona 12, Ciudad de Guatemala', '2334-5501'),
(2,  'Cosméticos del Pacífico',    'contacto@cosmepacifico.com', 'Escuintla, Escuintla', '7888-1204'),
(3,  'Importadora Glamour S.A.',   'info@glamour.com.gt',        'Zona 4, Ciudad de Guatemala', '2360-7789'),
(4,  'Natura Andina Guatemala',    'pedidos@naturaandina.com',   'Zona 9, Ciudad de Guatemala', '2331-4420'),
(5,  'Fragancias Centroamérica',   'ventas@fragcentro.com',     'Zona 13, Ciudad de Guatemala', '2475-9012'),
(6,  'Capilar Pro Distribuciones', 'capilarpro@correo.com',      'Mixco, Guatemala', '2431-6683'),
(7,  'Dermacare Suministros',      'dermacare@correo.com',       'Zona 14, Ciudad de Guatemala', '2368-2257'),
(8,  'Uñas y Color S.A.',          'ventas@unasycolor.com',      'Zona 6, Ciudad de Guatemala', '2288-1745'),
(9,  'Accesorios Beauty Import',   'beauty.import@correo.com',   'Zona 3, Ciudad de Guatemala', '2251-3398'),
(10, 'Solaris Cuidado de la Piel', 'solaris@correo.com',         'Quetzaltenango, Quetzaltenango', '7761-0845');

INSERT INTO PedidosVenta 
(idPedido, fecha, cliente_id, empleado_id, total) VALUES
(1,  '2026-09-01', 1, 2, 247.00),
(2,  '2026-09-05', 2, 3, 145.50),
(3,  '2026-09-10', 3, 2, 450.00),
(4,  '2026-09-14', 4, 7, 389.00),
(5,  '2026-09-18', 5, 3, 238.75),
(6,  '2026-09-22', 6, 10, 105.00),
(7,  '2026-09-25', 7, 7, 234.00),
(8,  '2026-09-29', 1, 2, 565.50),
(9,  '2026-10-03', 8, 10, 205.00),
(10, '2026-10-08', 9, 3, 647.00);

INSERT INTO DetallePedidosVenta
(idDetallePedido, producto_id, cantidad, precioUnitario, pedido_id) VALUES
(1,  1,  1, 129.00, 1),
(2,  2,  2, 59.00, 1),
(3,  3,  1, 145.50, 2),
(4,  4,  1, 210.00, 3),
(5,  9,  2, 120.00, 3),
(6,  7,  1, 389.00, 4),
(7,  5,  2, 85.00, 5),
(8,  6,  1, 68.75, 5),
(9,  8,  3, 35.00, 6),
(10, 10,  1, 175.00, 7),
(11,  2,  1, 59.00, 7),
(12,  4,  2, 210.00, 8),
(13,  3,  1, 145.50, 8),
(14,  9,  1, 120.00, 9),
(15,  5,  1, 85.00, 9),
(16,  1,  2, 129.00, 10),
(17,  7,  1, 389.00, 10);

INSERT INTO OrdenesCompra 
(idOrdenCompra, fecha, proveedor_id, total) VALUES
(1,  '2024-08-02', 1, 2650.00),
(2,  '2024-08-05', 2, 1250.00),
(3,  '2024-08-09', 3, 1770.00),
(4,  '2024-08-14', 4, 2700.00),
(5,  '2025-08-20', 5, 2080.00),
(6,  '2025-08-26', 6, 1260.00),
(7,  '2025-09-02', 7, 2520.00),
(8,  '2025-09-09', 8, 900.00),
(9,  '2026-06-16', 9, 1540.00),
(10, '2026-07-23', 10, 2875.00),
(11,  '2026-10-16', 5, 1540.00),
(12,  '2026-10-19', 5, 1540.00);


INSERT INTO DetalleOrdenesCompra
(idDetalleOrden, producto_id, cantidad, costo, ordenCompra_id) VALUES
(1,  1,  20, 80.00, 1),
(2,  2,  30, 35.00, 1),
(3,  5,  25, 50.00, 2),
(4, 10,  10, 105.00, 3),
(5,  8,  40, 18.00, 3),
(6,  3,  15, 90.00, 4),
(7,  4,  10, 135.00, 4),
(8,  7,   8, 260.00, 5),
(9,  6,  30, 42.00, 6),
(10, 4,  12, 135.00, 7),
(11, 3,  10, 90.00, 7),
(12, 8,  50, 18.00, 8),
(13, 10,  8, 105.00, 9),
(14,  2,  20, 35.00, 9),
(15,  9,  25, 75.00, 10),
(16,  5,  20, 50.00, 10);
