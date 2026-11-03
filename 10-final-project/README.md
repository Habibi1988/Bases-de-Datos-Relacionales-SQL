# Final Project — Relational Database Design

## Project

**Sistema de Gestión de Ventas e Inventario de una Tienda Omnicanal**

This project designs a relational database for an omnichannel retail business that manages in-store and online sales, customers, products, store-level inventory, and payments.

The database is designed around the business rule that each online order is fulfilled in its entirety by one physical store. Inventory is managed independently at each store, and in-store sales may be registered without identifying the customer.

## Current scope: first 60 course hours

The work documented so far covers the first two learning units:

- **UF01 — Conceptual design (30 hours):** business requirements and rules, entities, attributes, relationships, cardinalities, and the Entity–Relationship model.
- **UF02 — Logical design (30 hours):** transformation of the conceptual model into a relational schema, including primary keys, foreign keys, and relevant uniqueness and optionality constraints.

SQL implementation and query development are planned for later stages of the course and are not part of this 60-hour deliverable.

## Project documentation

The full project document is available in both formats:

- [PDF — First 60 Hours](documentation/Proyecto_Primeras_60_Horas_BBDD_Tienda_Omnicanal.pdf)
- [Editable Word document — First 60 Hours](documentation/Proyecto_Primeras_60_Horas_BBDD_Tienda_Omnicanal.docx)

## Repository structure

```text
10-final-project/
├── README.md
├── documentation/   # Project reports and written documentation
├── er-diagram/      # Entity–Relationship diagrams
├── relational-model/ # Relational schema and table diagrams
├── sql/             # SQL scripts (future stage)
├── queries/         # SQL queries (future stage)
└── results/         # Outputs and analysis (future stage)
```

## Development status

| Area | Status |
|---|---|
| Requirements and business rules | Completed for current scope |
| Conceptual model (UF01) | Completed for current scope |
| Relational model (UF02) | Completed for current scope |
| SQL implementation | Not started — planned for a later stage |
| Queries and results | Not started — planned for a later stage |

This repository will be updated progressively as the course project advances.