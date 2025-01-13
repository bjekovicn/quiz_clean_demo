# Models

This folder contains Data Transfer Objects (DTOs) used to serialize and deserialize data between the data layer and external sources.

## Purpose

- Represent the structure of external data (e.g., API responses or local database records).
- Provide serialization (`toJson`) and deserialization (`fromJson`) methods.

## Usage

- Map incoming data into models that the repositories can handle.
- Ensure all models are consistent with the data source structure.
