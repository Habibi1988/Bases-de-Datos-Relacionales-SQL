# Ejercicio 4 — Sistema de vuelos (Flight System)

## Español

Este ejercicio describe un modelo Entidad–Relación, cardinalidades mínimas y máximas, un esquema relacional, una matriz de relaciones y restricciones de integridad para un sistema de vuelos.

### Entidades y tablas principales
- `AEROPUERTO`: código, nombre, ciudad y país del aeropuerto.
- `MODELO_AVION`: modelo de avión y capacidad.
- `PROGRAMA_VUELO`: número de vuelo único, compañía aérea, días de operación, aeropuerto de origen y aeropuerto de destino.
- `VUELO`: instancia concreta de un vuelo, con identificador propio, programa, modelo de avión, fecha y plazas libres.
- `ESCALA`: escala perteneciente a un vuelo y a un aeropuerto, con número de orden y cantidades de pasajeros que embarcan o desembarcan.

### Relaciones y cardinalidades
- `PUEDE_RECIBIR`: relación N:M entre aeropuertos y modelos de avión.
- `DESPEGA_DE`: cada programa de vuelo tiene exactamente un aeropuerto de origen; un aeropuerto puede ser origen de cero o muchos programas.
- `ATERRIZA_EN`: cada programa de vuelo tiene exactamente un aeropuerto de destino; un aeropuerto puede ser destino de cero o muchos programas.
- `REALIZA`: un programa puede generar cero o muchos vuelos concretos; cada vuelo concreto pertenece a un programa.
- `UTILIZA`: cada vuelo concreto utiliza exactamente un modelo de avión; un modelo puede utilizarse en cero o muchos vuelos.
- `TIENE`: un vuelo puede tener cero o muchas escalas; cada escala pertenece a un vuelo.
- `OCURRE_EN`: cada escala ocurre en un aeropuerto; un aeropuerto puede albergar cero o muchas escalas.

### Esquema relacional y claves
- `AEROPUERTO`: `codigo` (PK), nombre, ciudad, país.
- `MODELO_AVION`: `modelo` (PK), capacidad.
- `PROGRAMA_VUELO`: `numero_vuelo` (PK), compañía, días, `codigo_origen` (FK), `codigo_destino` (FK).
- `VUELO`: `id_vuelo` (PK), `numero_vuelo` (FK), `modelo` (FK), fecha, plazas libres.
- `ESCALA`: PK compuesta `(id_vuelo, numero_orden)`; también referencia a un vuelo y un aeropuerto.
- `PUEDE_RECIBIR`: tabla asociativa con PK compuesta `(codigo_aeropuerto, modelo)`.

### Restricciones importantes
- Cada programa de vuelo referencia un aeropuerto de origen y uno de destino.
- Cada vuelo concreto está asociado a un único programa y a un único modelo de avión.
- Las plazas libres no pueden ser negativas ni superar la capacidad del modelo de avión utilizado.
- El número de orden de una escala puede repetirse en vuelos diferentes, pero no dentro del mismo vuelo.
- Cada escala referencia un vuelo y un aeropuerto existentes.
- `PUEDE_RECIBIR` es una relación del modelo E/R que se transforma en una tabla asociativa.
- El enunciado indica que las cardinalidades mínimas de los aeropuertos dependen de la redacción exacta del requisito original.

### Archivos
El diagrama E/R y el documento del modelo relacional se encuentran en esta carpeta.

## English

This exercise describes an Entity–Relationship model, minimum and maximum cardinalities, a relational schema, a relationship matrix and integrity constraints for a flight system.

### Main entities and tables
- `AEROPUERTO`: airport code, name, city and country.
- `MODELO_AVION`: aircraft model and capacity.
- `PROGRAMA_VUELO`: globally unique flight number, airline, operating weekdays, origin airport and destination airport.
- `VUELO`: a specific flight instance with its own identifier, scheduled program, aircraft model, date and empty seats.
- `ESCALA`: a stop belonging to a specific flight and airport, with order number and passenger boarding/alighting counts.

### Relationships and cardinalities
- `PUEDE_RECIBIR`: airports and aircraft models have an N:M relationship.
- `DESPEGA_DE`: each flight program has exactly one origin airport; an airport may be the origin for zero or many programs.
- `ATERRIZA_EN`: each flight program has exactly one destination airport; an airport may be the destination for zero or many programs.
- `REALIZA`: a program may generate zero or many concrete flights; each concrete flight belongs to exactly one program.
- `UTILIZA`: each concrete flight uses exactly one aircraft model; a model may be used by zero or many flights.
- `TIENE`: a flight may have zero or many stops; each stop belongs to exactly one flight.
- `OCURRE_EN`: each stop occurs at exactly one airport; an airport may host zero or many stops.

### Relational schema and keys
- `AEROPUERTO`: `codigo` (PK), name, city, country.
- `MODELO_AVION`: `modelo` (PK), capacity.
- `PROGRAMA_VUELO`: `numero_vuelo` (PK), airline, weekdays, `codigo_origen` (FK), `codigo_destino` (FK).
- `VUELO`: `id_vuelo` (PK), `numero_vuelo` (FK), `modelo` (FK), date, empty seats.
- `ESCALA`: composite PK `(id_vuelo, numero_orden)`; also references a flight and an airport.
- `PUEDE_RECIBIR`: associative table with composite PK `(codigo_aeropuerto, modelo)`.

### Important constraints
- Each flight program references one origin and one destination airport.
- Each concrete flight is associated with exactly one program and one aircraft model.
- Empty seats cannot be negative or exceed the capacity of the aircraft model used.
- The stop order number can repeat across different flights but not within the same flight.
- Each stop references an existing flight and airport.
- `PUEDE_RECIBIR` is a relationship in the E/R model and becomes an associative table in the relational model.
- The exercise notes that the minimum cardinalities for airports depend on the exact wording of the original assignment.

### Files
The E/R diagram and relational-model document are stored in this folder.
