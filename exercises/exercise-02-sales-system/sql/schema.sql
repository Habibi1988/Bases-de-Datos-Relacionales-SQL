-- Exercise 2 — Sistema de ventas (Sales System)
-- MySQL 8.4
-- Based on the official exercise statement (Ejercicios Modelo Entidad/Relación).
-- Data types and identifiers are implementation choices where the prompt is silent.

CREATE DATABASE IF NOT EXISTS ventas;

USE ventas;
CREATE TABLE IF NOT EXISTS clientes(
    cif_nif VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100),
    calle VARCHAR (100),
    nomero VARCHAR(10),
    ciudad VARCHAR(60),
    codigo_postal VARCHAR(10)
);

ALTER TABLE clientes
RENAME COLUMN nomero TO numero;


CREATE TABLE IF NOT EXISTS telefono_cliente(
    cif_nif VARCHAR(15),
    telefono VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY(cif_nif)
    REFERENCES clientes(cif_nif)
);

ALTER TABLE telefono_cliente
MODIFY cif_nif VARCHAR(15) NOT NULL;

RENAME TABLE telefono_cliente TO telefonos_clientes;

ALTER TABLE telefono_cliente
ADD CONSTRAINT fk_telefono_cliente_cliente
FOREIGN KEY (cif_nif)
REFERENCES clientes(cif_nif);


CREATE TABLE IF NOT EXISTS categorias(
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS proveedores(
    cif_nif VARCHAR(15)  PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    web VARCHAR(255),
    numero VARCHAR(10),
    ciudad VARCHAR(60),
    codigo_postal VARCHAR(10)
);


CREATE TABLE IF NOT EXISTS productos(
    id_productos INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    stock INT,
    precio_actual DECIMAL(10,2),
    fk_cif_nif_proveedor VARCHAR(15),
    fk_id_categorias INT,

    FOREIGN KEY (fk_cif_nif_proveedor)
    REFERENCES proveedores(cif_nif),

    FOREIGN KEY (fk_id_categorias)
    REFERENCES categorias(id_categoria)
);

CREATE TABLE IF NOT EXISTS facturas(
    numero_factura INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    descuento DECIMAL(10,2),
    importe_final DECIMAL(10,2),
    fk_cif_nif_clientes VARCHAR(15),

    FOREIGN KEY (fk_cif_nif_clientes)
    REFERENCES clientes(cif_nif)
);



CREATE TABLE IF NOT EXISTS factura_productos (
    numero_factura INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(20,2),
    iva DECIMAL(5,2),

    PRIMARY KEY (numero_factura, id_producto),

    FOREIGN KEY (numero_factura)
        REFERENCES facturas(numero_factura),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_productos)
);

USE ventas;

INSERT INTO clientes
(cif_nif, nombre, calle, numero, ciudad, codigo_postal)
VALUES
('12345678A', 'Carlos Garcia', 'Calle Mayor', '10', 'Barcelona', '08001'),
('87654321B', 'Maria Lopez', 'Calle Marina', '25', 'Badalona', '08912');

SELECT * FROM clientes;

RENAME TABLE factura_productos TO facturas_productos;

INSERT INTO proveedores
(cif_nif, nombre, telefono, web, numero, ciudad, codigo_postal)
VALUES
('B12345678', 'Tech Solutions', '931234567', 'www.techsolutions.com', '15', 'Barcelona', '08002'),
('B87654321', 'Global Supplies', '934567890', 'www.globalsupplies.com', '20', 'Badalona', '08911');

SELECT * FROM proveedores;

INSERT INTO categorias
(nombre_categoria, descripcion)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Computers', 'Computers and computer components'),
('Office Supplies', 'Products for office use');

SELECT * FROM categorias;

INSERT INTO productos
(nombre, stock, precio_actual, fk_cif_nif_proveedor, fk_id_categorias)
VALUES
('Laptop Lenovo', 15, 750.00, 'B12345678', 1),
('Samsung Monitor', 20, 180.00, 'B12345678', 1),
('Office Computer', 10, 950.00, 'B87654321', 2),
('Office Chair', 25, 120.00, 'B87654321', 3);

SELECT * FROM productos;

INSERT INTO telefonos_clientes
(cif_nif, telefono)
VALUES
('12345678A', '600123456'),
('12345678A', '600123457'),
('87654321B', '611123456');

SELECT * from telefonos_clientes;

INSERT INTO facturas
(fecha, descuento, importe_final, fk_cif_nif_clientes)
VALUES
('2026-11-01', 5.00, 1100.00, '12345678A'),
('2026-11-02', 10.00, 950.00, '87654321B');
 SELECT * FROM facturas;

INSERT INTO facturas_productos
(numero_factura, id_producto, cantidad, precio, iva)
VALUES
(1, 1, 1, 750.00, 21.00),
(1, 2, 2, 180.00, 21.00),
(2, 3, 1, 950.00, 21.00),
(2, 4, 2, 120.00, 21.00);

SELECT * FROM facturas_productos;






