# Interfaces Layer

The interfaces layer adapts the application layer to the outside world. It handles HTTP requests, CLI commands, scheduled jobs, and event consumers.

## What belongs in `interfaces/`

- **HTTP controllers** — parse input, call an application service, format output.
- **CLI commands** — parse arguments, call an application service.
- **Event handlers** — consume domain events or external messages and call application services.
- **Input validation** — validate request shape before passing it to the application layer.
- **Output serialization** — convert DTOs into wire format.

## Rules

- Controllers and handlers must be thin. No business logic, no direct database access.
- Validate input at the boundary. Invalid input should produce a clear error response (see [`api-conventions.md`](api-conventions.md)).
- Do not pass HTTP request objects into application services.
- Use the DTOs returned by application services for responses.

## Example

```ts
// interfaces/http/order-controller.ts
export class OrderController {
  constructor(private readonly placeOrderService: PlaceOrderService) {}

  async create(request: Request, response: Response): Promise<void> {
    const command = PlaceOrderCommandSchema.parse(request.body);
    const dto = await this.placeOrderService.execute(command);
    response.status(201).json(dto);
  }
}
```

## Error handling

- Catch expected application/domain errors and map them to HTTP status codes using the convention in [`api-conventions.md`](api-conventions.md).
- Unexpected errors should be logged and returned as a generic 500. Do not leak stack traces or sensitive details in production.
