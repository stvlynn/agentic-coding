# Logging

This document defines logging, tracing, and observability conventions.

## Requirements

- All logs must be structured (JSON in production).
- Logs must include a correlation/request ID.
- Logs must be written in English.
- Sensitive data must be masked.

## Log levels

| Level | Use |
|-------|-----|
| `debug` | Detailed diagnostic information. Off by default in production. |
| `info` | Significant business events (request handled, order placed). |
| `warn` | Recoverable problems or unexpected but handled states. |
| `error` | Failures that require attention. |

## What to log

- Request start/end with method, path, status, and duration.
- Business events that matter for debugging or auditing.
- External service calls with duration and outcome.
- Errors with context, but without sensitive payloads.

## What not to log

- Passwords, tokens, API keys, credit card numbers, or personal identifiers.
- Full request/response bodies that contain user data.
- Stack traces in production error responses (log them internally instead).

## Masking

Mask sensitive fields with a consistent pattern:

```json
{
  "email": "u***@example.com",
  "phone": "+1-***-****-1234"
}
```

## Tracing

- Propagate a correlation ID across all layers.
- Include the correlation ID in every log entry.
- Pass the correlation ID to external service calls when possible.

## Errors

- Log unexpected errors with full context.
- Do not swallow errors with silent `catch` blocks.
- Translate low-level errors into domain/application errors before exposing them to interfaces.
