# Local Development

> How to set up and run the project locally.

## Prerequisites

- Runtime: `__RUNTIME_VERSION__`
- Package manager: `__PACKAGE_MANAGER__`
- Database: `__DATABASE__`
- Cache: `__CACHE__`

## Setup

1. Clone the repository.
2. Copy `.env.example` to `.env` and fill in values.
3. Install dependencies: `__INSTALL_COMMAND__`
4. Run database migrations: `__MIGRATE_COMMAND__`
5. Start the backend: `__START_BACKEND__`
6. Start the frontend: `__START_FRONTEND__`

## Environment variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | yes | Database connection string. |
| `PORT` | no | Port for the backend server. Defaults to `3000`. |
| `LOG_LEVEL` | no | Log level. Defaults to `info`. |

## Running tests

```sh
__TEST_COMMAND__
```

## Linting and formatting

```sh
__LINT_COMMAND__
```

## Common issues

Document common local-development issues here as they are discovered.
