
-- =====================================================
-- EXERCISE 3: CARRETERAS
-- Sample Data
-- IFCD47 - Programacion con SQL y Bases de Datos Relacionales
-- =====================================================

USE carreteras;


-- =====================================================
-- 1. TITULARIDADES
-- =====================================================

INSERT INTO titularidades
    (pk_titularidad, titularidad)
VALUES
    (1, 'Estatal'),
    (2, 'Autonomica'),
    (3, 'Provincial'),
    (4, 'Municipal');


-- =====================================================
-- 2. TIPOS_VIA
-- =====================================================

INSERT INTO tipos_via
    (pk_tipo_via, via)
VALUES
    (1, 'Autopista'),
    (2, 'Autovia'),
    (3, 'Multicarril'),
    (4, 'Convencional');


-- =====================================================
-- 3. NIVELES
-- =====================================================

INSERT INTO niveles
    (pd_nivel, nivel, color)
VALUES
    (1, 1, 'Naranja'),
    (2, 2, 'Verde'),
    (3, 3, 'Amarillo');


-- =====================================================
-- 4. TIPO_TERRENO
-- =====================================================

INSERT INTO tipo_terreno
    (pk_tipo_terreno, tipo_terreno)
VALUES
    (1, 'Plano'),
    (2, 'Cuesta subida'),
    (3, 'Cuesta bajada');


-- =====================================================
-- 5. TIPOS_TRAMO
-- Assumption: these categories are illustrative.
-- =====================================================

INSERT INTO tipos_tramo
    (pk_tipo_tramo, tipo_tramo)
VALUES
    (1, 'Inicio'),
    (2, 'Intermedio'),
    (3, 'Final');


-- =====================================================
-- 6. ENTORNOS
-- =====================================================

INSERT INTO entornos
    (pk_entorno, entorno)
VALUES
    (1, 'Urbano'),
    (2, 'Travesia'),
    (3, 'Extraurbano');


-- =====================================================
-- 7. COMUNIDADES_AUTONOMAS
-- =====================================================

INSERT INTO comunidades_autonomas
    (pk_ccaa, comunidad_autonoma)
VALUES
    (1, 'Cataluna');


-- =====================================================
-- 8. PROVINCIAS
-- =====================================================

INSERT INTO provincias
    (pk_provincia, nombre_provincia, fk_ccaa)
VALUES
    (1, 'Barcelona', 1),
    (2, 'Girona', 1),
    (3, 'Tarragona', 1),
    (4, 'Lleida', 1);


-- =====================================================
-- 9. CARRETERAS
-- =====================================================

INSERT INTO carreteras (
    pk_carretera,
    codigo_carretera,
    nombre_carretera,
    fk_titularidad,
    fk_tipo_via,
    fk_nivel,
    acceso_controlado,
    doble_calzada,
    prefijo,
    senal,
    fk_observacion
)
VALUES
    (1, 'A-2', 'Autovia del Nord-est',
     1, 2, NULL, TRUE, TRUE, 'A', 'Azul', NULL),

    (2, 'AP-7', 'Autopista del Mediterrani',
     1, 1, NULL, TRUE, TRUE, 'AP', 'Azul', NULL),

    (3, 'C-31', 'Carretera de la Costa',
     2, 4, 1, FALSE, FALSE, 'C', 'Naranja', NULL);


-- =====================================================
-- 10. TRAMOS
-- longitud is generated automatically.
-- Do not insert a value into longitud.
-- =====================================================

INSERT INTO tramos (
    pk_tramo,
    fk_carretera,
    fk_tipo_tramo,
    km_inicial,
    fk_provincia_inicial,
    km_final,
    fk_provincia_final,
    fk_tipo_terreno,
    fk_entorno,
    velocidad_limite,
    sentidos,
    carriles_ida,
    carriles_vuelta,
    observaciones
)
VALUES
    (1, 1, 1, 0.00, 1, 10.00, 1,
     1, 3, 100, 2, 2, 2,
     'Tramo inicial de ejemplo'),

    (2, 1, 2, 10.00, 1, 25.00, 1,
     2, 3, 100, 2, 2, 2,
     'Tramo con pendiente'),

    (3, 2, 2, 100.00, 1, 120.00, 2,
     1, 3, 120, 2, 2, 2,
     'Tramo entre Barcelona y Girona'),

    (4, 3, 3, 5.00, 1, 15.00, 1,
     3, 1, 50, 2, 1, 1,
     'Tramo urbano de ejemplo');


-- =====================================================
-- 11. OBSERVACIONES_CARRETERA
-- =====================================================

INSERT INTO observaciones_carretera (
    pk_observacion,
    fk_carretera,
    observacion
)
VALUES
    (1, 1, 'Carretera principal de conexion'),
    (2, 2, 'Autopista de peaje'),
    (3, 3, 'Carretera con zonas urbanas');


-- =====================================================
-- 12. CONFLUENCIAS
-- =====================================================

INSERT INTO confluencias (
    pk_confluencia,
    fk_tramo1,
    km_tramo1,
    fk_provincia,
    fk_tramo2,
    km_tramo2
)
VALUES
    (1, 2, 25.00, 1, 4, 5.00);


-- =====================================================
-- 13. VERIFICATION
-- =====================================================

SHOW TABLES;

SELECT * FROM titularidades;
SELECT * FROM tipos_via;
SELECT * FROM niveles;
SELECT * FROM comunidades_autonomas;
SELECT * FROM provincias;
SELECT * FROM carreteras;
SELECT * FROM tramos;
SELECT * FROM observaciones_carretera;
SELECT * FROM confluencias;
