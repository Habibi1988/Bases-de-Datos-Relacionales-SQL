# Exercise 5 — Freight Transport Company

[Español](#español) · [English](#english)

## Español

Este ejercicio plantea el diseño de una base de datos para una **empresa de transporte de mercancías**, según el enunciado del curso IFCD47.

### Requisitos del enunciado

1. **Vehículos:** matrícula, marca, modelo y año. Se especializan en camiones (tonelaje máximo) y furgonetas (capacidad en m³). La especialización es total y disjunta: cada vehículo pertenece exactamente a uno de los dos tipos.
2. **Empleados:** DNI, nombre, apellidos y teléfono. Se especializan en conductores (número de carnet y categoría) y administrativos (departamento). Cada empleado pertenece exactamente a uno de los dos tipos.
3. **Viajes:** número de viaje, fecha de salida, origen y destino. Cada viaje lo realiza un conductor y utiliza un vehículo. Un conductor y un vehículo pueden intervenir en varios viajes.
4. **Tramos:** cada viaje se divide en tramos con número de orden, distancia en kilómetros, fecha de inicio y fecha de fin. El número de tramo es relativo al viaje; por tanto, la identificación del tramo debe tener en cuenta el viaje al que pertenece. Al eliminar un viaje, se eliminan sus tramos.
5. **Gestión:** la relación entre administrativos y viajes es muchos a muchos: un administrativo puede gestionar varios viajes y un viaje puede ser gestionado por varios administrativos.

### Estructura prevista

- `er-diagram/`: diagrama Entidad–Relación.
- `relational-model/`: transformación al modelo relacional y claves.
- `sql/`: implementación SQL, cuando esté desarrollada.
- `documentation/`: decisiones de diseño y reglas de negocio.
- `results/`: evidencias de ejecución y pruebas.

### Estado

El enunciado está disponible. El archivo Access proporcionado se conserva como material de trabajo; su estructura interna debe revisarse antes de documentar tablas o consultas existentes. No se afirma que el esquema SQL esté implementado o validado.

## English

This exercise covers the database design for a **freight transport company**, based on the IFCD47 course assignment.

### Assignment requirements

1. **Vehicles:** registration number, make, model and year. Vehicles are specialised into trucks (maximum tonnage) and vans (capacity in m³). The specialisation is total and disjoint: every vehicle is exactly one of these two types.
2. **Employees:** national ID, first name, surname and telephone. Employees are specialised into drivers (driving licence number and category) and administrative staff (department). Every employee is exactly one of these two types.
3. **Trips:** trip number, departure date, origin and destination. Each trip is performed by one driver and uses one vehicle. A driver and a vehicle may participate in multiple trips.
4. **Trip segments:** each trip is divided into ordered segments with distance in kilometres, start date and end date. Segment numbering is local to each trip, so segment identification must include its owning trip. Deleting a trip also deletes its segments.
5. **Trip administration:** the relationship between administrative employees and trips is many-to-many. An administrator may manage multiple trips, and a trip may be managed by multiple administrators.

### Current deliverables

- [Entity–Relationship diagram (SVG)](er-diagram/ER-Diagram-Freight-Transport.svg)
- [Relational model (Markdown)](relational-model/Relational-Model-Freight-Transport.md)

The diagram and relational model are based on the Access Relationships screenshot and the assignment PDF. Items not visible in the screenshot are explicitly marked for verification.

### Planned structure

- `er-diagram/`: Entity–Relationship diagram.
- `relational-model/`: relational transformation and keys.
- `sql/`: SQL implementation, once developed.
- `documentation/`: design decisions and business rules.
- `results/`: execution evidence and tests.

### Status

The assignment statement is available. The supplied Access file is retained as working material; its internal structure must be inspected before documenting any existing tables or queries. No SQL implementation or validation is claimed yet.
