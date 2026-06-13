# entities

This layer contains domain data and rules.

## What goes here

- One folder per domain concept: `user`, `order`, `product`.
- Types, factories, validation, and pure functions that operate on the entity.
- No UI, no HTTP clients, no framework-specific code.

## Example

```ts
// entities/order/order.ts
export type OrderStatus = 'draft' | 'submitted' | 'cancelled';

export interface Order {
  id: string;
  items: OrderItem[];
  status: OrderStatus;
}
```

## Dependencies

`entities` can import only from `shared`.
