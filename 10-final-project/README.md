# Final Project — Omnichannel Fashion Retail Database

## Project identity

**Diseño e Implementación de una Base de Datos para la Gestión Omnicanal de Productos, Inventario y Ventas de una Tienda de Moda**

A portfolio database project inspired by the omnichannel retail business model of UNIQLO. This is an independent educational design; it is not UNIQLO's official database, internal schema, or a claim about its systems.

## Business scope and approved rules

- Product specializations: ROPA, CALZADO, COMPLEMENTOS.
- ISA specialization: **Total y Disjunta** — every product belongs to exactly one of the three subtypes.
- Product audiences are separate from product types: Hombre, Mujer, Unisex, Infantil.
- Products can target multiple audiences through PRODUCTO_PUBLICO.
- Each product has one or more variants; each variant belongs to exactly one product and has a unique SKU.
- Variant size (talla) and color may be NULL when not applicable.
- Inventory is tracked by variant and physical store.
- Each variant/store pair has one inventory record.
- In-store sales may have no identified customer.
- Every sale is associated with one physical store.
- Online orders are fulfilled by one physical store.
- A sale has one or more detail lines and at most one payment record.

## Approved logical model

The approved relational model contains **15 tables**:
CATEGORIAS, SUBCATEGORIAS, PRODUCTOS, ROPA, CALZADO, COMPLEMENTOS, VARIANTES_PRODUCTO, PUBLICOS_OBJETIVO, PRODUCTO_PUBLICO, SUCURSALES, INVENTARIO, CLIENTES, VENTAS, DETALLE_VENTA, PAGOS.

## Design artefacts

### Conceptual model
- [Current E/R diagram — SVG](er-diagram/Diagrama-ER-UNIQLO.svg)

### Logical model
- [Relational model — SVG diagram](relational-model/Modelo-Relacional-UNIQLO.svg)
- [Relational model — full specification (Markdown)](relational-model/Modelo-Relacional-UNIQLO.md)

### Normalization
- [Normalization diagram — SVG](documentation/Normalizacion-UNIQLO.svg)
- [Normalization analysis — full report (Markdown)](documentation/Normalizacion-UNIQLO.md)

## Course scope and status

The current work covers conceptual and logical database design. SQL implementation, sample data, queries, views, triggers, stored procedures, events, and permissions are later stages and are not presented as completed.

| Area | Status |
|---|---|
| Business scope and rules | Approved |
| E/R conceptual model | Approved; current SVG diagram published |
| Relational model (15 tables) | Approved; diagram and specification published |
| 1FN, 2FN, 3FN analysis | Documented; final validation follows MySQL implementation |
| MySQL DDL and constraints | Planned |
| Sample data and SQL queries | Planned |
| Views, triggers, routines, events and security | Planned |

## Course
- Programació amb SQL i bases de dades relacionals (IFCD47)
- CIFO La Violeta, Barcelona

## Historical files
Earlier generic omnichannel-retail report and diagram files are retained as historical course work. The current 15-table UNIQLO-inspired SVG and Markdown artefacts above supersede those earlier drafts for the final-project design.
