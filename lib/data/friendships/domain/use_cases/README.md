# Use Cases

This folder contains classes representing the business logic of the application. Each class focuses on a specific feature or functionality.

## Purpose

- Encapsulate business rules and make them reusable across the application.
- Interact with repository interfaces from the domain layer.

## Usage

- Inject repository interfaces as dependencies.
- Expose a single `call` method to execute the use case logic.
