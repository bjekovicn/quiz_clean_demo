# Data Sources

This folder contains the implementations for accessing data from various sources, such as local storage or remote APIs. It abstracts away the details of data retrieval or storage.

## Subfolders

- **`local`**: Manages local data sources like SQLite, shared preferences, or secure storage.
- **`remote`**: Handles remote data sources, such as REST APIs or GraphQL.

## Key Classes

- `LocalFooDataSource`: Manages Foo data locally.
- `RemoteFooDataSource`: Handles Foo data through remote APIs.

## Usage

- Implement the logic to fetch, save, or update data specific to the source.
- Follow a unified interface for both local and remote data sources to ensure consistency.
