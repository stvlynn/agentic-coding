# Deploy

This directory contains deployment assets. All files here are **templates** and must be adjusted to the actual project stack, registry, and hosting environment.

## Subdirectories

- [`docker/`](docker/README.md) — Docker images and compose files.
- [`k8s/`](k8s/README.md) — Kubernetes manifests.

## How to use

1. Choose the deployment target for your project.
2. Copy and modify the files under `docker/` or `k8s/`.
3. Update image names, ports, environment variables, resource limits, and secrets.
4. Document any project-specific deployment steps here.

## What does not belong here

- Source code.
- CI/CD pipeline definitions (those live in `.github/workflows/`).
- Operational runbooks (those live in [`docs/operations/`](../docs/operations/README.md)).
