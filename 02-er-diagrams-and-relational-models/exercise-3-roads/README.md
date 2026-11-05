# Ejercicio 3 — Carreteras (Roads)

## Español

Este ejercicio documenta un modelo Entidad–Relación, un esquema relacional, cardinalidades, atributos de relaciones y restricciones de negocio para una red de carreteras.

### Entidades y tablas principales
- `COMUNIDAD_AUTONOMA`: identificador y nombre de la comunidad autónoma.
- `PROVINCIA`: identificador y nombre de la provincia; referencia a su comunidad autónoma.
- `CARRETERA`: datos de la carretera, como nombre, titularidad, nivel, tipo, acceso controlado, desdoblamiento, prefijo, color, señal y observaciones.
- `TRAMO`: tramo de carretera; referencia a una carretera y almacena kilómetros inicial y final, terreno, entorno, límite de velocidad, carriles por sentido y observaciones.
- `PASA_POR`: tabla asociativa entre tramo y provincia, con orden de paso y kilómetros inicial/final.
- `EXTREMO`: extremo de un tramo, con posición, tipo y kilómetro.
- `CONFLUYE_CON`: conexión opcional desde un extremo hacia un tramo y provincia de destino, con el kilómetro de confluencia.

### Relaciones y cardinalidades
- Una comunidad autónoma tiene una o más provincias; cada provincia pertenece a una comunidad autónoma.
- Una carretera tiene uno o más tramos; cada tramo pertenece a una carretera.
- Un tramo pasa por una o más provincias; una provincia puede contener cero o más tramos.
- Un tramo puede tener cero, uno o dos extremos; cada extremo pertenece a un tramo.
- Un extremo puede tener cero o una conexión. El tramo y la provincia de destino pueden aparecer en varias conexiones.

### Restricciones importantes
- El kilómetro final debe ser mayor que el inicial.
- La longitud del tramo se calcula como `km_final - km_inicial`.
- Cada carretera debe tener exactamente un extremo inicial y uno final.
- Si el extremo es de tipo `concluye`, no se registra confluencia. Si es `confluye`, se requieren tramo de destino, provincia de destino y kilómetro de confluencia.
- Los rangos de kilómetros de `PASA_POR` deben ser coherentes con los kilómetros inicial y final del tramo.
- La clave primaria de `PASA_POR` es compuesta por `(id_tramo, orden)`; la clave primaria de `CONFLUYE_CON` es `id_extremo`.

### Archivos
El diagrama y el documento completo del ejercicio están disponibles en esta carpeta. Este README resume el modelo y las restricciones del ejercicio.

## English

This exercise documents an Entity–Relationship model, relational schema, cardinalities, relationship attributes and business constraints for a road network.

### Main entities and tables
- `COMUNIDAD_AUTONOMA`: autonomous community identifier and name.
- `PROVINCIA`: province identifier and name; references its autonomous community.
- `CARRETERA`: road details such as name, ownership, level, road type, controlled access, dual carriageway, prefix, color, signal and observations.
- `TRAMO`: a road segment; references a road and stores initial/final kilometres, terrain, environment, speed limit, lanes per direction and observations.
- `PASA_POR`: associative table connecting a segment with provinces, with passage order and start/end kilometres.
- `EXTREMO`: an endpoint of a segment, including position, type and kilometre.
- `CONFLUYE_CON`: optional connection from an endpoint to a destination segment and province, including the confluence kilometre.

### Relationships and cardinalities
- An autonomous community has one or more provinces; each province belongs to one autonomous community.
- A road has one or more segments; each segment belongs to one road.
- A segment passes through one or more provinces; a province may contain zero or more segments.
- A segment may have zero, one or two endpoints; each endpoint belongs to one segment.
- An endpoint may have zero or one connection. The destination segment and destination province can each be referenced by multiple connections.

### Important constraints
- The final kilometre must be greater than the initial kilometre.
- Segment length is derived as `km_final - km_inicial`.
- Each road must have exactly one initial endpoint and one final endpoint.
- If an endpoint is of type `concluye`, no confluence is recorded. If it is of type `confluye`, the destination segment, destination province and confluence kilometre are required.
- The kilometre ranges recorded in `PASA_POR` must be consistent with the segment's initial and final kilometres.
- `PASA_POR` has composite primary key `(id_tramo, orden)`, and `CONFLUYE_CON` has `id_extremo` as its primary key.

### Files
The diagram and complete exercise document are available in this folder. This README summarizes the model and constraints of the exercise.
