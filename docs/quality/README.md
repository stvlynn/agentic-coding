# Quality

This section defines testing strategy, code-review expectations, and quality gates.

## Documents

- [`testing.md`](testing.md) — testing strategy and test types.
- [`code-review.md`](code-review.md) — code-review checklist.

## Quality principles

- Tests must be deterministic.
- Tests must run quickly enough to be executed on every change.
- Code review is required before merging to the main branch.
- Static analysis (lint, type check, formatting) must pass before merge.

## Definition of done

- Feature is implemented according to the documented architecture.
- Unit tests cover domain logic and critical paths.
- Integration tests cover repository and external-service boundaries.
- Documentation is updated if behavior or conventions changed.
- No hardcoded strings, redundant copy, duplicated code, or fallback cleverness.
