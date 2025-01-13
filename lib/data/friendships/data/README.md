# Data Layer

The **Data** layer is responsible for managing and handling data-related operations. It is the layer where data is fetched, stored, and manipulated. In the context of CLEAN Architecture, this layer interacts with external data sources such as APIs, databases, or local storage.

## Responsibilities

- **Data Models**: Defines the models that represent data in the application. These models are usually plain Dart classes that map the data coming from external sources into a form that the application can work with.
- **Repositories**: Implements the repository pattern. The repository is an abstraction that provides a clean API for the rest of the application to access data. Repositories fetch the data from either remote or local sources and return it in the form of domain models.

- **Data Sources**: Manages communication with external data sources like REST APIs, GraphQL endpoints, databases (SQLite, Hive), or even local storage (Shared Preferences, File System). This is the code that actually fetches the data from the internet or a database.

- **Mappers**: Converts data between different formats, such as converting data from a network API (JSON) into a data model (Dart object).

## Example

Here is an example of how the Data layer works:

1. **Datasource** fetches data from an API.
2. The data is passed through **Mappers** to convert it into a model that is compatible with the app.
3. The **Repository** interacts with the Datasource and returns the data to the Domain layer.

By keeping this layer isolated, we ensure that the application is decoupled from the specifics of external data sources, promoting testability and maintainability.

## Testing

Unit tests for the Data layer can be written by mocking the data sources and verifying that the repository correctly interacts with them. This allows for easy testing of data-fetching operations in isolation.
