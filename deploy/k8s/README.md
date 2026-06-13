# k8s

This directory is a placeholder for Kubernetes manifests.

## Adjust to your project

Add the following manifests as needed:

- `namespace.yml`
- `deployment.yml`
- `service.yml`
- `ingress.yml`
- `configmap.yml`
- `secret.yml`
- `hpa.yml` — horizontal pod autoscaler.

## Notes

- Use a templating tool (Helm, Kustomize) if the same manifests are deployed to multiple environments.
- Store secrets in a secrets manager; do not commit raw credentials.
- Define resource requests and limits for every container.
