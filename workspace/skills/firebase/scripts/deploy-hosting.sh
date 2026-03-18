#!/bin/bash
# deploy-hosting.sh - Deploy to Firebase Hosting with validation

set -e

echo "=== Firebase Hosting Deploy ==="
echo ""

# Check if firebase.json exists
if [ ! -f "firebase.json" ]; then
    echo "Error: firebase.json not found. Run 'firebase init' first."
    exit 1
fi

# Check if build exists (common for SPAs)
if [ -d "dist" ]; then
    echo "Found dist/ directory"
elif [ -d "build" ]; then
    echo "Found build/ directory"
elif [ -d "public" ]; then
    echo "Found public/ directory"
else
    echo "Warning: No dist/, build/, or public/ directory found."
    echo "Make sure your build output is configured in firebase.json"
fi

# Validate Firebase project
PROJECT=$(firebase projects:list --json 2>/dev/null | grep -o '"projectId":"[^"]*"' | head -1 | cut -d'"' -f4)
if [ -z "$PROJECT" ]; then
    echo "Error: No Firebase project configured. Run 'firebase use --add'"
    exit 1
fi

echo "Deploying to project: $PROJECT"
echo ""

# Deploy
firebase deploy --only hosting "$@"

echo ""
echo "Deploy complete!"
