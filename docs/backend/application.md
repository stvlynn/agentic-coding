# Application Layer

The application layer orchestrates use cases. It depends on the domain layer and on domain-defined ports, but not on concrete infrastructure.

## What belongs in `application/`

- **Application services** — one per use case or per aggregate. They coordinate entities, domain services, repositories, and external services.
- **DTOs** — data-transfer objects for inputs and outputs at the application boundary.
- **Commands and queries** — lightweight objects representing incoming requests.
- **Transaction boundaries** — a unit of work that spans multiple domain operations.

## Rules

- Application services contain no business rules. They delegate to domain entities and services.
- Application services are framework-agnostic. They do not access HTTP request/response objects.
- One application service method should represent one use case.
- Return DTOs, not raw domain entities, when crossing the application boundary.

## Example

```ts
// application/place-order/place-order-service.ts
export class PlaceOrderService {
  constructor(
    private readonly orderRepository: OrderRepository,
    private readonly inventoryService: InventoryPort,
  ) {}

  async execute(command: PlaceOrderCommand): Promise<OrderDto> {
    const order = Order.create(command.customerId, command.items);

    for (const item of order.items) {
      await this.inventoryService.reserve(item.productId, item.quantity);
    }

    await this.orderRepository.save(order);

    return OrderDto.from(order);
  }
}
```

## Transaction boundaries

- A single use case should be one transaction.
- Define the unit-of-work abstraction in `domain/` if multiple aggregates are involved.
- Implement the unit of work in `infrastructure/`.

## Cross-cutting concerns

- Logging, metrics, and authorization can be handled via decorators, middleware, or explicit service wrappers. Keep them thin and do not let them hide domain logic.
