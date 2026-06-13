# Agentic Coding Guidelines

> Language- and framework-agnostic template for agent-driven projects.  
> Read this file first. Then follow the documentation map below before writing any code.

---

## ⚠️ Before you start

1. **Read the docs first.** Do not assume conventions; this project is documented so agents do not have to guess.
2. **Ask when boundaries are unclear.** If a requirement, layer boundary, business rule, or technology choice is ambiguous, ask the user before proceeding.
3. **Check logs and docs before inventing workarounds.** When something does not behave as expected, inspect logs, tests, and the relevant `docs/` file. Do not add fallback logic to bypass a problem you have not understood.

---

## Documentation map

### Understand the project

- [`docs/README.md`](docs/README.md) — top-level index and domain map.
- [`docs/project/README.md`](docs/project/README.md) — project overview, goals, and tech-stack placeholders.
- [`docs/project/architecture.md`](docs/project/architecture.md) — system architecture, module boundaries, and data flow.

### Write frontend code

- [`docs/frontend/README.md`](docs/frontend/README.md) — Feature-Sliced Design (FSD) entry point.
- [`docs/frontend/fsd-overview.md`](docs/frontend/fsd-overview.md) — what FSD is and why it is used here.
- [`docs/frontend/layers.md`](docs/frontend/layers.md) — responsibilities of `app`, `pages`, `widgets`, `features`, `entities`, `shared`.
- [`docs/frontend/slices.md`](docs/frontend/slices.md) — how to split code into slices.
- [`docs/frontend/segments.md`](docs/frontend/segments.md) — `ui`, `model`, `lib`, `api`, `config` segments.
- [`docs/frontend/public-api.md`](docs/frontend/public-api.md) — public API and re-export rules.
- [`docs/frontend/import-rules.md`](docs/frontend/import-rules.md) — cross-layer and cross-slice import rules.
- [`docs/frontend/ui-patterns.md`](docs/frontend/ui-patterns.md) — semantic styling, no hardcoded copy, no redundant copy.

### Write backend code

- [`docs/backend/README.md`](docs/backend/README.md) — Domain-Driven Design (DDD) entry point.
- [`docs/backend/domain.md`](docs/backend/domain.md) — entities, value objects, aggregates, domain services, domain events.
- [`docs/backend/application.md`](docs/backend/application.md) — use cases, application services, transactions, DTOs.
- [`docs/backend/infrastructure.md`](docs/backend/infrastructure.md) — persistence, external services, messaging, configuration.
- [`docs/backend/interfaces.md`](docs/backend/interfaces.md) — HTTP/CLI/event adapters, controllers, input validation.
- [`docs/backend/api-conventions.md`](docs/backend/api-conventions.md) — response format, error codes, versioning.
- [`docs/backend/database.md`](docs/backend/database.md) — database, migrations, ID strategy.
- [`docs/backend/logging.md`](docs/backend/logging.md) — logging, tracing, and masking.

### Operations and quality

- [`docs/operations/README.md`](docs/operations/README.md) — local development, CI/CD, deployment.
- [`docs/quality/README.md`](docs/quality/README.md) — testing strategy and code-review expectations.
- [`docs/decisions/README.md`](docs/decisions/README.md) — architecture decision records (ADRs).

---

## Language and quality rules

### English only for code and comments

- All source code, comments, commit messages, and internal identifiers must be written in English.
- User-facing copy must also be in English unless the user explicitly asks for another language.

### Forbidden patterns

- **No hardcoded strings.** All user-facing text must be defined in a single place (i18n keys, constants, configuration) and referenced by identifier.
- **No redundant UI copy.** Do not repeat information that is already conveyed by a title, icon, selected state, or surrounding context.
- **No duplicated implementations.** If a piece of logic already exists, reuse it or extract it to the correct layer/slice. Do not copy-paste with minor variations.
- **No fallback/clever bypass logic.** Do not mask a root cause with a default value, a silent catch, or a conditional shortcut. Face the actual problem and fix it, or ask the user.
- **No assumptions about hidden requirements.** If a feature is not documented and the intent is unclear, ask.

### When something is unclear

1. Search the current `docs/` for the topic.
2. Read the relevant layer/slice README.
3. Inspect recent logs, tests, or existing code.
4. If still unclear, ask the user with a concise, specific question.

---

## Frontend: Feature-Sliced Design (FSD)

- A page is an orchestration layer. It composes widgets and features and reads routing data. It must not contain business logic or reusable UI.
- A widget is a self-contained block of UI that belongs to a page or a feature.
- A feature owns a complete user scenario (e.g., "create order"). It contains UI, model, API, and logic that are specific to that scenario.
- An entity owns domain data and rules (e.g., `User`, `Order`). It has no UI and no HTTP client logic.
- `shared` contains framework-agnostic utilities, UI primitives, and configuration that can be used by any layer.
- Imports go only downward: `app` → `pages` → `widgets` → `features` → `entities` → `shared`.
- Each slice exposes a public API through `index.ts`. Do not import internals of another slice.

See [`docs/frontend/`](docs/frontend/README.md) for the full rules.

---

## Backend: Domain-Driven Design (DDD)

- **`domain/`** contains business rules. It has no dependencies on frameworks, databases, or transport details.
- **`application/`** contains use cases and orchestration. It depends only on `domain` and abstractions defined in `domain`.
- **`infrastructure/`** implements the abstractions from `domain` using concrete frameworks, databases, and external services.
- **`interfaces/`** adapts the application layer to the outside world (HTTP controllers, CLI commands, event handlers). It depends on `application` and `domain`.
- Dependencies point inward: `interfaces` → `application` → `domain`; `infrastructure` implements `domain` ports.
- Keep controllers thin: parse input, call an application service, format output.

See [`docs/backend/`](docs/backend/README.md) for the full rules.

---

## Self-evolution rule

After completing a task, update the documentation if the task has changed any of the following:

- Product behavior or user-facing workflows.
- Architecture, layer responsibilities, or module boundaries.
- Runtime configuration, persistence, or deployment steps.
- Testing expectations or quality gates.
- Coding conventions, style rules, or FSD/DDD boundaries.

**How to update docs:**

1. Edit the relevant existing doc in the same change set as the code.
2. If no doc exists for the new topic, create one under the correct `docs/` subdomain and add it to the nearest `README.md`.
3. Keep docs concise, factual, and example-driven. Avoid future dates, day estimates, and speculative language.
4. Do not let implementation and documentation drift.

---

## Commit conventions

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>
```

- `type`: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `build`, `ci`, `perf`, `revert`.
- `scope`: module or layer name, e.g., `frontend`, `backend`, `auth`, `orders`.
- `subject`: lowercase, concise, no trailing period.

Example: `feat(orders): add checkout use case`.

---

## `.workspace` directory

The `.workspace/` directory is for local, untracked work:

- `todo/` — long-running task progress files.
- `drafts/` — temporary notes and snippets.
- `notes/` — analysis and research.

Create a todo file for long tasks and mark items with `[ ]` / `[x]`. Clean up when done.

---

## Planning documents

- ❌ Do not use concrete dates ("2026-01-31").
- ❌ Do not estimate durations ("3 days", "Week 1").
- ✅ Describe task order and dependencies only.
- ✅ Use priorities `P0/P1/P2` to indicate importance.
