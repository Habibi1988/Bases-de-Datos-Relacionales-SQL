# Ejercicio 1 — Artículos y encargos (Articles and Orders)

## Español

Este documento sigue el enunciado oficial de tres páginas **Ejercicios Modelo Entidad/Relación**, Ejercicio 1. Se solicita un modelo E/R para gestionar clientes, artículos, encargos y fábricas.

### Requisitos del enunciado
- Cada cliente tiene un número de cliente único, varias direcciones de entrega, saldo, límite de crédito y descuento.
- El límite de crédito de un cliente no puede superar **3.000.000 €**.
- Cada artículo tiene un número único, descripción y relación con las fábricas que lo distribuyen.
- Se registra el stock de cada artículo en cada fábrica.
- Cada encargo tiene una cabecera con el cliente, la dirección de entrega seleccionada y la fecha y hora del encargo.
- El cuerpo del encargo contiene varias líneas, cada una con un artículo y una cantidad.
- Cada fábrica tiene un número único y un teléfono de contacto.
- Debe poder obtenerse el número total de tipos de artículos suministrados por una fábrica.
- El enunciado también propone almacenar opcionalmente fábricas alternativas por motivos estratégicos.
- Una dirección consta de calle, número, ciudad y código postal.

### Implementación SQL
- [Script de esquema MySQL](schema.sql)

El script incluye claves primarias y foráneas, una restricción CHECK para el límite de crédito de 3.000.000 €, stock por pareja fábrica/artículo, tablas de cabecera y detalle de encargos, y una relación opcional autorreferenciada para fábricas alternativas.

### Decisiones del modelo relacional
| Tabla | Finalidad |
|---|---|
| `cliente` | Número de cliente, saldo, límite de crédito y descuento |
| `direccion_envio` | Varias direcciones de entrega asociadas a un cliente |
| `articulo` | Número único y descripción del artículo |
| `fabrica` | Número de fábrica y teléfono de contacto |
| `fabrica_articulo` | Relación N:M entre fábrica y artículo, con stock por pareja |
| `fabrica_alternativa` | Relación opcional entre fábricas alternativas |
| `pedido` | Cabecera del encargo con cliente, dirección y fecha/hora |
| `detalle_pedido` | Líneas del encargo con artículo y cantidad |

El número total de tipos de artículos suministrados por una fábrica puede calcularse a partir de `fabrica_articulo`; no se almacena de forma redundante.

### Notas de implementación
El enunciado oficial define los requisitos de negocio, pero no impone tipos SQL ni nombres exactos de identificadores. Esas decisiones se han tomado durante la implementación en `schema.sql`. El script se ha alineado con el enunciado escrito, pero todavía no se ha ejecutado en un servidor MySQL.

## English

This note follows the official three-page assignment, **Ejercicios Modelo Entidad/Relación**, Exercise 1. The task is to design an E/R model for customers, articles, orders and factories.

### Requirements from the official statement
- Each customer has a unique customer number, multiple shipping addresses, balance, credit limit and discount.
- A customer's credit limit must not exceed **€3,000,000**.
- Each article has a unique article number, description and relationships to the factories distributing it.
- Stock is recorded for each article at each factory.
- Each order has a header with the customer, selected shipping address, and order date and time.
- The order body contains multiple lines, each identifying an article and quantity.
- Each factory has a unique factory number and contact telephone.
- The total number of article types supplied by a factory should be obtainable.
- The statement also proposes optionally storing alternative factories for strategic purposes.
- An address consists of street, number, city and postal code.

### SQL implementation
- [MySQL schema script](schema.sql)

The script includes primary and foreign keys, a CHECK constraint for the €3,000,000 credit limit, stock by factory/article pair, order header/detail tables and an optional self-referencing alternative-factory relationship.

### Relational design choices
| Table | Purpose |
|---|---|
| `cliente` | Customer number, balance, credit limit and discount |
| `direccion_envio` | Multiple shipping addresses associated with a customer |
| `articulo` | Unique article number and description |
| `fabrica` | Factory number and contact telephone |
| `fabrica_articulo` | N:M factory/article relationship plus stock per pair |
| `fabrica_alternativa` | Optional factory-to-factory alternative relationship |
| `pedido` | Order header with customer, address and date/time |
| `detalle_pedido` | Order lines with article and quantity |

The total number of article types supplied by a factory can be calculated from `fabrica_articulo`; it is not stored redundantly.

### Implementation notes
The official statement specifies business requirements but does not dictate SQL data types or exact identifier names. Those are implementation choices in `schema.sql`. The script has been aligned to the written statement, but has not yet been executed against a MySQL server.
