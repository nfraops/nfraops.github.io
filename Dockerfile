# Multi-stage build for NFRAOPS MkDocs development container
FROM python:3.11-slim AS builder

# Install Poetry globally
RUN pip install --no-cache-dir poetry==2.1.3

# Set Poetry configuration for containerized builds
RUN poetry config virtualenvs.create false

WORKDIR /app

# Copy Python version files
COPY .python-version .python-version.override ./

# Copy dependency files
COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry install --no-root --no-dev --only-root && \
    poetry install --no-dev

# Development stage
FROM python:3.11-slim AS development

# Install Poetry globally
RUN pip install --no-cache-dir poetry==2.1.3

# Set Poetry configuration
RUN poetry config virtualenvs.create false

WORKDIR /app

# Copy Python version files
COPY .python-version .python-version.override ./

# Copy dependency files
COPY pyproject.toml poetry.lock ./

# Install all dependencies (including dev)
RUN poetry install --no-root --only-root

# Copy project files
COPY . .

# Expose MkDocs default port
EXPOSE 8000

# Default command: run MkDocs development server
CMD ["poetry", "run", "mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
