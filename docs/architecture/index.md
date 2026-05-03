# Architecture

This section contains architecture documentation and design decisions for the NFRAOPS infrastructure.

## Sections

- [Decisions](decisions/index.md) - Architecture Decision Records (ADRs)

## Overview

The NFRAOPS infrastructure is designed with simplicity and automation in mind:
- Static documentation websites for knowledge sharing
- Git-native deployment workflows
- Containerized development environments
- Poetry-driven Python tooling

## Key Principles

1. **Simplicity First**: All systems remain simple, clear, and compact
2. **Git-Native**: Deployments happen through Git workflows
3. **Automation**: Common operations exposed as Makefile targets
4. **Modern Python**: Uses Poetry for dependency management and Python 3.11+
