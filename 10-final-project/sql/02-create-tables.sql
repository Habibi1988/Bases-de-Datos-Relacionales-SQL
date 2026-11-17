-- =====================================================
-- Project: Omnichannel Fashion Retail Database
-- DBMS: MySQL Community Server 8.4.13 LTS
-- File: 02-create-tables.sql
-- Purpose: Create the 15 tables from the approved relational model.
--
-- Implementation status: IN PROGRESS
-- Tables are created in dependency order.
-- Primary keys and essential foreign keys are defined with each table.
-- CHECK constraints and additional business rules will be added in
-- 03-add-constraints.sql.
-- =====================================================

USE tienda_moda_omnicanal;

-- =====================================================
-- 1. CATEGORIAS
-- Stores the main product categories.
-- =====================================================

CREATE TABLE CATEGORIAS (
    pk_categoria INT NOT NULL AUTO_INCREMENT,
    nombre_categoria VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255),

    CONSTRAINT pk_categorias
        PRIMARY KEY (pk_categoria),

    CONSTRAINT uq_categorias_nombre
        UNIQUE (nombre_categoria)
) ENGINE = InnoDB;
