# Domain Layer

The domain layer contains the business rules of the system. It has no dependencies on frameworks, databases, or transport details.

## What belongs in `domain/`

- **Entities** — objects with identity that change over time (e.g., `Order`, `User`).
- **Value objects** — immutable objects defined by their attributes (e.g., `Money`, `EmailAddress`).
- **Aggregates** — clusters of entities and value objects treated as a single unit.
- **Domain services** — stateless operations that do not naturally belong to an entity.
- **Domain events** — facts that happened in the domain and may trigger reactions elsewhere.
- **Repository interfaces (ports)** — abstractions that the domain defines for persistence.

## Rules

- The domain layer must not import from `application`, `infrastructure`, or `interfaces`.
- Domain code must be pure JavaScript/TypeScript or the equivalent in your language. No HTTP, no SQL, no framework annotations.
- Validation of business invariants happens here.
- Use rich domain models when the rules are complex. Use anemic models with domain services only when the rules are trivial.

## Example

```ts
// domain/order/order.ts
export class Order {
  constructor(
    public readonly id: OrderId,
    private items: OrderItem[],
    private status: OrderStatus,
  ) {}

  addItem(item: OrderItem): void {
    if (this.status !== OrderStatus.Draft) {
      throw new OrderDomainError('Cannot modify a submitted order');
    }
    this.items.push(item);
  }

  submit(): void {
    if (this.items.length === 0) {
      throw new OrderDomainError('Cannot submit an empty order');
    }
    this.status = OrderStatus.Submitted;
  }
}
```

## Ports

The domain defines interfaces for anything it needs from the outside world:

```ts
// domain/order/ports/order-repository.ts
export interface OrderRepository {
  findById(id: OrderId): Promise<Order | null>;
  save(order: Order): Promise<void>;
}
```

Implementations of these ports live in `infrastructure/`.
