# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2025-09-25

### Added
- Better code organization with proper private function naming

### Changed
- **BREAKING**: Renamed internal helper functions to follow Python private function conventions (leading underscore)
- **BREAKING**: Converted all relative imports to absolute imports within the package
- **BREAKING**: Removed `__all__` specifiers from all module files
- Improved code maintainability and organization

### Migration Required
- Update any direct imports of renamed private functions
- Replace wildcard imports with explicit imports
- See [MIGRATION_NOTES.md](MIGRATION_NOTES.md) for detailed migration instructions

## [1.2.0] - 2025-09-11

### Changed
- Migrated from Docker-based development to `uv`-based workflow
- Updated build system from `setup.py` to `pyproject.toml`
- Consolidated CI/CD workflows into a single file
- Updated CI/CD to test against Python 3.11, 3.12, and 3.13

### Removed
- Docker support and related files
- `setup.py` and `requirements.txt` files
- Separate GitHub Actions workflow files


