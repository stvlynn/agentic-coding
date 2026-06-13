# Layers

FSD uses six layers. Each layer has a single responsibility and a strict downward dependency direction.

## `app`

- Application initialization.
- Global providers (theme, router, state store, i18n).
- Global styles and CSS variables.
- Routing entry point.

**Does not contain:** business logic, reusable UI, or page-specific code.

## `pages`

- Page components mapped to URLs.
- Reading route parameters and passing them down.
- Page-level layout skeleton (header / content / footer).
- Composing widgets and features into a complete screen.

**Does not contain:** reusable UI, business logic, or direct API calls. Keep pages thin.

## `widgets`

- Self-contained UI blocks that belong to a page or a feature.
- Examples: header, sidebar, dashboard card, order summary panel.
- Can compose features and entities, but should remain focused on one visual block.

**Does not contain:** application-wide state or routing logic.

## `features`

- Complete user scenarios.
- Examples: authentication, search, add to cart, submit feedback.
- Contains UI, state, API calls, and utilities that belong to that scenario.

**Does not contain:** generic primitives (those go in `shared`) or domain rules that belong to `entities`.

## `entities`

- Domain data and rules.
- Examples: `User`, `Order`, `Product`, `Comment`.
- Contains types, factories, validation, and pure functions that operate on the entity.

**Does not contain:** UI, HTTP clients, or framework-specific code.

## `shared`

- Reusable primitives and utilities used by any layer.
- Examples: `Button`, `Input`, `formatDate`, `httpClient`, theme tokens, i18n helpers.

**Does not contain:** business logic or references to specific entities/features.

## Layer dependency direction

Imports can only go downward:

```
app -> pages -> widgets -> features -> entities -> shared
```

`shared` cannot import from any other layer. `entities` cannot import from `features` or above.
