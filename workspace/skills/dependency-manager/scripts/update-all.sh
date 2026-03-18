#!/bin/bash
# update-all.sh - Update all dependencies safely

set -e

echo "=== Updating Dependencies ==="
echo ""

# Node.js
if [ -f "package.json" ]; then
    echo "Checking for outdated npm packages..."
    npm outdated 2>&1 || true
    echo ""
    
    read -p "Update npm packages? (y/N): " confirm
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        npm update
        echo "npm packages updated."
    fi
    echo ""
fi

# Python
if [ -f "requirements.txt" ]; then
    echo "Python requirements.txt detected."
    echo "To update: pip install --upgrade -r requirements.txt"
    echo ""
fi

# Rust
if [ -f "Cargo.toml" ]; then
    echo "Checking for Rust updates..."
    cargo update --dry-run 2>&1 | head -20 || true
    echo ""
    
    read -p "Update Cargo dependencies? (y/N): " confirm
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        cargo update
        echo "Cargo dependencies updated."
    fi
    echo ""
fi

echo "Update check complete."
