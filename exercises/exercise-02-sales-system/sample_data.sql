
-- =====================================================
-- Exercise 2: Sistema de Ventas
-- Sample Data
-- Database: ventas
-- MySQL Version: 8.4
-- =====================================================

USE ventas;


-- =====================================================
-- 1. CLIENTES
-- =====================================================

INSERT INTO clientes
(cif_nif, nombre, calle, numero, ciudad, codigo_postal)
VALUES
('12345678A', 'Carlos Garcia', 'Calle Mayor', '15', 'Barcelona', '08001'),
('87654321B', 'Maria Lopez', 'Avenida Madrid', '28', 'Badalona', '08912');


-- =====================================================
-- 2. TELEFONOS_CLIENTES
-- =====================================================

INSERT INTO telefonos_clientes
(cif_nif, telefono)
VALUES
('12345678A', '600111222'),
('12345678A', '600111223'),
('87654321B', '600222333');


-- =====================================================
-- 3. CATEGORIAS
-- =====================================================

INSERT INTO categorias
(nombre_categoria, descripcion)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Computers', 'Computers and computer equipment'),
('Office Supplies', 'Products for office use');


-- =====================================================
-- 4. PROVEEDORES
-- =====================================================

INSERT INTO proveedores
(cif_nif, nombre, telefono, web, numero, ciudad, codigo_postal)
VALUES
('B12345678', 'Tech Solutions', '931234567',
 'www.techsolutions.com', '10', 'Barcelona', '08002'),

('B87654321', 'Global Supplies', '932345678',
 'www.globalsupplies.com', '25', 'Badalona', '08910');


-- =====================================================
-- 5. PRODUCTOS
-- =====================================================

INSERT INTO productos
(nombre, stock, precio_actual, fk_cif_nif_proveedor, fk_id_categorias)
VALUES
('Laptop Lenovo', 20, 750.00, 'B12345678', 2),
('Samsung Monitor', 35, 180.00, 'B12345678', 1),
('Office Computer', 15, 950.00, 'B87654321', 2),
('Office Chair', 40, 120.00, 'B87654321', 3);


-- =====================================================
-- 6. FACTURAS
-- =====================================================

INSERT INTO facturas
(fecha, descuento, importe_final, fk_cif_nif_clientes)
VALUES
('2026-11-01', 50.00, 1089.50, '12345678A'),
('2026-11-02', 20.00, 1422.00, '87654321B');


-- =====================================================
-- 7. FACTURAS_PRODUCTOS
-- =====================================================

INSERT INTO facturas_productos
(numero_factura, id_producto, cantidad, precio, iva)
VALUES
(1, 1, 1, 750.00, 21.00),
(1, 2, 2, 180.00, 21.00),
(2, 3, 1, 950.00, 21.00),
(2, 4, 2, 120.00, 21.00);


-- =====================================================
-- END OF SAMPLE DATA
-- =====================================================
