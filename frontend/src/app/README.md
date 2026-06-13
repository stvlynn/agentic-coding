# app

This layer contains application initialization and global wiring.

## What goes here

- Framework bootstrapping (e.g., `main.tsx`, `App.vue`).
- Global providers: router, theme, state store, i18n.
- Global styles, CSS variables, and design tokens.
- Routing entry point.

## What does NOT go here

- Business logic.
- Reusable UI components (those go in `shared`).
- Page-specific code (those go in `pages`).

## Dependencies

`app` can import from any lower layer: `pages`, `widgets`, `features`, `entities`, `shared`.
