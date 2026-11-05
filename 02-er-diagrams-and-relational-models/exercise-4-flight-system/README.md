# Ejercicio 4 — Sistema de vuelos (Flight System)

## Español
Este ejercicio describe un modelo Entidad–Relación, cardinalidades mínimas y máximas, un esquema relacional, una matriz de relaciones y restricciones de integridad para un sistema de vuelos.

### Entidades y tablas principales
- `AEROPUERTO`: código, nombre, ciudad y país.
- `MODELO_AVION`: modelo de avión y capacidad.
- `PROGRAMA_VUELO`: número de vuelo único, compañía aérea, días de operación, aeropuerto de origen y destino.
- `VUELO`: instancia concreta con identificador propio, programa, modelo de avión, fecha y plazas libres.
- `ESCALA`: escala de un vuelo en un aeropuerto, con orden y cantidades de pasajeros que embarcan/desembarcan.

### Relaciones y cardinalidades
- `PUEDE_RECIBIR`: relación N:M entre aeropuertos y modelos de avión.
- `DESPEGA_DE`: cada programa tiene exactamente un aeropuerto de origen; un aeropuerto puede ser origen de cero o muchos programas.
- `ATERRIZA_EN`: cada programa tiene exactamente un destino; un aeropuerto puede ser destino de cero o muchos programas.
- `REALIZA`: un programa puede generar cero o muchos vuelos; cada vuelo pertenece a un programa.
- `UTILIZA`: cada vuelo utiliza un modelo; un modelo puede utilizarse en muchos vuelos.
- `TIENE`: un vuelo puede tener cero o muchas escalas; cada escala pertenece a un vuelo.
- `OCURRE_EN`: cada escala ocurre en un aeropuerto; un aeropuerto puede albergar muchas escalas.

### Esquema relacional y restricciones
- `AEROPUERTO`: `codigo` (PK), nombre, ciudad, país.
- `MODELO_AVION`: `modelo` (PK), capacidad.
- `PROGRAMA_VUELO`: `numero_vuelo` (PK), compañía, días, `codigo_origen` (FK), `codigo_destino` (FK).
- `VUELO`: `id_vuelo` (PK), `numero_vuelo` (FK), `modelo` (FK), fecha, plazas libres.
- `ESCALA`: PK compuesta `(id_vuelo, numero_orden)`; referencia a vuelo y aeropuerto.
- `PUEDE_RECIBIR`: tabla asociativa con PK compuesta `(codigo_aeropuerto, modelo)`.
- Las plazas libres no pueden ser negativas ni superar la capacidad del avión.
- El orden de escala puede repetirse entre vuelos, pero no dentro del mismo vuelo.
- Cada escala referencia un vuelo y aeropuerto existentes.
- Las cardinalidades mínimas de los aeropuertos dependen de la redacción exacta del requisito original.

El diagrama E/R y el documento del modelo relacional se encuentran en esta carpeta.

## English
This exercise describes an Entity–Relationship model, minimum and maximum cardinalities, a relational schema, a relationship matrix and integrity constraints for a flight system.

### Main entities and tables
- `AEROPUERTO`: airport code, name, city and country.
- `MODELO_AVION`: aircraft model and capacity.
- `PROGRAMA_VUELO`: unique flight number, airline, operating weekdays, origin and destination airports.
- `VUELO`: a specific flight instance with its own identifier, program, aircraft model, date and empty seats.
- `ESCALA`: a stop belonging to a flight and airport, with order and passenger boarding/alighting counts.

### Relationships and cardinalities
- `PUEDE_RECIBIR`: N:M relationship between airports and aircraft models.
- `DESPEGA_DE`: each flight program has exactly one origin; an airport may be origin for zero or many programs.
- `ATERRIZA_EN`: each program has exactly one destination; an airport may be destination for zero or many programs.
- `REALIZA`: a program may generate zero or many flights; each flight belongs to one program.
- `UTILIZA`: each flight uses one aircraft model; a model may be used by many flights.
- `TIENE`: a flight may have zero or many stops; each stop belongs to one flight.
- `OCURRE_EN`: each stop occurs at one airport; an airport may host many stops.

### Relational schema and constraints
- `AEROPUERTO`: `codigo` (PK), name, city, country.
- `MODELO_AVION`: `modelo` (PK), capacity.
- `PROGRAMA_VUELO`: `numero_vuelo` (PK), airline, weekdays, `codigo_origen` (FK), `codigo_destino` (FK).
- `VUELO`: `id_vuelo` (PK), `numero_vuelo` (FK), `modelo` (FK), date, empty seats.
- `ESCALA`: composite PK `(id_vuelo, numero_orden)`; references a flight and airport.
- `PUEDE_RECIBIR`: associative table with composite PK `(codigo_aeropuerto, modelo)`.
- Empty seats cannot be negative or exceed aircraft capacity.
- Stop order may repeat across flights but not within one flight.
- Every stop references an existing flight and airport.
- Minimum airport cardinalities depend on the exact wording of the original requirement.

The E/R diagram and relational-model document are stored in this folder.
