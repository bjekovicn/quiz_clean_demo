# Mappers

The **Mappers** folder is responsible for converting data between different representations in the Data layer. It acts as a bridge to map data from one format to another, typically from the raw data format (like JSON) received from external data sources (APIs, databases) to models or entities that are used by the Domain layer.

## Responsibilities

- **Mapping API responses**: Convert raw data received from remote APIs (usually in JSON format) into Dart objects or models.
- **Mapping models to entities**: Convert data models into domain entities when passing data to the Domain layer.
- **Data transformation**: Handle any necessary data transformation between layers, such as converting data types, reformatting fields, or combining multiple fields into a single entity attribute.
