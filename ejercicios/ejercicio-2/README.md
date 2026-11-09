# Ejercicio 2 — Sistema de ventas (Sales System)

## Español

Este documento sigue el enunciado oficial de tres páginas **Ejercicios Modelo Entidad/Relación**, Ejercicio 2. La tarea consiste en modelar un sistema de ventas que gestione proveedores, clientes, productos y facturas.

### Requisitos del enunciado
- Un proveedor tiene CIF/NIF, nombre, dirección, teléfono y sitio web.
- Un cliente tiene CIF/NIF, nombre y dirección, y puede tener varios teléfonos de contacto.
- Una dirección consta de calle, número, ciudad y código postal.
- Un producto tiene un identificador único, nombre, precio actual, stock y un proveedor.
- Los productos se agrupan en categorías; cada producto pertenece a una sola categoría.
- Una categoría tiene identificador, nombre y descripción.
- Una factura registra número, fecha, cliente, descuento e importe final con IVA incluido.
- Para cada producto vendido se registra el precio aplicado en el momento de la venta, la cantidad y el importe total de la línea.

### Implementación SQL
- [Script de esquema MySQL](sql/schema.sql)

El script define proveedores y clientes identificados por CIF/NIF, una tabla independiente para los múltiples teléfonos de cada cliente, categorías, productos, facturas y líneas de detalle.

### Diseño relacional
| Tabla | Finalidad |
|---|---|
| `proveedor` | CIF/NIF, nombre, dirección, teléfono y web del proveedor |
| `cliente` | CIF/NIF, nombre y dirección del cliente |
| `cliente_telefono` | Varios teléfonos de contacto por cliente |
| `categoria` | Identificador, nombre y descripción de categoría |
| `producto` | Datos del producto y claves foráneas de proveedor y categoría |
| `factura` | Número y fecha de factura, cliente, descuento e importe final con IVA |
| `detalle_factura` | Productos de cada factura, precio de venta, cantidad e importe de línea |

El enunciado oficial **no** especifica una relación N:M directa entre facturas y proveedores, por lo que el esquema SQL actual no añade una tabla `factura_proveedor`. Cada producto referencia un proveedor y una categoría, tal como solicita el enunciado.

### Notas de implementación
El enunciado oficial no determina los tipos de datos SQL ni los nombres exactos de los identificadores. Son decisiones de implementación reflejadas en `schema.sql`. El script se ha ajustado al enunciado escrito, pero todavía no se ha ejecutado en un servidor MySQL.

## English

This note follows the official three-page assignment, **Ejercicios Modelo Entidad/Relación**, Exercise 2. The task is to model a sales system managing suppliers, customers, products and sales invoices.

### Requirements from the official statement
- A supplier has CIF/NIF, name, address, telephone and website.
- A customer has CIF/NIF, name and address, and may have multiple contact telephone numbers.
- An address consists of street, number, city and postal code.
- A product has a unique ID, name, current price, stock and one supplier.
- Products are grouped into categories; each product belongs to exactly one category.
- A category has an ID, name and description.
- An invoice records its number, date, customer, discount and final amount including VAT.
- For each product sold, the system records the sale-time price, quantity sold and total amount for that product line.

### SQL implementation
- [MySQL schema script](sql/schema.sql)

The script defines supplier and customer CIF/NIF identifiers, a separate table for a customer's multiple telephone numbers, categories, products, invoices and invoice detail lines.

### Relational design
| Table | Purpose |
|---|---|
| `proveedor` | Supplier CIF/NIF, name, address, telephone and website |
| `cliente` | Customer CIF/NIF, name and address |
| `cliente_telefono` | Multiple contact telephone numbers per customer |
| `categoria` | Category ID, name and description |
| `producto` | Product details plus supplier and category foreign keys |
| `factura` | Invoice number/date, customer, discount and final amount including VAT |
| `detalle_factura` | Products on each invoice, sale-time price, quantity and line total |

The official statement does **not** specify a direct N:M relationship between invoices and suppliers, so the current SQL schema does not add an extra `factura_proveedor` table. A product references one supplier and one category, as required by the prompt.

### Implementation notes
The official statement does not dictate SQL data types or exact identifier names. Those are implementation choices in `schema.sql`. The script has been aligned to the written statement, but has not yet been executed against a MySQL server.
