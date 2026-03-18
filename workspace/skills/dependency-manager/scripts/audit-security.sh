#!/bin/bash
# audit-security.sh - Run security audit on dependencies

set -e

echo "=== Security Audit ==="
echo ""

# Node.js
if [ -f "package.json" ]; then
    echo "Running npm audit..."
    npm audit 2>&1 | head -50 || true
    echo ""
    
    if command -v yarn &> /dev/null && [ -f "yarn.lock" ]; then
        echo "Running yarn audit..."
        yarn audit 2>&1 | head -30 || true
        echo ""
    fi
fi

# Python
if command -v pip-audit &> /dev/null; then
    echo "Running pip-audit..."
    pip-audit 2>&1 | head -50 || true
    echo ""
elif [ -f "requirements.txt" ]; then
    echo "pip-audit not installed. Install with: pip install pip-audit"
fi

# Rust
if command -v cargo-audit &> /dev/null; then
    echo "Running cargo audit..."
    cargo audit 2>&1 | head -50 || true
    echo ""
elif [ -f "Cargo.toml" ]; then
    echo "cargo-audit not installed. Install with: cargo install cargo-audit"
fi

echo "Audit complete."
