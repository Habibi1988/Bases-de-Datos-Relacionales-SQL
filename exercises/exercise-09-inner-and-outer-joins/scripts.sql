-- Ejercicio 9. Consultas Multitabla
-- Utilizando la Base de Datos Nómina:
-- Composición interna (INNER JOIN)

USE nomina;

-- 1. Lista el nombre y apellido de los empleados, su sueldo y el nombre del
-- departamento donde trabaja.

SELECT 
    e.nombre,
    e.apellido,
    e.sueldo,
    d.departamento
FROM departamento AS d
INNER JOIN empleado AS e
    ON e.fk_departamento = d.pk_departamento;

-- 2. Lista el nombre y apellido de los empleados, su fecha de contrato y el nombre del cargo.

SELECT
    e.nombre,
    e.apellido,
    e.fecha_contrato,
    c.cargo
FROM cargo AS c
INNER JOIN empleado AS e
    ON e.fk_cargo = c.pk_cargo;

-- 3. Ordena el resultado por la fecha de contrato.

SELECT
    e.nombre,
    e.apellido,
    e.fecha_contrato,
    c.cargo
FROM cargo AS c
INNER JOIN empleado AS e
    ON e.fk_cargo = c.pk_cargo
ORDER BY e.fecha_contrato ASC;

-- 4. Lista el código del empleado, su nombre y apellido, el código del departameto y el
-- nombre del departamento de los empleados que ganen más de 2000€.

SELECT 
    e.pk_empleado,
    e.nombre,
    e.apellido,
    d.pk_departamento,
    d.departamento
FROM empleado AS e
INNER JOIN departamento AS d
    ON d.pk_departamento = e.fk_departamento
WHERE e.sueldo > 2000;


-- 5. Indica el nombre, apellido y nombre del cargo del empleado más joven.

SELECT 
    e.nombre,
    e.apellido,
    c.cargo
FROM empleado AS e
INNER JOIN cargo AS c
    ON c.pk_cargo = e.fk_cargo
ORDER BY e.fecha_nacimiento DESC 
LIMIT 1;

-- 6. Indica el nombre, apellido y nombre del departamento de los empleados que tengan hijos.

SELECT 
    e.nombre,
    e.apellido,
    d.departamento
FROM empleado AS e
INNER JOIN departamento AS d
    ON e.fk_departamento = d.pk_departamento
WHERE e.hijos > 0;

-- 7. Lista todos los datos de los empleados de Contabilidad.

SELECT 
    e.*,
    d.departamento
FROM empleado AS e
INNER JOIN departamento AS d
    ON d.pk_departamento = e.fk_departamento
WHERE d.departamento = 'Contabilidad';


-- 8. Lista el nombre y apellido del empleado, el nombre del cargo y el del
-- departamento de los empleados solteros sin hijos

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


-- 9. Lista los empleados de los departamentos de Compras y Ventas sin utilizar el operador IN.

SELECT 
    e.nombre,
    e.apellido,
    d.departamento
FROM departamento AS d
INNER JOIN empleado AS e
    ON d.pk_departamento = e.fk_departamento
WHERE departamento = 'Compras' 
OR departamento = 'Ventas';

-- 10.Lista los empleados de los departamentos de Compras y Ventas utilizando el operador IN.

SELECT 
    e.nombre,
    e.apellido,
    d.departamento
FROM departamento AS d
INNER JOIN empleado AS e
    ON d.pk_departamento = e.fk_departamento
WHERE departamento IN('Compras', 'Ventas');

-- 11. Lista el nombre y apellido del empleado, el nombre del cargo y del departamento
-- de aquellas personas que tienen más de 20 años en la empresa. Ordena el
-- resultado en primer lugar por el departamento (en orden ascendente) y en
-- segundo lugar por el tiempo trabajado (en orden descendente)

SELECT 
    e.nombre,
    e.apellido,
    c.cargo,
    d.departamento,
    TIMESTAMPDIFF(YEAR, e.fecha_contrato, CURDATE()) AS years_service
FROM empleado AS e
INNER JOIN cargo AS c
    ON c.pk_cargo = e.fk_cargo
INNER JOIN departamento AS d
    ON d.pk_departamento = e.fk_departamento
WHERE TIMESTAMPDIFF(YEAR, e.fecha_contrato, CURDATE()) > 20
ORDER BY d.departamento ASC, years_service DESC;


-- 12. Lista nombre y apellido, edad, nombre del cargo, nombre del departamento de los
-- empleados Solteros, Divorciados o Viudos que tengan más de un hijo.

