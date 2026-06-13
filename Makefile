.PHONY: check test lint format docs deploy help

check: ## Run all quality checks (placeholder)
	@echo "Replace this with: typecheck + lint + test + build"
	@npm run check

test: ## Run tests (placeholder)
	@npm run test

lint: ## Run linter (placeholder)
	@npm run lint

format: ## Run formatter (placeholder)
	@npm run format

docs: ## Validate documentation links (placeholder)
	@npm run docs:check

deploy: ## Deploy the project (placeholder)
	@echo "See deploy/README.md for deployment options"

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'
