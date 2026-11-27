-- Ejercicio 10. Vistas, creación de tablas y variables de sesión

-- o Create New Table From Existing Table

-- Usando la Base de Datos jardineria:

USE jardineria;

-- 1. Crea una vista llamada pedidos_no_entregados que muestre para cada uno de
-- los pedidos de la Base de Datos de jardinería, el código del pedido, la fecha del
-- pedido, el nombre completo del cliente que lo realizó y su estado para aquellos
-- pedidos que no hayan sido entregados. Ordenala por estado.


CREATE VIEW pedidos_no_entregados AS
SELECT 
    pe.pk_pedido,
    pe.fecha_pedido,
    pe.estado,
    c.nombre_cliente,
    c.apellido_contacto
FROM pedido AS pe
INNER JOIN cliente AS c
    ON pe.fk_cliente = c.pk_cliente
WHERE pe.estado <> 'Entregado'
ORDER BY pe.estado;

SELECT *
FROM pedidos_no_entregados;

-- 2. Crea una vista que se llame listado_pagos_clientes que muestre un listado
-- donde aparezcan todos los clientes y los pagos que ha realizado cada uno de
-- ellos. La vista deberá tener las siguientes columnas: nombre y apellidos del cliente
-- concatenados, teléfono, ciudad, pais, fecha_pago, total del pago e id de la
-- transacción.

CREATE VIEW listado_pagos_clientes AS
SELECT 
    CONCAT(c.nombre_contacto, ' ', c.apellido_contacto) AS nombre_completo,
    c.telefono,
    c.ciudad,
    c.pais,
    pa.fecha_pago,
    pa.total,
    pa.id_transaccion
FROM cliente AS c
INNER JOIN pago AS pa
    ON pa.fk_cliente = c.pk_cliente;


SELECT *
FROM listado_pagos_clientes;

-- 3. Crea una vista que se llame listado_pedidos_clientes que muestre un listado
-- donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de
-- ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y
-- apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido,
-- fecha del pedido, fecha esperada y fecha de entrega.

CREATE VIEW listado_pedidos_clientes AS 
SELECT 
    c.pk_cliente,
    CONCAT(c.nombre_contacto, ' ', c.apellido_contacto) AS nombre_apellido,
    c.telefono,
    c.ciudad,
    c.pais,
    p.pk_pedido,
    p.fecha_pedido,
    p.fecha_esperada,
    p.fecha_entrega
FROM cliente AS c
INNER JOIN pedido AS p
    ON p.fk_cliente = c.pk_cliente;

SELECT *
FROM listado_pedidos_clientes;

-- 4. Crea una variable de sesión denominada @ciudad. Utiliza la vista que ha creado
-- en el punto 2, para crear una consulta que muestre el listado de los clientes de la
-- ciudad de Madrid que han realizado pagos.

SET @ciudad = 'Madrid';

SELECT *
FROM listado_pagos_clientes
WHERE ciudad = @ciudad;



-- 5. Cambia el valor de la variable @ciudad a Miami y repite la operación anterior.

SET @ciudad = 'Miami';

SELECT *
FROM listado_pagos_clientes
WHERE ciudad = @ciudad;

-- 6. Crea ocho vistas basadas en las consultas realizadas en el Ejercicio 9 (Consultas
-- Multitabla), cuatro de ellas con los ejercicios que hayas considerado más difíciles
-- de la Base de Datos de nómina y cuatro con los ejercicios que hayas considerado
-- más difíciles de la Base de Datos de jardinería.

USE nomina;
CREATE VIEW listado_empleados_con_hijos AS

SELECT 
    e.nombre,
    e.apellido,
    d.departamento
FROM empleado AS e
INNER JOIN departamento AS d
    ON e.fk_departamento = d.pk_departamento
WHERE e.hijos > 0;

SELECT *
FROM listado_empleados_con_hijos;

CREATE VIEW listado_empleados_contabilidad AS 

SELECT 
    e.*,
    d.departamento
FROM empleado AS e
INNER JOIN departamento AS d
    ON d.pk_departamento = e.fk_departamento
