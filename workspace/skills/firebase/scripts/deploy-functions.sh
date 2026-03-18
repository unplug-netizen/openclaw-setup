#!/bin/bash
# deploy-functions.sh - Deploy Cloud Functions with checks

set -e

echo "=== Firebase Functions Deploy ==="
echo ""

# Check if functions directory exists
if [ ! -d "functions" ]; then
    echo "Error: functions/ directory not found."
    exit 1
fi

# Check if package.json exists in functions
if [ ! -f "functions/package.json" ]; then
    echo "Error: functions/package.json not found."
    exit 1
fi

# Install dependencies if node_modules missing
if [ ! -d "functions/node_modules" ]; then
    echo "Installing function dependencies..."
    cd functions && npm install && cd ..
fi

# Deploy
echo "Deploying functions..."
firebase deploy --only functions "$@"

echo ""
echo "Functions deployed!"
echo "View logs: firebase functions:log"
