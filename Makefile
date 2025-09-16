# Makefile for PyEI package - uv-based workflow

# Python version
PYTHON_VERSION = 3.11

# Virtual environment directory
VENV_DIR = .venv

# Phony targets
.PHONY: help setup install install-dev install-docs test lint format type-check clean pre-commit notebook

# Default target
help:
	@echo "Available targets:"
	@echo "  setup           - Create virtual environment and install dev dependencies"
	@echo "  install         - Install package in production mode"
	@echo "  install-dev     - Install package with dev dependencies"
	@echo "  install-docs    - Install package with docs dependencies"
	@echo "  test            - Run tests"
	@echo "  lint            - Run linting checks"
	@echo "  format          - Format code"
	@echo "  type-check      - Run type checking"
	@echo "  pre-commit      - Run pre-commit hooks"
	@echo "  notebook        - Start Jupyter notebook server"
	@echo "  clean           - Remove virtual environment and cache files"

# Setup development environment
setup:
	@echo "Setting up PyEI development environment..."
	@echo ""
	@echo "Checking prerequisites..."
	@if ! command -v uv >/dev/null 2>&1; then \
		echo "ERROR: uv is not installed. Please install it first:"; \
		echo "   curl -LsSf https://astral.sh/uv/install.sh | sh"; \
		exit 1; \
	fi
	@echo "✓ uv is installed"
	@python_version=$$(python3 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2); \
	if [ "$$(echo "$$python_version < 3.11" | bc -l 2>/dev/null || echo "1")" = "1" ] && [ "$$python_version" != "3.11" ]; then \
		echo "WARNING: Python $$python_version detected. This project requires Python 3.11+"; \
		echo "   Please upgrade to Python 3.11 or later"; \
		echo "   You can use uv to install Python 3.11: uv python install 3.11"; \
	fi
	@echo "✓ Python version check complete"
	@echo ""
	@echo "Creating virtual environment and installing dev dependencies..."
	uv sync --dev --python $(PYTHON_VERSION)
	@echo "Installing package in editable mode..."
	uv pip install -e ".[dev]"
	@echo ""
	@echo "Setting up pre-commit hooks..."
	uv run pre-commit install
	@echo ""
	@echo "Development environment setup complete!"
	@echo ""
	@echo "Next steps:"
	@echo "   1. Activate the virtual environment:"
	@echo "      source $(VENV_DIR)/bin/activate"
	@echo ""
	@echo "   2. See all available commands:"
	@echo "      make help"

# Install package in production mode
install:
	@echo "Installing PyEI in production mode..."
	uv sync --python $(PYTHON_VERSION)
	uv pip install -e .

# Install package with dev dependencies
install-dev:
	@echo "Installing PyEI with dev dependencies..."
	uv sync --dev --python $(PYTHON_VERSION)
	uv pip install -e ".[dev]"

# Install package with docs dependencies
install-docs:
	@echo "Installing PyEI with docs dependencies..."
	uv sync --extra docs --python $(PYTHON_VERSION)
	uv pip install -e ".[docs]"

# Run tests
test:
	@echo "Running tests..."
	uv run pytest -vx

# Run linting checks
lint:
	@echo "Running linting checks..."
	uv run ruff check .
	uv run ruff format --check .

# Format code
format:
	@echo "Formatting code..."
	uv run ruff format .

# Run type checking
type-check:
	@echo "Running type checking..."
	uv run mypy --ignore-missing-imports pyei

# Run all checks (lint + type-check + test)
check: lint type-check test
	@echo "All checks passed!"

# Run pre-commit hooks
pre-commit:
	@echo "Running pre-commit hooks..."
	uv run pre-commit install
	uv run pre-commit run --all-files

# Start Jupyter notebook server
notebook:
	@echo "Starting Jupyter notebook server..."
	@echo "Open http://localhost:8888 in your browser"
	uv run jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf $(VENV_DIR)
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .ruff_cache
	rm -rf .ipynb_checkpoints
	rm -rf .coverage*

# CI targets (for GitHub Actions)
ci-install:
	uv sync --dev --python $(PYTHON_VERSION)
	uv pip install -e ".[dev]"

ci-test:
	uv run pytest -vx

ci-lint:
	uv run ruff check .
	uv run ruff format --check .