WHERE d.departamento = 'Contabilidad';

SELECT *
FROM listado_empleados_contabilidad;

CREATE VIEW listado_empleados_solteros_sin_hijos AS
SELECT 
    e.nombre,
    e.apellido,
    c.cargo,
    d.departamento
FROM empleado AS e
INNER JOIN cargo AS c
    ON c.pk_cargo = e.fk_cargo
INNER JOIN departamento AS d
    ON d.pk_departamento = e.fk_departamento 
WHERE e.estado_civil = 'Soltero'
    AND e.hijos = 0;

SELECT *
FROM listado_empleados_solteros_sin_hijos;

CREATE VIEW listado_empleados_compras_ventas AS 
SELECT 
    e.nombre,
    e.apellido,
    d.departamento
FROM departamento AS d
INNER JOIN empleado AS e
    ON d.pk_departamento = e.fk_departamento
WHERE departamento = 'Compras' 
OR departamento = 'Ventas';

SELECT *
FROM listado_empleados_compras_ventas;

USE jardineria;
CREATE VIEW listado_empleados_sin_oficina_o_cliente AS 
SELECT 
    e.nombre
FROM empleado AS e
LEFT JOIN oficina AS o
    ON e.fk_oficina = o.pk_oficina
LEFT JOIN cliente AS c
    ON c.fk_representante_ventas = e.pk_empleado
WHERE o.pk_oficina IS NULL 
OR c.pk_cliente IS NULL; 

SELECT *
FROM listado_empleados_sin_oficina_o_cliente;

CREATE VIEW listado_oficinas_sin_representantes_frutales AS 
SELECT 
    o.*
FROM oficina AS o
WHERE NOT EXISTS(
    SELECT 1
    FROM empleado AS e
INNER JOIN cliente AS c
    ON e.pk_empleado = c.fk_representante_ventas
INNER JOIN pedido AS pe
    ON pe.fk_cliente = c.pk_cliente
INNER JOIN detalle_pedido AS de
    ON de.fk_pedido = pe.pk_pedido
INNER JOIN producto AS p
    ON p.pk_producto = de.fk_producto
INNER JOIN gama_producto AS g
    ON p.fk_gama = g.pk_gama
WHERE e.fk_oficina = o.pk_oficina
    AND g.gama = 'Frutales'
);


SELECT *
FROM listado_oficinas_sin_representantes_frutales;

CREATE VIEW listado_clientes_con_pedidos_sin_pagos AS
SELECT 
    c.nombre_cliente
FROM cliente AS c
LEFT JOIN pago AS p
    ON c.pk_cliente = p.fk_cliente
INNER JOIN pedido AS pe
    ON pe.fk_cliente = c.pk_cliente
WHERE p.fk_cliente IS NULL;

SELECT *
FROM listado_oficinas_sin_representantes_frutales;

CREATE VIEW listado_empleados_sin_clientes_y_jefes AS 
SELECT 
    e.nombre AS empleado,
    j.nombre AS jefe
FROM empleado AS e
LEFT JOIN empleado AS j
    ON e.fk_jefe = j.pk_empleado
LEFT JOIN cliente AS c
    ON c.fk_representante_ventas = e.pk_empleado
WHERE c.pk_cliente IS NULL;

SELECT *
FROM listado_oficinas_sin_representantes_frutales;

SHOW FULL TABLES
WHERE table_type = 'VIEW';

USE nomina;

SHOW FULL TABLES
WHERE table_type = 'VIEW';

-- 7. Elimina la vista listado_pedidos_clientes de la Base de Datos jardineria
USE jardineria;
DROP VIEW listado_pedidos_clientes;

-- 8. Crea una nueva tabla con el resultado de la vista que te haya resultado más
-- sencilla del Ejercicio 9 (Consultas Multitabla).

USE nomina;
SHOW FULL TABLES
WHERE table_type = 'VIEW';


CREATE TABLE empleados_con_hijos AS
SELECT *
FROM listado_empleados_con_hijos;

SELECT *
FROM empleados_con_hijos;

DESCRIBE empleados_con_hijos;