SELECT 
    e.nombre,
    e.apellido,
    d.departamento,
    c.cargo,
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM empleado AS e
INNER JOIN departamento AS d
    ON d.pk_departamento = e.fk_departamento
INNER JOIN cargo AS c
    ON c.pk_cargo = e.fk_cargo
WHERE e.estado_civil IN ('Soltero', 'Divorciado', 'Viudo') 
AND e.hijos > 1;

-- Composición externa ( LEFT JOIN, RIGHT JOIN )

-- 13. Lista todos departamentos registrados que existen en la base de datos, junto con
-- el código, nombre y apellido del empleado que tiene cada uno de ellos. El listado
-- deberá mostrar también aquellos departamentos que no tienen empleados asociados.
SELECT 
    d.departamento,
    d.pk_departamento,
    e.pk_empleado,
    e.nombre,
    e.apellido
FROM departamento AS d
LEFT JOIN empleado AS e
    ON d.pk_departamento = e.fk_departamento;


-- 14. Lista todos cargos registrados que existen en la base de datos, junto con el
-- nombre y apellido del empleado, la edad y estado civil que tiene cada empleado.
-- El listado deberá mostrar también aquellos cargos que no tienen empleados asociados.

SELECT 
    c.*,
    e.nombre,
    e.apellido,
    TIMESTAMPDIFF(Year, e.fecha_nacimiento, CURDATE()) AS edad,
    e.estado_civil
FROM cargo AS c
LEFT JOIN empleado AS e
    ON c.pk_cargo = e.fk_cargo;

-- 15. Lista los departamentos sin empleados asociados.

SELECT 
    d.departamento
FROM departamento AS d
LEFT JOIN empleado AS e
    ON d.pk_departamento = e.fk_departamento
WHERE e.pk_empleado IS NULL;

-- 16. ¿Se puede asignar a un empleado un cargo que no esté registrado en la tabla de
-- cargos? Justifica tu respuesta.

--  Respuesta: No, porque el campo `fk_cargo` de la tabla `empleado` es una clave foránea que referencia la 
-- clave primaria `pk_cargo` de la tabla `cargo`. Por tanto, se garantiza la integridad 
-- referencial y no se puede asignar a un empleado un cargo que no esté registrado en la tabla `cargo`.

USE jardineria;

-- Utilizando la Base de Datos Jardinería:
-- Composición interna (INNER JOIN)

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
-- representante de ventas.

SELECT 
    c.nombre_cliente,
    e.nombre,
    e.apellido1
FROM cliente AS c
INNER JOIN empleado AS e
    ON e.pk_empleado = c.fk_representante_ventas;


-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre
-- de sus representantes de ventas.

SELECT 
    c.nombre_cliente,
    e.nombre,
    p.forma_pago
FROM cliente AS c
INNER JOIN empleado AS e
    ON e.pk_empleado = c.fk_representante_ventas
INNER JOIN pago AS p
    ON p.fk_cliente = c.pk_cliente;

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el
-- nombre de sus representantes de ventas.

SELECT 
    c.nombre_cliente,
    e.nombre,
    p.forma_pago
FROM cliente AS c
INNER JOIN empleado AS e
    ON e.pk_empleado = c.fk_representante_ventas
LEFT JOIN pago AS p
    ON p.fk_cliente = c.pk_cliente
WHERE p.fk_cliente IS NULL;

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

SELECT 
    c.nombre_cliente,
    e.nombre,
    o.ciudad,
    p.forma_pago
FROM cliente AS c
INNER JOIN empleado AS e
    ON c.fk_representante_ventas = e.pk_empleado
INNER JOIN oficina AS o
    ON o.pk_oficina = e.fk_oficina
INNER JOIN pago AS p
    ON c.pk_cliente = p.fk_cliente;

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT 
    c.nombre_cliente,
    e.nombre,
    o.ciudad
FROM cliente AS c
INNER JOIN empleado AS e
    ON e.pk_empleado = c.fk_representante_ventas
INNER JOIN oficina AS o
    ON o.pk_oficina = e.fk_oficina
LEFT JOIN pago AS p
    ON p.fk_cliente = c.pk_cliente
WHERE p.fk_cliente IS NULL;

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT
    c.ciudad,
    o.linea_direccion1,
    o.linea_direccion2,
    c.nombre_cliente,
    o.ciudad
FROM oficina AS o
INNER JOIN empleado AS e
    ON o.pk_oficina = e.fk_oficina
INNER JOIN cliente AS c
    ON c.fk_representante_ventas = e.pk_empleado
