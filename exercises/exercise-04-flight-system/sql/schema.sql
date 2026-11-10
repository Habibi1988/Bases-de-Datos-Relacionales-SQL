
-- =====================================================
-- EXERCISE 4: SISTEMA DE VUELOS
-- IFCD47 - Programacion con SQL y Bases de Datos Relacionales
-- Database structure
-- =====================================================


-- 1. DATABASE CREATION

DROP DATABASE IF EXISTS vuelos;

CREATE DATABASE vuelos
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE vuelos;


-- =====================================================
-- 2. TABLE: AEROPUERTOS
-- =====================================================

CREATE TABLE aeropuertos (
    codigo_aeropuerto VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
) ENGINE = InnoDB;


-- =====================================================
-- 3. TABLE: MODELOS_AVION
-- =====================================================

CREATE TABLE modelos_avion (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
) ENGINE = InnoDB;


-- =====================================================
-- 4. TABLE: AEROPUERTOS_MODELOS
-- An airport can accommodate several aircraft models.
-- A model can be accommodated at several airports.
-- =====================================================

CREATE TABLE aeropuertos_modelos (
    codigo_aeropuerto VARCHAR(10) NOT NULL,
    id_modelo INT NOT NULL,

    PRIMARY KEY (codigo_aeropuerto, id_modelo),

    CONSTRAINT fk_aeropuertos_modelos_aeropuerto
        FOREIGN KEY (codigo_aeropuerto)
        REFERENCES aeropuertos(codigo_aeropuerto),

    CONSTRAINT fk_aeropuertos_modelos_modelo
        FOREIGN KEY (id_modelo)
        REFERENCES modelos_avion(id_modelo)
) ENGINE = InnoDB;


-- =====================================================
-- 5. TABLE: PROGRAMAS_VUELO
-- Flight numbers are unique worldwide.
-- =====================================================

CREATE TABLE programas_vuelo (
    numero_vuelo INT PRIMARY KEY,
    linea_aerea VARCHAR(100) NOT NULL,
    dias_semana VARCHAR(100) NOT NULL,

    codigo_aeropuerto_salida VARCHAR(10) NOT NULL,
    codigo_aeropuerto_llegada VARCHAR(10) NOT NULL,

    CONSTRAINT fk_programa_aeropuerto_salida
        FOREIGN KEY (codigo_aeropuerto_salida)
        REFERENCES aeropuertos(codigo_aeropuerto),

    CONSTRAINT fk_programa_aeropuerto_llegada
        FOREIGN KEY (codigo_aeropuerto_llegada)
        REFERENCES aeropuertos(codigo_aeropuerto)
) ENGINE = InnoDB;


-- =====================================================
-- 6. TABLE: VUELOS
-- Each actual flight belongs to a flight programme.
-- =====================================================

CREATE TABLE vuelos (
    id_vuelo INT AUTO_INCREMENT PRIMARY KEY,

    numero_vuelo INT NOT NULL,
    fecha DATE NOT NULL,
    plazas_vacias INT NOT NULL,

    id_modelo INT NOT NULL,

    CONSTRAINT fk_vuelo_programa
        FOREIGN KEY (numero_vuelo)
        REFERENCES programas_vuelo(numero_vuelo),

    CONSTRAINT fk_vuelo_modelo
        FOREIGN KEY (id_modelo)
        REFERENCES modelos_avion(id_modelo)
) ENGINE = InnoDB;


-- =====================================================
-- 7. TABLE: ESCALAS_TECNICAS
-- Technical stops are ordered for each actual flight.
-- =====================================================

CREATE TABLE escalas_tecnicas (
    id_vuelo INT NOT NULL,
    numero_orden INT NOT NULL,
    codigo_aeropuerto VARCHAR(10) NOT NULL,

    PRIMARY KEY (id_vuelo, numero_orden),

    CONSTRAINT fk_escala_vuelo
        FOREIGN KEY (id_vuelo)
        REFERENCES vuelos(id_vuelo),

    CONSTRAINT fk_escala_aeropuerto
        FOREIGN KEY (codigo_aeropuerto)
        REFERENCES aeropuertos(codigo_aeropuerto)
) ENGINE = InnoDB;


-- =====================================================
-- 8. VERIFY TABLES
-- =====================================================

SHOW TABLES;
