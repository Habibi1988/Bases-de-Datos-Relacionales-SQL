
-- Exercise 2: Sistema de Ventas
-- Database: ventas
-- MySQL 8.4

CREATE DATABASE IF NOT EXISTS ventas;

USE ventas;


-- 1. CLIENTES
CREATE TABLE IF NOT EXISTS clientes (
    cif_nif VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100),
    calle VARCHAR(100),
    numero VARCHAR(10),
    ciudad VARCHAR(60),
    codigo_postal VARCHAR(10)
);


-- 2. TELEFONOS_CLIENTES
CREATE TABLE IF NOT EXISTS telefonos_clientes (
    cif_nif VARCHAR(15) NOT NULL,
    telefono VARCHAR(20) PRIMARY KEY,

    CONSTRAINT fk_telefono_cliente
        FOREIGN KEY (cif_nif)
        REFERENCES clientes(cif_nif)
);


-- 3. CATEGORIAS
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);


-- 4. PROVEEDORES
CREATE TABLE IF NOT EXISTS proveedores (
    cif_nif VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    web VARCHAR(255),
    numero VARCHAR(10),
    ciudad VARCHAR(60),
    codigo_postal VARCHAR(10)
);


-- 5. PRODUCTOS
CREATE TABLE IF NOT EXISTS productos (
    id_productos INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    stock INT,
    precio_actual DECIMAL(10,2),
    fk_cif_nif_proveedor VARCHAR(15),
    fk_id_categorias INT,

    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (fk_cif_nif_proveedor)
        REFERENCES proveedores(cif_nif),

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (fk_id_categorias)
        REFERENCES categorias(id_categoria)
);


-- 6. FACTURAS
CREATE TABLE IF NOT EXISTS facturas (
    numero_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    descuento DECIMAL(10,2),
    importe_final DECIMAL(10,2),
    fk_cif_nif_clientes VARCHAR(15),

    CONSTRAINT fk_factura_cliente
        FOREIGN KEY (fk_cif_nif_clientes)
        REFERENCES clientes(cif_nif)
);


-- 7. FACTURAS_PRODUCTOS
CREATE TABLE IF NOT EXISTS facturas_productos (
    numero_factura INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(20,2),
    iva DECIMAL(5,2),

    PRIMARY KEY (numero_factura, id_producto),

    CONSTRAINT fk_factura_producto_factura
        FOREIGN KEY (numero_factura)
        REFERENCES facturas(numero_factura),

    CONSTRAINT fk_factura_producto_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_productos)
);
