
USE vuelos;

-- 1. AEROPUERTOS
INSERT INTO aeropuertos
(codigo_aeropuerto, nombre, ciudad, pais)
VALUES
('MAD', 'Barajas', 'Madrid', 'España'),
('SYD', 'Caudell', 'Sydney', 'Australia'),
('SAO', 'Los Pradiños', 'Sao Paulo', 'Brasil'),
('SCL', 'El Emperador', 'Santiago', 'Chile'),
('AKL', 'Saint Kitts', 'Auckland', 'Nueva Zelanda');


-- 2. MODELOS DE AVION
INSERT INTO modelos_avion
(modelo, capacidad)
VALUES
('Airbus A330-300', 300);


-- 3. AEROPUERTOS Y MODELOS DE AVION
INSERT INTO aeropuertos_modelos
(codigo_aeropuerto, id_modelo)
VALUES
('MAD', 1),
('SYD', 1),
('SAO', 1),
('SCL', 1),
('AKL', 1);


-- 4. PROGRAMAS DE VUELO
INSERT INTO programas_vuelo
(numero_vuelo, linea_aerea, dias_semana,
 codigo_aeropuerto_salida, codigo_aeropuerto_llegada)
VALUES
(555, 'Iberia', 'Lunes y jueves', 'MAD', 'SYD');


-- 5. VUELOS
INSERT INTO vuelos
(numero_vuelo, fecha, plazas_vacias, id_modelo)
VALUES
(555, '2026-11-16', 42, 1);


-- 6. ESCALAS TECNICAS
INSERT INTO escalas_tecnicas
(id_vuelo, numero_orden, codigo_aeropuerto)
VALUES
(1, 1, 'SAO'),
(1, 2, 'SCL'),
(1, 3, 'AKL');


-- VERIFY INSERTED DATA
SELECT * FROM aeropuertos;
SELECT * FROM modelos_avion;
SELECT * FROM aeropuertos_modelos;
SELECT * FROM programas_vuelo;
SELECT * FROM vuelos;
SELECT * FROM escalas_tecnicas;
