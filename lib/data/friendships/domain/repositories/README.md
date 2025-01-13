# Repositories (Domain Layer)

This folder defines abstract interfaces for the repository operations required by the domain layer.

## Purpose

- Ensure the domain layer depends only on abstractions, not implementations.

## Usage

- Implement these interfaces in the data layer to provide concrete functionality.
- Use dependency injection to pass implementations into the domain layer.
