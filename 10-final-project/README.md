# Proyecto final — Base de datos para una tienda de moda omnicanal

## Español

### Identificación del proyecto
**Diseño e Implementación de una Base de Datos para la Gestión Omnicanal de Productos, Inventario y Ventas de una Tienda de Moda**

Proyecto educativo independiente centrado en la gestión omnicanal de una tienda de moda.

### Alcance y reglas de negocio aprobadas
- Especializaciones de producto: ROPA, CALZADO y COMPLEMENTOS.
- Especialización ISA: **Total y Disjunta**; cada producto pertenece exactamente a uno de los tres subtipos.
- Los públicos objetivo son independientes del tipo de producto: Hombre, Mujer, Unisex e Infantil.
- Un producto puede dirigirse a varios públicos mediante `PRODUCTO_PUBLICO`.
- Cada producto tiene una o más variantes; cada variante pertenece a un único producto y tiene un SKU único.
- La talla y el color de una variante pueden ser NULL cuando no sean aplicables.
- El inventario se controla por variante y sucursal física.
- Cada pareja variante/sucursal tiene un único registro de inventario.
- Las ventas en tienda pueden no tener un cliente identificado.
- Cada venta está asociada a una sucursal física.
- Los pedidos online son preparados y enviados desde una única sucursal física.
- Una venta tiene una o más líneas de detalle y como máximo un registro de pago.

### Modelo lógico aprobado
El modelo relacional aprobado contiene **15 tablas**:
CATEGORIAS, SUBCATEGORIAS, PRODUCTOS, ROPA, CALZADO, COMPLEMENTOS, VARIANTES_PRODUCTO, PUBLICOS_OBJETIVO, PRODUCTO_PUBLICO, SUCURSALES, INVENTARIO, CLIENTES, VENTAS, DETALLE_VENTA y PAGOS.

### Documentación y entregables

**Modelo conceptual**
- [Diagrama Entidad–Relación (SVG)](er-diagram/Diagrama-ER-Tienda-Moda-Omnicanal.svg)

**Modelo lógico**
- [Diagrama del Modelo Relacional (PDF)](relational-model/Modelo-Relacional-15-Tablas.pdf)
- [Especificación completa del Modelo Relacional (Markdown)](relational-model/Modelo-Relacional-Tienda-Moda.md)

**Normalización**
- [Diagrama de normalización (SVG)](documentation/Normalizacion-Tienda-Moda.svg)
- [Análisis de normalización (Markdown)](documentation/Normalizacion-Tienda-Moda.md)

### Alcance del curso y estado
El trabajo actual cubre el diseño conceptual y lógico. La implementación SQL, los datos de prueba, las consultas, las vistas, los triggers, los procedimientos almacenados, los eventos y los permisos corresponden a etapas posteriores y no se presentan como completados.

| Área | Estado |
|---|---|
| Alcance y reglas de negocio | Aprobado |
| Modelo conceptual E/R | Aprobado; diagrama PDF publicado |
| Modelo relacional (15 tablas) | Aprobado; diagrama y especificación publicados |
| Análisis 1FN, 2FN y 3FN | Documentado; validación final tras implementar en MySQL |
| DDL y restricciones MySQL | Pendiente |
| Datos de prueba y consultas SQL | Pendiente |
| Vistas, triggers, rutinas, eventos y seguridad | Pendiente |

### Curso
- **Curso:** Programació amb SQL i bases de dades relacionals (IFCD47)
- **Centro:** CIFO La Violeta, Barcelona


## English

### Project identity
**Design and Implementation of a Database for Omnichannel Product, Inventory and Sales Management in a Fashion Retail Store**

An independent educational database design focused on omnichannel fashion retail operations.

### Approved business scope and rules
- Product specializations: ROPA, CALZADO and COMPLEMENTOS.
- ISA specialization: **Total and Disjoint** — every product belongs to exactly one of the three subtypes.
- Product audiences are separate from product types: Hombre, Mujer, Unisex and Infantil.
- Products can target multiple audiences through `PRODUCTO_PUBLICO`.
- Each product has one or more variants; each variant belongs to exactly one product and has a unique SKU.
- Variant size (talla) and color may be NULL when not applicable.
- Inventory is tracked by variant and physical store.
- Each variant/store pair has one inventory record.
- In-store sales may have no identified customer.
- Every sale is associated with one physical store.
- Online orders are fulfilled by one physical store.
- A sale has one or more detail lines and at most one payment record.

### Approved logical model
The approved relational model contains **15 tables**:
CATEGORIAS, SUBCATEGORIAS, PRODUCTOS, ROPA, CALZADO, COMPLEMENTOS, VARIANTES_PRODUCTO, PUBLICOS_OBJETIVO, PRODUCTO_PUBLICO, SUCURSALES, INVENTARIO, CLIENTES, VENTAS, DETALLE_VENTA and PAGOS.

### Documentation and deliverables

**Conceptual model**
- [Entity–Relationship diagram (SVG)](er-diagram/Diagrama-ER-Tienda-Moda-Omnicanal.svg)

**Logical model**
- [Relational Model diagram (PDF)](relational-model/Modelo-Relacional-15-Tablas.pdf)
- [Full Relational Model specification (Markdown)](relational-model/Modelo-Relacional-Tienda-Moda.md)

**Normalization**
- [Normalization diagram (SVG)](documentation/Normalizacion-Tienda-Moda.svg)
- [Normalization analysis (Markdown)](documentation/Normalizacion-Tienda-Moda.md)

### Course scope and status
The current work covers conceptual and logical database design. SQL implementation, sample data, queries, views, triggers, stored procedures, events and permissions belong to later stages and are not presented as completed.

| Area | Status |
|---|---|
| Business scope and rules | Approved |
| E/R conceptual model | Approved; PDF diagram published |
| Relational model (15 tables) | Approved; diagram and specification published |
| 1NF, 2NF and 3NF analysis | Documented; final validation follows MySQL implementation |
| MySQL DDL and constraints | Planned |
| Sample data and SQL queries | Planned |
| Views, triggers, routines, events and security | Planned |

### Course
- **Course:** Programació amb SQL i bases de dades relacionals (IFCD47)
- **Institution:** CIFO La Violeta, Barcelona

