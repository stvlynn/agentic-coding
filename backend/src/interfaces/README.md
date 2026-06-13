# interfaces

This layer adapts the application layer to the outside world.

## What goes here

- HTTP controllers.
- CLI commands.
- Event handlers.
- Input validation and output serialization.

## Rules

- Controllers are thin: parse input, call application service, format output.
- No business logic, no direct database access.
- Do not pass HTTP request objects into application services.

## Example

```ts
// interfaces/http/order-controller.ts
export class OrderController {
  // handles HTTP request/response
}
```
