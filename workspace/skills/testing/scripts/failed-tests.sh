#!/bin/bash
# failed-tests.sh - List only failed tests

set -e

echo "=== Failed Tests ==="
echo ""

# Jest
if [ -f "jest.config.js" ] || grep -q "jest" package.json 2>/dev/null; then
    npx jest --silent 2>&1 | grep -A 5 "FAIL\|✕" || echo "All tests passed!"
    exit 0
fi

# pytest
if [ -f "pytest.ini" ] || grep -q "pytest" pyproject.toml 2>/dev/null; then
    pytest --tb=line -q 2>&1 | grep -E "FAILED|ERROR" || echo "All tests passed!"
    exit 0
fi

# Cargo
if [ -f "Cargo.toml" ]; then
    cargo test 2>&1 | grep -A 3 "FAILED\|failures:" || echo "All tests passed!"
    exit 0
fi

# Go
if [ -f "go.mod" ]; then
    go test ./... 2>&1 | grep -E "FAIL|---" || echo "All tests passed!"
    exit 0
fi

echo "Could not detect test framework"
