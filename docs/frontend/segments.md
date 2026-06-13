# Segments

Segments group files inside a slice by technical responsibility. Not every slice needs every segment.

## `ui/`

Components and styles that belong to the slice.

- Export presentational components through the slice's public API.
- Keep components small and focused.
- Do not import from higher layers.

## `model/`

State, stores, selectors, and domain transformations.

- Keep state close to the slice that owns it.
- Selectors live here if they are specific to the slice.
- Generic state utilities live in `shared`.

## `lib/`

Helpers, hooks, and utilities specific to the slice.

- If a utility is reusable across multiple slices, move it to `shared`.
- If a utility is only used inside one slice, keep it here.

## `api/`

API clients, queries, and mutations for the slice.

- Define request/response DTOs close to the API client.
- Transform API data into entity shapes before passing it to the rest of the app.

## `config/`

Slice-level configuration.

- Feature flags, constants, or environment-specific values that belong to the slice.
- Global configuration belongs in `shared/config` or `app`.

## Example slice

```
features/add-to-cart/
  ui/
    AddToCartButton.tsx
    QuantitySelector.tsx
  model/
    store.ts
    selectors.ts
  api/
    addToCart.ts
  lib/
    useCartCount.ts
  index.ts
```
