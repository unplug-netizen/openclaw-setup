---
name: code-quality
description: Run linters, formatters, and type checkers to ensure code quality. Use when checking code style, running linting, formatting code, or performing static analysis.
---

# Code Quality

Run linters, formatters, and type checkers to maintain code quality.

## Supported Tools

- **JavaScript/TypeScript**: ESLint, Prettier, TypeScript compiler
- **Python**: Ruff, Black, isort, mypy
- **Rust**: clippy, rustfmt
- **Go**: gofmt, golint, go vet

## Capabilities

- Check code style and conventions
- Auto-format code
- Run static analysis
- Type checking
- Fix auto-fixable issues

## Usage

```bash
# JavaScript/TypeScript
npx eslint .
npx eslint . --fix
npx prettier --check .
npx prettier --write .
npx tsc --noEmit

# Python
ruff check .
ruff check . --fix
black --check .
black .
mypy .

# Rust
cargo clippy
cargo fmt --check
cargo fmt

# Go
gofmt -d .
go vet ./...
```

## Scripts

- `lint-check.sh` - Run all linters and report issues
- `format-fix.sh` - Auto-fix all formatting issues
