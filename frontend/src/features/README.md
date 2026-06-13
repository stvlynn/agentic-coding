# features

This layer contains complete user scenarios.

## What goes here

- One folder per scenario: `auth`, `add-to-cart`, `checkout`, `search`.
- Everything needed for the scenario: UI components, state, API clients, helpers.
- `index.ts` that exposes the public API of the feature.

## What does NOT go here

- Generic primitives (those go in `shared`).
- Domain rules that belong to `entities`.

## Segment structure

```
features/<name>/
  ui/       # components
  model/    # state, selectors
  api/      # API clients and mutations
  lib/      # feature-specific helpers/hooks
  config/   # feature-level config
  index.ts  # public API
```

## Dependencies

`features` can import from `entities`, `shared`.
