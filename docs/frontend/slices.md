# Slices

A slice is a business-domain grouping inside a layer. Slices make the codebase searchable and keep related code together.

## Naming slices

- Use kebab-case names that describe the business concept.
- Prefer nouns over verbs: `order`, `user-profile`, `shopping-cart`.
- For actions, use a concise phrase: `checkout`, `user-auth`.

## Examples by layer

```
features/
  auth/
  add-to-cart/
  checkout/
  search/

entities/
  user/
  order/
  product/

widgets/
  header/
  order-summary/
  recent-activity/
```

## Slice boundaries

- A slice should be **cohesive**: everything inside serves the same business concept.
- A slice should be **decoupled**: it does not depend on internals of another slice in the same layer.
- When two slices in the same layer need to communicate, they do so through the public API of each slice or through a shared abstraction in a lower layer.

## When to split a slice

Split a slice when:

- It has more than one independent responsibility.
- It needs to be reused in unrelated parts of the app.
- Its state and API surface become hard to reason about.

Do not split prematurely. A slice with three files is fine.
