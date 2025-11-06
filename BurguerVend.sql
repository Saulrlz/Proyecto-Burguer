-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS burguervenddb;
USE burguervenddb;

-- 2. Crear la tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo ENUM('hamburguesa', 'refresco') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL
);

-- 3. Crear la tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    tipo ENUM('cliente', 'admin') NOT NULL
);

-- 4. Crear la tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- 5. Crear la tabla de detalles de venta
CREATE TABLE detalleventa (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 6. Insertar los productos
INSERT INTO productos (nombre, tipo, precio, cantidad) VALUES 
('Burguer style', 'hamburguesa', 75.00, 100),
('Burguer Monstruo', 'hamburguesa', 85.00, 100),
('Burguer KFC', 'hamburguesa', 90.00, 100),
('Burguer Angus', 'hamburguesa', 100.00, 100),
('Pepsi', 'refresco', 19.50, 100),
('7up', 'refresco', 17.99, 100),
('Mirinda', 'refresco', 24.00, 100),
('Manzanita', 'refresco', 22.50, 100);