WHERE c.ciudad = 'Fuenlabrada';



-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la
-- ciudad de la oficina a la que pertenece el representante.

SELECT 
    c.nombre_cliente,
    e.nombre,
    o.ciudad
FROM empleado AS e
INNER JOIN cliente AS c
    ON c.fk_representante_ventas = e.pk_empleado
INNER JOIN oficina AS o

    ON o.pk_oficina = e.fk_oficina;
 
-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT 
    e.nombre AS empleado,
    j.nombre AS jefe
FROM empleado AS e
LEFT JOIN empleado AS j
    ON e.fk_jefe = j.pk_empleado;


-- 9. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

SELECT 
    c.nombre_cliente
FROM cliente AS c
INNER JOIN pedido AS p
    ON p.fk_cliente = c.pk_cliente
WHERE p.fecha_entrega > p.fecha_esperada;

-- 10.Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT DISTINCT
    c.nombre_cliente,
    g.gama
FROM cliente AS c
INNER JOIN pedido AS pe
    ON c.pk_cliente = pe.fk_cliente
INNER JOIN detalle_pedido AS de
    ON pe.pk_pedido = de.fk_pedido
INNER JOIN producto AS p
    ON p.pk_producto = de.fk_producto
INNER JOIN gama_producto AS g
    ON p.fk_gama = g.pk_gama;

-- Composición externa ( LEFT JOIN, RIGHT JOIN )

-- 11. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT 
    c.nombre_cliente
FROM cliente AS c
LEFT JOIN pago AS p
    ON p.fk_cliente = c.pk_cliente
WHERE p.fk_cliente IS NULL;


-- 12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

SELECT
    c.nombre_cliente
FROM cliente AS c
LEFT JOIN pedido AS p
    ON p.fk_cliente = c.pk_cliente
WHERE p.fk_cliente IS NULL;


-- 13. Devuelve un listado que muestre los clientes que no han realizado ningún pago y
-- los que no han realizado ningún pedido.

SELECT 
    c.nombre_cliente
FROM cliente AS c
LEFT JOIN pago AS PA
    ON PA.fk_cliente = C.pk_cliente
LEFT JOIN pedido AS pe
    ON pe.fk_cliente = c.pk_cliente
WHERE pe.fk_cliente IS NULL
AND pa.fk_cliente IS NULL;

-- 14.Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

SELECT 
    e.nombre
FROM empleado AS e
LEFT JOIN oficina AS o
    ON o.pk_oficina = e.fk_oficina
WHERE o.pk_oficina IS NULL;

-- 15.Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

SELECT 
    e.nombre
FROM empleado AS e
LEFT JOIN cliente AS c
    ON e.pk_empleado = c.fk_representante_ventas
WHERE c.fk_representante_ventas IS NULL;

-- 16. Devuelve un listado que muestre solamente los empleados que no tienen un
-- cliente asociado junto con los datos de la oficina donde trabajan.

SELECT 
    e.nombre,
    o.*
FROM empleado AS e
LEFT JOIN cliente AS c
    ON c.fk_representante_ventas = e.pk_empleado
LEFT JOIN oficina AS o
    ON o.pk_oficina = e.fk_oficina
WHERE c.pk_cliente IS NULL;


-- 17. Devuelve un listado que muestre los empleados que no tienen una oficina
-- asociada y los que no tienen un cliente asociado.

SELECT 
    e.nombre
FROM empleado AS e
LEFT JOIN oficina AS o
    ON e.fk_oficina = o.pk_oficina
LEFT JOIN cliente AS c
    ON c.fk_representante_ventas = e.pk_empleado
WHERE o.pk_oficina IS NULL 
OR c.pk_cliente IS NULL;

-- 18.Devuelve un listado de los productos que nunca han aparecido en un pedido.

SELECT
    p.nombre
FROM producto AS p
LEFT JOIN detalle_pedido AS d
    ON p.pk_producto = d.fk_producto

WHERE d.fk_producto IS NULL;

-- 19. Devuelve un listado de los productos que nunca han aparecido en un pedido.
-- El resultado debe mostrar el nombre, la descripción y la imagen del producto

DESCRIBE producto;
SELECT 
    p.nombre,
    p.descripcion
FROM producto AS p
LEFT JOIN detalle_pedido AS d
    ON d.fk_producto = p.pk_producto
WHERE d.fk_producto IS NULL;


-- 20.Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido
-- los representantes de ventas de algún cliente que haya realizado la compra de
-- algún producto de la gama Frutales

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

















