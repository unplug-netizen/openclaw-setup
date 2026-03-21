#!/bin/bash
# issue-from-template.sh - Create GitHub issue from template

set -e

TEMPLATE="$1"
TITLE="$2"

if [ -z "$TITLE" ]; then
    echo "Usage: $0 <template-file> <title>"
    exit 1
fi

if [ ! -f "$TEMPLATE" ]; then
    echo "Template not found: $TEMPLATE"
    exit 1
fi

BODY=$(cat "$TEMPLATE")
gh issue create --title "$TITLE" --body "$BODY"
