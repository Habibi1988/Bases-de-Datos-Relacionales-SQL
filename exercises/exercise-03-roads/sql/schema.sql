
-- =====================================================
-- EXERCISE 3: CARRETERAS
-- IFCD47 - Programacion con SQL y Bases de Datos Relacionales
-- MySQL conversion of the professor's Access model
-- =====================================================


-- 1. DATABASE CREATION

DROP DATABASE IF EXISTS carreteras;

CREATE DATABASE carreteras
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE carreteras;


-- =====================================================
-- 2. LOOKUP TABLES
-- =====================================================


-- TABLE: titularidades

CREATE TABLE titularidades (
    pk_titularidad INT AUTO_INCREMENT PRIMARY KEY,
    titularidad VARCHAR(50)
) ENGINE = InnoDB;


-- TABLE: tipos_via

CREATE TABLE tipos_via (
    pk_tipo_via INT AUTO_INCREMENT PRIMARY KEY,
    via VARCHAR(50)
) ENGINE = InnoDB;

CREATE TABLE niveles (
    pd_nivel INT AUTO_INCREMENT PRIMARY KEY,
    nivel INT,
    color VARCHAR(30)
) ENGINE = InnoDB;


-- TABLE: tipo_terreno

CREATE TABLE tipo_terreno (
    pk_tipo_terreno INT AUTO_INCREMENT PRIMARY KEY,
    tipo_terreno VARCHAR(50)
) ENGINE = InnoDB;


-- TABLE: tipos_tramo

CREATE TABLE tipos_tramo (
    pk_tipo_tramo INT AUTO_INCREMENT PRIMARY KEY,
    tipo_tramo VARCHAR(50)
) ENGINE = InnoDB;


-- TABLE: entornos

CREATE TABLE entornos (
    pk_entorno INT AUTO_INCREMENT PRIMARY KEY,
    entorno VARCHAR(50)
) ENGINE = InnoDB;


-- =====================================================
-- 3. GEOGRAPHICAL TABLES
-- =====================================================


-- TABLE: comunidades_autonomas

CREATE TABLE comunidades_autonomas (
    pk_ccaa INT AUTO_INCREMENT PRIMARY KEY,
    comunidad_autonoma VARCHAR(100)
) ENGINE = InnoDB;


-- TABLE: provincias

CREATE TABLE provincias (
    pk_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_provincia VARCHAR(100),
    fk_ccaa INT,

    CONSTRAINT fk_provincias_ccaa
        FOREIGN KEY (fk_ccaa)
        REFERENCES comunidades_autonomas(pk_ccaa)
) ENGINE = InnoDB;


-- =====================================================
-- 4. MAIN TABLE: CARRETERAS
-- =====================================================


CREATE TABLE carreteras (
    pk_carretera INT AUTO_INCREMENT PRIMARY KEY,
    codigo_carretera VARCHAR(20),
    nombre_carretera VARCHAR(100),

    fk_titularidad INT,
    fk_tipo_via INT,
    fk_nivel INT,

    acceso_controlado BOOLEAN,
    doble_calzada BOOLEAN,

    prefijo VARCHAR(10),
    senal VARCHAR(50),

    fk_observacion VARCHAR(255),

    CONSTRAINT uq_codigo_carretera
        UNIQUE (codigo_carretera),

    CONSTRAINT fk_carreteras_titularidad
        FOREIGN KEY (fk_titularidad)
        REFERENCES titularidades(pk_titularidad),

    CONSTRAINT fk_carreteras_tipo_via
        FOREIGN KEY (fk_tipo_via)
        REFERENCES tipos_via(pk_tipo_via),

    CONSTRAINT fk_carreteras_nivel
        FOREIGN KEY (fk_nivel)
        REFERENCES niveles(pd_nivel)
) ENGINE = InnoDB;


-- =====================================================
-- 5. TABLE: TRAMOS
-- =====================================================


CREATE TABLE tramos (
    pk_tramo INT AUTO_INCREMENT PRIMARY KEY,

    fk_carretera INT,
    fk_tipo_tramo INT,

    km_inicial DECIMAL(10,2),
    fk_provincia_inicial INT,

    km_final DECIMAL(10,2),
    fk_provincia_final INT,

    longitud DECIMAL(10,2)
        GENERATED ALWAYS AS (km_final - km_inicial) STORED,

    fk_tipo_terreno INT,
    fk_entorno INT,

    velocidad_limite INT,
    sentidos INT,

    carriles_ida INT,
    carriles_vuelta INT,

    observaciones TEXT,

    CONSTRAINT fk_tramos_carretera
        FOREIGN KEY (fk_carretera)
        REFERENCES carreteras(pk_carretera),

    CONSTRAINT fk_tramos_tipo_tramo
        FOREIGN KEY (fk_tipo_tramo)
        REFERENCES tipos_tramo(pk_tipo_tramo),

    CONSTRAINT fk_tramos_provincia_inicial
        FOREIGN KEY (fk_provincia_inicial)
        REFERENCES provincias(pk_provincia),

    CONSTRAINT fk_tramos_provincia_final
        FOREIGN KEY (fk_provincia_final)
        REFERENCES provincias(pk_provincia),

    CONSTRAINT fk_tramos_tipo_terreno
        FOREIGN KEY (fk_tipo_terreno)
        REFERENCES tipo_terreno(pk_tipo_terreno),

    CONSTRAINT fk_tramos_entorno
        FOREIGN KEY (fk_entorno)
        REFERENCES entornos(pk_entorno)
) ENGINE = InnoDB;


-- =====================================================
-- 6. TABLE: OBSERVACIONES_CARRETERA
-- =====================================================


CREATE TABLE observaciones_carretera (
    pk_observacion INT AUTO_INCREMENT PRIMARY KEY,
    fk_carretera INT,
    observacion TEXT,

    CONSTRAINT fk_observaciones_carretera
        FOREIGN KEY (fk_carretera)
        REFERENCES carreteras(pk_carretera)
) ENGINE = InnoDB;


-- =====================================================
-- 7. TABLE: CONFLUENCIAS
-- =====================================================


CREATE TABLE confluencias (
    pk_confluencia INT AUTO_INCREMENT PRIMARY KEY,

    fk_tramo1 INT,
    km_tramo1 DECIMAL(10,2),

    fk_provincia INT,

    fk_tramo2 INT,
    km_tramo2 DECIMAL(10,2),

    CONSTRAINT fk_confluencias_tramo1
        FOREIGN KEY (fk_tramo1)
        REFERENCES tramos(pk_tramo),

    CONSTRAINT fk_confluencias_provincia
        FOREIGN KEY (fk_provincia)
        REFERENCES provincias(pk_provincia),

    CONSTRAINT fk_confluencias_tramo2
        FOREIGN KEY (fk_tramo2)
        REFERENCES tramos(pk_tramo)
) ENGINE = InnoDB;


-- =====================================================
-- 8. DATABASE VERIFICATION
-- =====================================================

SHOW TABLES;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'carreteras'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;

DESCRIBE carreteras;
DESCRIBE tramos;
DESCRIBE confluencias;

USE carreteras;

SHOW TABLES;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'carreteras'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;
