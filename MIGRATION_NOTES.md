# Migration Notes: Scripts → Makefile + Docker

This document explains the modernization changes made to the development workflow.

## Changes Made

### Replaced Scripts with Makefile
- **Removed**: `scripts/lint.sh`, `scripts/test.sh`, `scripts/lint_and_test.sh`
- **Added**: Comprehensive Makefile with Docker and local targets

### Modernized Dependencies
- **Replaced**: `pip` → `uv` (faster, more reliable)
- **Replaced**: `black` + `pylint` → `ruff` (faster, unified)
- **Added**: Pinned versions in `requirements.txt` and `requirements-dev.txt`
- **Added**: Complete lock file `requirements.lock`

### Updated CI/CD
- **Updated**: `.github/workflows/python-package.yml` to use `uv` and direct commands
- **Added**: Alternative Makefile-based workflow option

## Command Equivalents

| Old Command | New Command |
|-------------|-------------|
| `./scripts/lint.sh` | `make lint` (Docker) or `make ci-lint` (local) |
| `./scripts/test.sh` | `make test` (Docker) or `make ci-test` (local) |
| `./scripts/lint_and_test.sh` | `make lint test` or `make lint-and-test` |

## For Contributors

### Docker Development (Recommended)
```bash
make help          # See all available commands
make test          # Run tests
make lint          # Run linting
make bash          # Interactive development session
```

### Local Development
```bash
make install       # Set up local environment
make ci-lint       # Run linting locally
make ci-test       # Run tests locally
```

### Requirements Management
```bash
make freeze-requirements    # Show current versions
make update-requirements   # Update lock file
```

## Backward Compatibility

- The publishing workflow remains unchanged
- All functionality is preserved, just modernized
- New setup is faster and more reliable
- Docker ensures consistent environments across machines
