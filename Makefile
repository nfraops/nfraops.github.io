.PHONY: help install serve build clean deploy docker-build docker-run adr-new pre-commit-install pre-commit-run pre-commit-update

help: ## Show this help message
	@echo "Available targets:"
	@echo "  help           Show this help message"
	@echo "  install        Install dependencies using Poetry"
	@echo "  serve          Start local development server"
	@echo "  build          Build production site"
	@echo "  clean          Remove build artifacts"
	@echo "  deploy         Deploy to GitHub Pages (manual)"
	@echo "  docker-build   Build Docker image"
	@echo "  docker-run     Run MkDocs in Docker container"
	@echo "  adr-new        Create new Architecture Decision Record"
	@echo "  pre-commit-install Install pre-commit hooks"
	@echo "  pre-commit-run   Run pre-commit hooks manually"
	@echo "  pre-commit-update Update pre-commit hooks"

install: ## Install dependencies using Poetry
	poetry install

serve: ## Start local development server
	poetry run mkdocs serve --dev-addr=127.0.0.1:$(PORT)

build: ## Build production site
	poetry run mkdocs build --strict

clean: ## Remove build artifacts
	rm -rf site/ public/

deploy: ## Deploy to GitHub Pages (manual deployment)
	poetry run mkdocs gh-deploy --force

docker-build: ## Build Docker image for development
	docker build -t nfraops-mkdocs:dev .

docker-run: ## Run MkDocs development server in Docker container
	docker run --rm -v $(PWD):/app -p $(PORT):8000 nfraops-mkdocs:dev

adr-new: ## Create new Architecture Decision Record
	@if [ -z "$(TITLE)" ]; then \
		echo "Error: TITLE parameter required"; \
		echo "Usage: make adr-new TITLE='Your Decision Title'"; \
		exit 1; \
	fi
	./bin/adr-new "$(TITLE)"

pre-commit-install: ## Install pre-commit hooks
	poetry run pre-commit install

pre-commit-run: ## Run pre-commit hooks manually
	poetry run pre-commit run --all-files

pre-commit-update: ## Update pre-commit hooks
	poetry run pre-commit autoupdate

PORT ?= 8000
TAG ?= dev
MESSAGE ?= Update site
