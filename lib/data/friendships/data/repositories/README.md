# Repositories (Data Layer)

This folder contains the implementations of the repository interfaces defined in the domain layer. These implementations fetch data from multiple sources and provide it in a unified format.

## Purpose

- Bridge the domain layer and data sources (local and remote).
- Combine data when necessary and handle source prioritization (e.g., cache-first or network-first strategies).

## Usage

- Inject dependencies for local and remote data sources.
- Implement methods for the domain layer's repository interface.
