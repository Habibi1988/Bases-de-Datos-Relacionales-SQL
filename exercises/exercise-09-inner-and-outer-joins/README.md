# Ejercicio 9 — INNER JOIN y OUTER JOIN

[Español](#español) | [English](#english)

## Español

Esta carpeta contiene la práctica SQL del Ejercicio 9, centrada en consultas multitabla con las bases de datos `nomina` y `jardineria`.

### Temas

- Consultas multitabla con `INNER JOIN`
- Composición externa con `LEFT JOIN` y conceptos de `OUTER JOIN`
- Relación de registros mediante claves primarias y claves foráneas
- Identificación de registros sin correspondencia con `LEFT JOIN ... IS NULL`
- Autorrelaciones (`SELF JOIN`) para relacionar empleados con sus jefes
- Filtrado, ordenación y limitación de resultados
- Combinación de varias tablas para resolver consultas
- Uso de `NOT EXISTS` para excluir oficinas que cumplen determinadas condiciones
- Integridad referencial y restricciones de claves foráneas

### Secciones del ejercicio

#### 1. Base de datos Nómina

La primera parte practica las uniones entre empleados, departamentos y cargos. Incluye consultas para:

- Mostrar información de empleados, departamentos y salarios
- Consultar fechas de contratación y nombres de los cargos
- Filtrar por salario, departamento, estado civil y número de hijos
- Identificar al empleado más joven
- Calcular la antigüedad y la edad mediante funciones de fecha
- Ordenar los resultados por departamento y antigüedad
- Mostrar departamentos y cargos, incluidos los que no tienen empleados asociados
- Identificar departamentos sin empleados
- Comprender cómo las claves foráneas mantienen la integridad referencial

#### 2. Base de datos Jardinería

La segunda parte trabaja con clientes, representantes de ventas, oficinas, pedidos, detalles de pedidos, productos, gamas de productos y pagos.

Incluye consultas para:

- Listar clientes y sus representantes de ventas
- Encontrar clientes que han realizado pagos y clientes que no los han realizado
- Mostrar la ciudad de la oficina de cada representante de ventas
- Encontrar oficinas relacionadas con clientes de una ciudad determinada
- Mostrar empleados y sus jefes mediante una autorrelación
- Identificar pedidos entregados después de la fecha prevista
- Listar las gamas de productos compradas por cada cliente
- Encontrar clientes sin pagos o sin pedidos
- Encontrar empleados sin oficina o sin clientes asociados
- Identificar productos que nunca han aparecido en un pedido
- Encontrar oficinas en las que no trabaja ningún empleado que represente a un cliente que haya comprado un producto de la gama **Frutales**
- Encontrar clientes que han realizado pedidos pero no han efectuado pagos
- Listar empleados sin clientes asociados junto con sus jefes

### Archivos

- `ejercicio09.pdf` — Enunciado original del ejercicio.
- `scripts.sql` — Consultas SQL y respuestas del ejercicio.

### Bases de datos

- `nomina`
- `jardineria`

### Notas

Las consultas están escritas para MySQL. La consulta que solicita mostrar la imagen de los productos se ha adaptado a la estructura disponible de la tabla `producto`: el script devuelve el nombre y la descripción, ya que esta tabla no contiene una columna para la imagen.

---

## English

This folder contains the SQL practice for Exercise 9, focused on multi-table queries using the `nomina` and `jardineria` databases.

### Topics

- Multi-table queries with `INNER JOIN`
- Outer joins with `LEFT JOIN` and the concepts of `OUTER JOIN`
- Matching records through primary keys and foreign keys
- Finding unmatched records with `LEFT JOIN ... IS NULL`
- Self-joins to relate employees with their managers
- Filtering, sorting and limiting query results
- Combining multiple tables to answer database questions
- Using `NOT EXISTS` to exclude offices that meet specific conditions
- Referential integrity and foreign key constraints

### Exercise sections

#### 1. Nómina database

The first section practises joins between employees, departments and job positions. It includes queries to:

- Display employee, department and salary information
- Retrieve contract dates and job titles
- Filter by salary, department, marital status and number of children
- Identify the youngest employee
- Calculate years of service and age using date functions
- Sort results by department and years of service
- List departments and job positions, including those without associated employees
- Identify departments without employees
- Understand how foreign keys maintain referential integrity

#### 2. Jardinería database

The second section works with customers, sales representatives, offices, orders, order details, products, product ranges and payments.

It includes queries to:

- List customers and their sales representatives
- Find customers who have made payments and customers who have not
- Display the office city of each sales representative
- Find offices associated with customers in a specific city
- Display employees and their managers using a self-join
- Identify orders delivered later than the expected date
- List the product ranges purchased by each customer
- Find customers without payments or without orders
- Find employees without an office or without associated customers
- Identify products that have never appeared in an order
- Find offices where no employee represents a customer who purchased a product from the **Frutales** range
- Find customers who have placed orders but have not made payments
- List employees without associated customers together with their managers

### Files

- `ejercicio09.pdf` — Original exercise instructions.
- `scripts.sql` — SQL queries and answers for the exercise.

### Databases

- `nomina`
- `jardineria`

### Notes

The queries are written for MySQL. The query requesting product images has been adapted to the available structure of the `producto` table: the script returns the product name and description because the table does not contain an image column.
