# Migration Notes: Docker → uv + Virtual Environments

This document explains the modernization changes made to the development workflow.

## Changes Made

### Replaced Docker with uv Virtual Environments
- **Removed**: `Dockerfile` and Docker-based workflow
- **Added**: `uv`-based virtual environment workflow
- **Updated**: Python requirement from 3.10 to 3.11

### Modernized Package Management
- **Removed**: `setup.py` (replaced with `pyproject.toml`)
- **Replaced**: `requirements.txt` and `requirements-dev.txt` → dependency groups in `pyproject.toml`
- **Updated**: Build system from `setuptools` to `hatchling`
- **Added**: `uv.lock` for exact reproducibility
- **Replaced**: `pip` → `uv` (faster, more reliable)
- **Replaced**: `black` + `pylint` → `ruff` (faster, unified)

### Consolidated CI/CD Workflow
- **Consolidated**: Multiple workflow files → single `ci.yml`
- **Updated**: Uses Makefile targets for consistency
- **New structure**:
  - Linting runs on all commits (push and PR)
  - Testing runs only on PRs (non-draft only)
  - Publishing runs only on pushes to main

## Command Equivalents

| Old Command | New Command |
|-------------|-------------|
| `make build` | `make setup` |
| `make test` (Docker) | `make test` (uv) |
| `make lint` (Docker) | `make lint` (uv) |
| `make bash` (Docker) | `source .venv/bin/activate` |
| `pip install -e .` | `uv pip install -e .` |
| `pip install -r requirements-dev.txt` | `uv pip install -e ".[dev]"` |

## For Contributors

### Development Setup
```bash
make setup          # Create venv and install dev dependencies
source .venv/bin/activate  # Activate virtual environment
make test           # Run tests
make lint           # Run linting
make format         # Format code
```

### Direct uv Commands
```bash
uv run pytest       # Run tests
uv run ruff check   # Lint code
uv run ruff format  # Format code
uv run mypy pyei    # Type checking
```

### Dependency Management
```bash
uv pip list         # Show installed packages
uv lock --upgrade   # Update lock file
```

## Publishing

To publish a new version:
1. Update the version in `pyproject.toml`
2. Commit and push to main
3. The CI/CD workflow automatically publishes to PyPI


## Backward Compatibility

- All functionality is preserved, just modernized
- Virtual environments ensure consistent environments across machines
- No Docker dependency required
- Same development experience, better performance
