# infrastructure

This layer implements the abstractions defined by `domain`.

## What goes here

- Repository implementations.
- External service clients.
- Messaging adapters.
- Database migrations and ORM mappings.
- Configuration readers.

## Rules

- Depends on `domain` and `application` only.
- Implements domain ports; does not contain business rules.
- Keep mapping between persistence models and domain entities explicit.
