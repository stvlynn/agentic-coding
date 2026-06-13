# application

This layer orchestrates use cases.

## What goes here

- Application services: one per use case or aggregate.
- DTOs for application inputs and outputs.
- Commands and queries.
- Transaction boundaries.

## Rules

- No business rules; delegate to `domain`.
- No HTTP or framework code.
- Return DTOs, not raw domain entities, at the boundary.

## Example

```ts
// application/place-order/place-order-service.ts
export class PlaceOrderService {
  // coordinates repositories and domain entities
}
```
