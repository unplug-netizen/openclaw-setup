#!/bin/bash
# lint-check.sh - Run all linters and report issues

set -e

ERRORS=0

echo "=== Code Quality Check ==="
echo ""

# JavaScript/TypeScript
if [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ] || [ -f "eslint.config.js" ] || grep -q "eslint" package.json 2>/dev/null; then
    echo "Running ESLint..."
    npx eslint . --ext .js,.jsx,.ts,.tsx 2>&1 | head -50 || ERRORS=$((ERRORS + 1))
    echo ""
fi

if [ -f ".prettierrc" ] || [ -f ".prettierrc.json" ] || grep -q "prettier" package.json 2>/dev/null; then
    echo "Running Prettier check..."
    npx prettier --check . 2>&1 | head -30 || ERRORS=$((ERRORS + 1))
    echo ""
fi

if [ -f "tsconfig.json" ]; then
    echo "Running TypeScript check..."
    npx tsc --noEmit 2>&1 | head -30 || ERRORS=$((ERRORS + 1))
    echo ""
fi

# Python
if [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    if command -v ruff &> /dev/null; then
        echo "Running Ruff..."
        ruff check . 2>&1 | head -50 || ERRORS=$((ERRORS + 1))
        echo ""
    fi
    
    if command -v mypy &> /dev/null; then
        echo "Running mypy..."
        mypy . 2>&1 | head -30 || ERRORS=$((ERRORS + 1))
        echo ""
    fi
fi

# Rust
if [ -f "Cargo.toml" ]; then
    echo "Running Clippy..."
    cargo clippy 2>&1 | grep -E "error|warning" | head -30 || true
    echo ""
fi

# Go
if [ -f "go.mod" ]; then
    echo "Running go vet..."
    go vet ./... 2>&1 | head -30 || ERRORS=$((ERRORS + 1))
    echo ""
fi

if [ $ERRORS -gt 0 ]; then
    echo "Found issues. Run format-fix.sh to auto-fix where possible."
    exit 1
else
    echo "All checks passed!"
fi
