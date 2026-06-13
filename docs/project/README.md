# Project

This section describes the project at a high level: what it is, what it is not, and how the major parts fit together.

## Documents

- [`architecture.md`](architecture.md) — system architecture, module boundaries, and data flow.

## Project overview

This repository is an **agentic-coding template**. It is meant to be copied at the start of a new project so that coding agents can immediately understand the conventions and boundaries.

Because it is a template, concrete technology choices are intentionally left as placeholders. When you copy this template, fill in:

- Programming language and runtime version.
- Frontend framework and state-management approach.
- Backend framework and transport (HTTP, gRPC, events, CLI).
- Database, cache, and message broker.
- Hosting and deployment target.

## Boundaries

The template enforces two architectural boundaries:

- **Frontend:** [Feature-Sliced Design (FSD)](../frontend/README.md).
- **Backend:** [Domain-Driven Design (DDD) layered architecture](../backend/README.md).

Anything that crosses both boundaries — for example, a shared type contract between frontend and backend — should be documented in [`architecture.md`](architecture.md).

## What belongs here

- Project goals and non-goals.
- High-level architecture and module relationships.
- Technology-stack decisions.
- Cross-cutting concerns that touch both frontend and backend.

## What does not belong here

- Detailed layer rules (those live in [`frontend/`](../frontend/README.md) and [`backend/`](../backend/README.md)).
- Operational procedures (those live in [`operations/`](../operations/README.md)).
- Testing or code-review policy (those live in [`quality/`](../quality/README.md)).
