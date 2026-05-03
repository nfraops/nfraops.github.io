# NFRAOPS GitHub.io

[![Build](https://github.com/nfraops/nfraops.github.io/actions/workflows/mkdocs.yml/badge.svg)](https://github.com/nfraops/nfraops.github.io/actions/workflows/mkdocs.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![MkDocs](https://img.shields.io/badge/MkDocs-1.6.1-blue.svg)](https://www.mkdocs.org/)
[![Material](https://img.shields.io/badge/Theme-9.7.6-26A69A.svg)](https://squidfunk.github.io/mkdocs-material/)

GitHub organization website built with MkDocs, featuring a ClickHouse-inspired dark theme.

## Quick Start

### Prerequisites

- Python 3.11+
- [pyenv](https://github.com/pyenv/pyenv) for Python version management
- [Poetry](https://python-poetry.org/) for dependency management
- Make (for using Makefile targets)

### Local Development

```bash
# Clone repository
git clone https://github.com/nfraops/nfraops.github.io.git
cd nfraops.github.io

# Create pyenv environment (optional, for local development)
pyenv virtualenv 3.11.10 nfraops-mkdocs

# Install dependencies
make install

# Serve locally
make serve
```

Site available at http://127.0.0.1:8000

### Docker Development

```bash
# Build Docker image
make docker-build

# Run in container
make docker-run
```

### Pre-commit Hooks (Optional)

```bash
# Install pre-commit hooks
make pre-commit-install

# Run pre-commit hooks manually
make pre-commit-run

# Update pre-commit hooks
make pre-commit-update
```

## Features

- **MkDocs 1.6.1** static documentation site
- **Material Theme 9.7.6** with ClickHouse-inspired dark theme
- **Poetry 2.x** for Python dependency management
- **pyenv** for Python version management
- **Automated deployment** to GitHub Pages via GitHub Actions
- **Docker** support for containerized development
- **PlantUML** diagram support
- **Architecture Decision Records** (ADRs) system

## Makefile Targets

```bash
make help       # Show all available targets
make install    # Install dependencies
make serve      # Start local development server
make build      # Build production site
make clean      # Remove build artifacts
make deploy     # Deploy to GitHub Pages (manual)
make docker-build  # Build Docker image
make docker-run   # Run MkDocs in Docker container
make adr-new    # Create new Architecture Decision Record
```

## Troubleshooting

### Poetry not found

Install Poetry globally:
```bash
curl -sSL https://install.python-poetry.org | python3 -
```

### Python version mismatch

Ensure you have Python 3.11 installed:
```bash
pyenv install 3.11.10
pyenv local 3.11.10
```

### Build fails with strict mode

Check for broken links or missing files:
```bash
make build
```

### Docker build fails

Ensure Docker is running and you have sufficient disk space.

## Project Structure

```
.
├── docs/                  # Documentation content
│   ├── index.md          # Homepage
│   ├── architecture/     # Architecture documentation
│   ├── diagrams/         # PlantUML diagrams
│   └── elements/         # Markdown element guides
├── overrides/            # Theme customization
│   └── assets/stylesheets/extra.css  # ClickHouse theme
├── bin/                  # Utility scripts
├── .github/workflows/    # GitHub Actions CI/CD
├── mkdocs.yml           # MkDocs configuration
├── pyproject.toml       # Poetry dependencies
├── Dockerfile           # Docker container definition
└── Makefile             # Build automation
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT
