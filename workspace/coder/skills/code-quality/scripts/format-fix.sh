#!/bin/bash
# format-fix.sh - Auto-fix all formatting issues

set -e

echo "=== Auto-fixing Code ==="
echo ""

# JavaScript/TypeScript
if [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ] || [ -f "eslint.config.js" ] || grep -q "eslint" package.json 2>/dev/null; then
    echo "Running ESLint fix..."
    npx eslint . --ext .js,.jsx,.ts,.tsx --fix 2>&1 | head -30 || true
    echo ""
fi

if [ -f ".prettierrc" ] || [ -f ".prettierrc.json" ] || grep -q "prettier" package.json 2>/dev/null; then
    echo "Running Prettier fix..."
    npx prettier --write . 2>&1 | head -30 || true
    echo ""
fi

# Python
if [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    if command -v ruff &> /dev/null; then
        echo "Running Ruff fix..."
        ruff check . --fix 2>&1 | head -30 || true
        echo ""
    fi
    
    if command -v black &> /dev/null; then
        echo "Running Black..."
        black . 2>&1 | head -30 || true
        echo ""
    fi
fi

# Rust
if [ -f "Cargo.toml" ]; then
    echo "Running cargo fmt..."
    cargo fmt 2>&1 || true
    echo ""
fi

# Go
if [ -f "go.mod" ]; then
    echo "Running gofmt..."
    gofmt -w . 2>&1 || true
    echo ""
fi

echo "Done!"
