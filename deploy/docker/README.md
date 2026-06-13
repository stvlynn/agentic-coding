# docker

This directory is a placeholder for Docker assets.

## Adjust to your project

Add the following files as needed:

- `Dockerfile` — image build instructions for the application.
- `Dockerfile.frontend` / `Dockerfile.backend` — if frontend and backend are built separately.
- `docker-compose.yml` — local orchestration of app, database, cache, etc.
- `.dockerignore` — exclude `node_modules`, `.git`, build output, etc.

## Notes

- Use multi-stage builds to keep production images small.
- Do not bake secrets into images.
- Keep root images minimal; run the app as a non-root user when possible.
