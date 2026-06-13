# pages

This layer contains page components that map to URLs.

## What goes here

- One folder per route/page.
- Page composition: combine widgets and features into a complete screen.
- Reading route parameters and passing them to child components.
- Page-level layout skeleton (header / left / main / right / footer).

## What does NOT go here

- Reusable UI components.
- Business logic or direct API calls.
- Deep prop drilling; prefer composing features/widgets.

## Dependencies

`pages` can import from `widgets`, `features`, `entities`, `shared`.
