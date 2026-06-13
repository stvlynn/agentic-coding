# domain

This layer contains the business rules of the system.

## What goes here

- Entities, value objects, aggregates.
- Domain services and domain events.
- Repository ports (interfaces) defined by the domain.

## Rules

- No dependencies on frameworks, databases, or transport details.
- No imports from `application`, `infrastructure`, or `interfaces`.
- Business invariants are validated here.

## Example

```ts
// domain/order/order.ts
export class Order {
  // entity with business rules
}
```
