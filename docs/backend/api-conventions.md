# API Conventions

This document defines how the backend exposes and formats its API.

## Transport

The default transport is HTTP/REST. If the project uses gRPC, GraphQL, or events, document the deviations here and in [`docs/project/architecture.md`](../project/architecture.md).

## Response envelope

All responses follow a consistent envelope:

```json
{
  "success": true,
  "data": { ... },
  "error": null
}
```

For errors:

```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "ORDER_EMPTY",
    "message": "Cannot submit an empty order"
  }
}
```

## HTTP status codes

| Code | Use case |
|------|----------|
| 200  | Successful read or update. |
| 201  | Successful creation. |
| 204  | Successful deletion or no-content action. |
| 400  | Validation error or malformed request. |
| 401  | Unauthenticated. |
| 403  | Forbidden. |
| 404  | Resource not found. |
| 409  | Conflict (e.g., duplicate unique value). |
| 422  | Semantic validation error. |
| 500  | Unexpected server error. |

## Error codes

- Use machine-readable `code` values in `SCREAMING_SNAKE_CASE`.
- Keep `message` concise and safe for end users.
- Do not include stack traces or internal identifiers in production error responses.

## Versioning

- Prefix routes with `/api/v1/` by default.
- Document breaking changes in [`docs/decisions/`](../decisions/README.md).

## Pagination

Use cursor-based pagination when possible. If offset-based pagination is required, use:

```json
{
  "data": [ ... ],
  "pagination": {
    "page": 1,
    "pageSize": 20,
    "total": 100
  }
}
```

## Idempotency

- Mutating endpoints that may be retried should accept an idempotency key header, e.g., `Idempotency-Key`.
- Document which endpoints are idempotent by default (e.g., `PUT` with full replacement).
