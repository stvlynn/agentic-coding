# FSD Overview

Feature-Sliced Design (FSD) is an architectural methodology for frontend applications. It splits the codebase into layers, slices, and segments so that each file has a clear, enforceable location.

## Why FSD

- **Predictability.** Every file belongs to a known layer and slice.
- **Isolation.** A change in one feature rarely touches unrelated code.
- **Scalability.** New developers can locate code without understanding the whole project.
- **Agent friendliness.** A coding agent can follow layer rules instead of guessing where to place new code.

## Key concepts

### Layers

Layers define the scope of the code. From top to bottom:

1. `app` — application initialization, providers, global styles, routing entry.
2. `pages` — page components that compose widgets and features.
3. `widgets` — independent UI blocks used by pages.
4. `features` — complete user scenarios (e.g., "add to cart").
5. `entities` — domain models and rules (e.g., `User`, `Product`).
6. `shared` — reusable primitives and utilities.

### Slices

Within a layer, code is grouped by **business domain** rather than by file type. For example, under `features/` you might have:

```
features/
  auth/
  add-to-cart/
  checkout/
```

### Segments

Inside a slice, code is grouped by **technical responsibility**:

- `ui/` — components.
- `model/` — state, stores, selectors.
- `lib/` — helpers and hooks specific to the slice.
- `api/` — API clients and mutations.
- `config/` — slice-level configuration.

## FSD is not

- A folder structure only. It is a set of dependency rules.
- A replacement for state-management libraries. It tells you where to put them.
- Tied to React. The same layering works for Vue, Svelte, or native frameworks.
