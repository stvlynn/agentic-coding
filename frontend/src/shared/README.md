# shared

This layer contains reusable primitives and utilities.

## What goes here

- UI primitives: `Button`, `Input`, `Modal`.
- Utilities: `formatDate`, `httpClient`, `clamp`.
- Design tokens, theme variables, i18n helpers.
- Global types and configuration.

## What does NOT go here

- Business logic.
- References to specific entities or features.

## Public API

Expose through sub-module indexes:

```ts
import { Button } from 'shared/ui';
import { formatDate } from 'shared/lib';
```

## Dependencies

`shared` cannot import from any other layer.
