#!/bin/bash
# pr-create.sh - Create a pull request with sensible defaults

set -e

BRANCH=$(git branch --show-current)
BASE="${1:-main}"
TITLE="${2:-$(git log -1 --pretty=%s)}"

echo "Creating PR from '$BRANCH' to '$BASE'"
echo "Title: $TITLE"
echo ""

# Push branch if not on remote
if ! git branch -r | grep -q "origin/$BRANCH"; then
    echo "Pushing branch to origin..."
    git push -u origin "$BRANCH"
fi

# Create PR
gh pr create --base "$BASE" --title "$TITLE" --fill "$@"
