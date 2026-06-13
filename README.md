# Agentic Coding Template

A language- and framework-agnostic template for projects that are driven by coding agents.

Any agent that opens this repository should start with **`AGENTS.md`** (or `CLAUDE.md` — they are the same file). It contains the ground rules, documentation map, and evolution policy.

## Documentation map

- [`docs/`](docs/README.md) — top-level documentation index.
- [`docs/project/`](docs/project/README.md) — project overview, architecture, and boundaries.
- [`docs/frontend/`](docs/frontend/README.md) — **Feature-Sliced Design (FSD)** conventions.
- [`docs/backend/`](docs/backend/README.md) — **Domain-Driven Design (DDD)** layered conventions.
- [`docs/operations/`](docs/operations/README.md) — development, CI/CD, and deployment guides.
- [`docs/quality/`](docs/quality/README.md) — testing and code-review expectations.
- [`docs/decisions/`](docs/decisions/README.md) — architecture decision records (ADRs).
- [`deploy/`](deploy/README.md) — deployment assets (Docker, Kubernetes) to be adjusted per project.

## For agents

1. Read `AGENTS.md` first.
2. Read the relevant section of `docs/` before writing code.
3. When a boundary is unclear, ask the user before making assumptions.
4. After completing a task, update or add `docs/` if the implementation changes behavior, architecture, or conventions.

## Human quick start

Copy this repository, replace placeholders in `docs/project/architecture.md`, and start adding your own code under the FSD/DDD structure described in the docs.
