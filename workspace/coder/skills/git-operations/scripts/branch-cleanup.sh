#!/bin/bash
# branch-cleanup.sh - Remove merged local branches

set -e

echo "Fetching latest changes..."
git fetch --prune

echo ""
echo "Merged branches (excluding current):"
git branch --merged | grep -v '^\*' | grep -v 'main\|master' || true

echo ""
read -p "Delete these branches? (y/N): " confirm
if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    git branch --merged | grep -v '^\*' | grep -v 'main\|master' | xargs -r git branch -d
    echo "Branches deleted."
else
    echo "Cancelled."
fi
