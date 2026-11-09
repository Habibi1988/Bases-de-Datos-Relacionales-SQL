# Exercise 5 — Relational Model
## Freight Transport Company

**Source basis:** the IFCD47 assignment statement and the user's screenshot of the Access Relationships window. This model documents the visible Access structure. It does not claim that unseen field definitions or constraints have been independently inspected.

## 1. Relational schema

Notation: **PK** = primary key; **FK** = foreign key; **UQ** = unique constraint.

### Vehicle catalogue

- **MARCAS**(`pk_marca` PK, `marca`)
- **MODELOS**(`pk_modelo` PK, `modelo`, `fk_marca` FK → MARCAS.`pk_marca`)
- **VEHICULOS**(`matricula` PK, `fk_modelo` FK → MODELOS.`pk_modelo`, `anyo`)
- **CAMIONES**(`pk_matricula` PK/FK → VEHICULOS.`matricula`, `tonelaje_maximo`)
- **FURGONETAS**(`pk_matricula` PK/FK → VEHICULOS.`matricula`, `capacidad_maxima_m3`)

### Employee catalogue

- **EMPLEADOS**(`dni` PK, `nombre`, `apellido1`, `apellido2`, `telefono`)
- **DEPARTAMENTOS**(`pk_departamento` PK, `departamento`) — the exact key and attribute names should be confirmed in Access Table Design.
- **ADMINISTRATIVOS**(`dni` PK/FK → EMPLEADOS.`dni`, `fk_departamento` FK → DEPARTAMENTOS.`pk_departamento`)
- **CONDUCTORES**(`dni` PK/FK → EMPLEADOS.`dni`, `carnet`, `categoria`)

### Trips and segments

- **VIAJES**(`pk_viaje` PK, `origen`, `destino`, `conductor` FK → CONDUCTORES.`dni`, `vehiculo` FK → VEHICULOS.`matricula`)
- **TRAMOS_VIAJE**(`fk_viaje` PK/FK → VIAJES.`pk_viaje`, `numero_tramo` PK, `distancia_km`, `fecha_inicio`, `fecha_fin`)

The composite primary key of TRAMOS_VIAJE is **(`fk_viaje`, `numero_tramo`)**. This makes segment numbers unique within a trip, while allowing the same segment number in different trips.

### Administrative assignment (many-to-many)

- **ADMINISTRATIVO_VIAJES**(`fk_viaje` PK/FK → VIAJES.`pk_viaje`, `dni` PK/FK → ADMINISTRATIVOS.`dni`)

The composite primary key **(`fk_viaje`, `dni`)** prevents duplicate assignment of the same administrator to the same trip.

## 2. Relationship cardinalities

| Parent | Child | Cardinality | Meaning |
|---|---|---|---|
| MARCAS | MODELOS | 1:N | One brand can classify several models |
| MODELOS | VEHICULOS | 1:N | One model can be used by several vehicles |
| VEHICULOS | CAMIONES | 1:0..1 | A vehicle may have a truck subtype row |
| VEHICULOS | FURGONETAS | 1:0..1 | A vehicle may have a van subtype row |
| EMPLEADOS | CONDUCTORES | 1:0..1 | An employee may have a driver subtype row |
| EMPLEADOS | ADMINISTRATIVOS | 1:0..1 | An employee may have an administrator subtype row |
| DEPARTAMENTOS | ADMINISTRATIVOS | 1:N | A department can have several administrators |
| CONDUCTORES | VIAJES | 1:N | Each trip is assigned to one driver; a driver may perform many trips |
| VEHICULOS | VIAJES | 1:N | Each trip uses one vehicle; a vehicle may be used on many trips |
| VIAJES | TRAMOS_VIAJE | 1:N | A trip contains its ordered segments |
| VIAJES | ADMINISTRATIVO_VIAJES | 1:N | Junction rows for a trip |
| ADMINISTRATIVOS | ADMINISTRATIVO_VIAJES | 1:N | Junction rows for an administrator |

## 3. Specialization constraints

The assignment explicitly requires both specializations to be **total and disjoint**:

- VEHICULOS → CAMIONES / FURGONETAS: every vehicle must belong to exactly one subtype.
- EMPLEADOS → CONDUCTORES / ADMINISTRATIVOS: every employee must belong to exactly one subtype.

The one-to-one PK/FK relationships shown in Access support subtype membership, but **do not by themselves enforce total and disjoint specialization**. These rules need additional validation or database logic (for example, controlled insert/update procedures or triggers, depending on the DBMS).

## 4. Referential integrity and business rules

1. A trip must reference one existing driver and one existing vehicle.
2. A trip segment must reference an existing trip.
3. Deleting a trip must delete its segments (ON DELETE CASCADE, or equivalent Access referential-integrity setting).
4. An administrator-trip assignment must reference an existing administrator and trip.
5. Each segment number is unique only within its trip.
6. Each vehicle and employee must belong to exactly one subtype, as required by the assignment.

## 5. Items to verify against the Access file

The screenshot does not show every column or every relationship property. The following items must be checked in Table Design / Edit Relationships before calling the model fully validated:

- **VIAJES.fecha_salida:** required by the assignment but not visible among the fields in the screenshot. Add it if it is genuinely absent.
- **CATEGORIA_CONDUCTORES:** a table with this name appears in the Access navigation pane, but no relationship to CONDUCTORES is visible in the screenshot. Confirm its fields and whether `CONDUCTORES.categoria` should be a foreign key to it.
- **DEPARTAMENTOS:** confirm the exact primary-key and descriptive-column names.
- **Specialization:** verify total/disjoint rules; the diagram's one-to-one links alone do not prove them.
- **TRAMOS_VIAJE:** verify that referential integrity and cascade delete are enabled.
- Confirm nullability, data types, and whether `carnet` must be unique.

## 6. Scope and provenance

This is a relational interpretation of the Access Relationships screenshot and the supplied assignment. It preserves the visible table and field names rather than silently redesigning them. Items marked for verification are intentionally not presented as confirmed facts.
