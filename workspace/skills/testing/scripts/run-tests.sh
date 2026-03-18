#!/bin/bash
# run-tests.sh - Run tests with formatted output

set -e

# Detect test framework
if [ -f "jest.config.js" ] || [ -f "jest.config.ts" ] || grep -q "jest" package.json 2>/dev/null; then
    echo "=== Running Jest Tests ==="
    npx jest --colors "$@"
elif [ -f "vitest.config.ts" ] || [ -f "vitest.config.js" ] || grep -q "vitest" package.json 2>/dev/null; then
    echo "=== Running Vitest Tests ==="
    npx vitest run --color "$@"
elif [ -f "pytest.ini" ] || [ -f "pyproject.toml" ] && grep -q "pytest" pyproject.toml 2>/dev/null; then
    echo "=== Running pytest ==="
    pytest -v --tb=short --color=yes "$@"
elif [ -f "Cargo.toml" ]; then
    echo "=== Running Cargo Tests ==="
    cargo test --color=always "$@" 2>&1 | head -100
elif [ -f "go.mod" ]; then
    echo "=== Running Go Tests ==="
    go test -v ./... "$@" 2>&1 | head -100
else
    echo "Unknown test framework. Trying npm test..."
    npm test
fi
