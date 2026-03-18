#!/bin/bash
# cleanup-deps.sh - Clean up unused dependencies

set -e

echo "=== Dependency Cleanup ==="
echo ""

# Node.js
if [ -f "package.json" ]; then
    echo "Cleaning npm cache..."
    npm cache clean --force 2>&1 || true
    
    echo "Removing node_modules..."
    rm -rf node_modules
    
    echo "Reinstalling dependencies..."
    npm install
    
    echo "Checking for unused dependencies..."
    if command -v depcheck &> /dev/null; then
        depcheck 2>&1 | head -30 || true
    else
        echo "Install depcheck for unused dependency detection: npm install -g depcheck"
    fi
    echo ""
fi

# Python
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    echo "Python cleanup:"
    echo "- Remove __pycache__: find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true"
    echo "- Remove .pyc files: find . -name '*.pyc' -delete 2>/dev/null || true"
    echo ""
fi

echo "Cleanup complete."
