# Architecture

> High-level system architecture. Update this file when the project grows or when major modules are added.

## Overview

This project follows a clean separation between:

- **Frontend** — structured with [Feature-Sliced Design (FSD)](../frontend/README.md).
- **Backend** — structured with [Domain-Driven Design (DDD)](../backend/README.md) layered architecture.

The two sides communicate through well-defined contracts. The backend exposes the domain through adapters in the `interfaces` layer; the frontend consumes those contracts in the `features` and `entities` layers.

## Context diagram

```text
+-----------+        HTTP / events        +-----------------------------+
|  Frontend |  <------------------------->  |  Backend interfaces layer   |
|   (FSD)   |                             |  (controllers / adapters)   |
+-----------+                             +-----------------------------+
                                                      |
                                                      v
+-----------+                             +-----------------------------+
|   User    |                             |  Application layer          |
|           |                             |  (use cases / services)     |
+-----------+                             +-----------------------------+
                                                      |
                                                      v
                                          +-----------------------------+
                                          |  Domain layer               |
                                          |  (entities / value objects) |
                                          +-----------------------------+
                                                      ^
                                                      |
                                          +-----------------------------+
                                          |  Infrastructure layer       |
                                          |  (DB / external services)   |
                                          +-----------------------------+
```

## Module boundaries

| Module | Responsibility | Example |
|--------|----------------|---------|
| Frontend `app` | Application setup, providers, routing entry | bootstrapping the SPA |
| Frontend `pages` | Page composition and routing parameter handling | `/orders` page |
| Frontend `widgets` | Self-contained UI blocks composed of features | order summary card |
| Frontend `features` | End-to-end user scenarios | place order, cancel order |
| Frontend `entities` | Domain data and rules | `Order`, `User` |
| Frontend `shared` | Reusable primitives and utilities | button, date formatter |
| Backend `interfaces` | Transport adapters | HTTP controller |
| Backend `application` | Use-case orchestration | `PlaceOrderService` |
| Backend `domain` | Business rules | `Order`, `OrderStatus` |
| Backend `infrastructure` | Concrete implementations | repository using PostgreSQL |

## Cross-cutting concerns

- **Authentication / authorization** — document the chosen strategy here once it is decided.
- **Error handling** — both sides must use the contract defined in [`backend/api-conventions.md`](../backend/api-conventions.md).
- **Logging and observability** — see [`backend/logging.md`](../backend/logging.md).
- **Validation** — backend validates at the boundary; frontend validates for immediate UX feedback, but the backend is the source of truth.

## Technology-stack placeholders

Replace these with real decisions:

- Runtime: `__RUNTIME__`
- Frontend framework: `__FRONTEND_FRAMEWORK__`
- Backend framework: `__BACKEND_FRAMEWORK__`
- Database: `__DATABASE__`
- Cache: `__CACHE__`
- Message broker: `__MESSAGE_BROKER__`
- Hosting: `__HOSTING__`
