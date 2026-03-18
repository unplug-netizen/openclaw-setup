#!/bin/bash
# safe-commit.sh - Commit with pre-validation

set -e

MESSAGE="$1"
if [ -z "$MESSAGE" ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

# Check if there are changes to commit
if git diff --cached --quiet && git diff --quiet; then
    echo "No changes to commit"
    exit 0
fi

# Auto-stage if nothing staged
if git diff --cached --quiet; then
    echo "Auto-staging all changes..."
    git add -A
fi

# Commit
git commit -m "$MESSAGE"
echo "Committed: $MESSAGE"
