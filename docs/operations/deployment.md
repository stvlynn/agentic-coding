# Deployment

> How the project is built and deployed.

## Deployment target

- Hosting: `__HOSTING__`
- CI/CD platform: `__CI_CD__`
- Container registry: `__REGISTRY__`

## Build

```sh
__BUILD_COMMAND__
```

## Deploy

```sh
__DEPLOY_COMMAND__
```

Deployment assets (Dockerfiles, Kubernetes manifests) live in [`deploy/`](../../deploy/README.md). They are placeholders and must be adjusted to the project's actual stack and hosting environment.

## Database migrations

- Run migrations as part of the deployment pipeline.
- Back up production data before running destructive migrations.
- Migrations should be idempotent and reversible when possible.

## Rollback

- Keep the previous release available for quick rollback.
- Document the rollback command and expected recovery time.

## Health checks

- Expose a `/health` endpoint.
- Health checks should verify database connectivity and critical dependencies.
- Do not include dependency details in the public health response that could aid attackers.

## Monitoring

- Collect logs with structured JSON.
- Set up alerts for error rate, latency, and dependency failures.
- Use correlation IDs to trace requests across services.
