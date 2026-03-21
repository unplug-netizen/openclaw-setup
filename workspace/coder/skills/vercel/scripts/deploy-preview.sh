#!/bin/bash
# deploy-preview.sh - Create Vercel preview deployment

set -e

echo "=== Vercel Preview Deploy ==="
echo ""

# Check if logged in
if ! vercel whoami &> /dev/null; then
    echo "Error: Not logged in to Vercel. Run: vercel login"
    exit 1
fi

# Deploy preview
echo "Creating preview deployment..."
vercel --yes

echo ""
echo "Preview deploy complete!"
echo "Share the URL above for review."
