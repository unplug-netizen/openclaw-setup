---
name: testing
description: Run tests, analyze results, and interpret test output for various testing frameworks. Use when executing test suites, parsing test results, identifying failures, or working with test-driven development workflows.
---

# Testing

Run tests and analyze results across different testing frameworks.

## Supported Frameworks

- **JavaScript/TypeScript**: Jest, Mocha, Vitest, Playwright
- **Python**: pytest, unittest
- **Rust**: cargo test
- **Go**: go test

## Capabilities

- Run test suites and capture output
- Parse test results (pass/fail counts)
- Identify failing tests and error locations
- Run specific test files or patterns
- Generate coverage reports

## Usage

```bash
# JavaScript/TypeScript
npm test
npx jest <pattern>
npx vitest run

# Python
pytest
pytest -xvs <file>
pytest --tb=short

# Rust
cargo test
cargo test <pattern>

# Go
go test ./...
go test -v <package>
```

## Interpreting Results

Look for:
- **PASS/FAIL** counts
- **Error messages** and stack traces
- **Assertion failures**
- **Timeout issues**

## Scripts

- `run-tests.sh` - Run tests with formatted output
- `failed-tests.sh` - List only failed tests
