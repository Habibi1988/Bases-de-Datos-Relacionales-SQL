# Exercise 2 – Sales System (Sistema de Ventas)

## Objective
Design and implement a relational database for a sales system using MySQL 8.4. The database stores customers, their contact telephone numbers, suppliers, product categories, products, invoices and the products included in each invoice.

## Database
- Database name: `ventas`
- DBMS: MySQL 8.4
- SQL scripts: `sql/`

## Relational structure

| Table | Purpose | Primary key |
|---|---|---|
| `clientes` | Customer details and address | `cif_nif` |
| `telefonos_clientes` | Customer telephone numbers | `telefono` |
| `proveedores` | Supplier details | `cif_nif` |
| `categorias` | Product categories | `id_categoria` |
| `productos` | Products, stock, current price, supplier and category | `id_productos` |
| `facturas` | Invoice header and customer | `numero_factura` |
| `facturas_productos` | Products and sale details for each invoice | Composite: `numero_factura`, `id_producto` |

## Main relationships

- One customer can have multiple telephone numbers.
- One customer can have multiple invoices; each invoice belongs to one customer.
- One supplier can supply multiple products; each product references one supplier.
- One category can contain multiple products; each product references one category.
- An invoice can contain multiple products, and a product can appear on multiple invoices. The junction table `facturas_productos` stores quantity, sale-time price and VAT for each invoice/product pair.

## SQL files

- [`schema.sql`](sql/schema.sql): creates the `ventas` database and its seven tables, including primary keys, foreign keys and required-field constraints.
- [`sample_data.sql`](sql/sample_data.sql): inserts example records into the seven tables.

## How to run

Run these scripts in MySQL Workbench in this order, on a **new or empty** database:

1. Open and execute `sql/schema.sql`.
2. Open and execute `sql/sample_data.sql`.

**Important:** The sample-data script is intended to be run once. Running it again against the same populated database can produce duplicate-primary-key errors. Do not drop or recreate an existing database just to rerun the sample data.

## Modelling note

The implementation follows the professor's Access diagram selected for this exercise. Two details in the written brief are not represented as attributes in that diagram: the supplier's street name and a separate line-total amount for each invoice product. They have therefore not been added to this schema. Confirm with the instructor if the written brief takes precedence over the diagram.

## Scope

This exercise documents the relational design and its MySQL implementation. The example records are demonstration data, not real customer or supplier information.
