#!/bin/bash
# detect-project.sh - Detect project type and available commands

set -e

echo "=== Project Detection ==="
echo ""

# Node.js
if [ -f "package.json" ]; then
    echo "Type: Node.js"
    echo "Package Manager: $(test -f "yarn.lock" && echo "yarn" || echo "npm")"
    echo ""
    echo "Available scripts:"
    node -e "const pkg = require('./package.json'); Object.entries(pkg.scripts || {}).forEach(([k,v]) => console.log('  ' + k + ': ' + v));" 2>/dev/null || cat package.json | grep -A 20 '"scripts"'
    exit 0
fi

# Python
if [ -f "pyproject.toml" ] || [ -f "setup.py" ] || [ -f "requirements.txt" ]; then
    echo "Type: Python"
    [ -f "pyproject.toml" ] && echo "Config: pyproject.toml"
    [ -f "setup.py" ] && echo "Config: setup.py"
    [ -f "requirements.txt" ] && echo "Config: requirements.txt"
    [ -f "Pipfile" ] && echo "Package Manager: pipenv"
    [ -f "poetry.lock" ] && echo "Package Manager: poetry"
    exit 0
fi

# Rust
if [ -f "Cargo.toml" ]; then
    echo "Type: Rust"
    echo "Commands: cargo build, cargo test, cargo run"
    exit 0
fi

# Go
if [ -f "go.mod" ]; then
    echo "Type: Go"
    echo "Commands: go build, go test, go run"
    exit 0
fi

# Make
if [ -f "Makefile" ] || [ -f "makefile" ]; then
    echo "Type: Make project"
    echo ""
    echo "Available targets:"
    make -p 2>/dev/null | grep -E '^[a-zA-Z_-]+:' | head -20 || true
    exit 0
fi

# Docker
if [ -f "Dockerfile" ]; then
    echo "Type: Docker"
    echo "Commands: docker build, docker compose up"
    exit 0
fi

echo "Type: Unknown"
echo "No recognizable project files found."
