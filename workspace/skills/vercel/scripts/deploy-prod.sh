#!/bin/bash
# deploy-prod.sh - Deploy to Vercel production with validation

set -e

echo "=== Vercel Production Deploy ==="
echo ""

# Check if logged in
if ! vercel whoami &> /dev/null; then
    echo "Error: Not logged in to Vercel. Run: vercel login"
    exit 1
fi

echo "Logged in as: $(vercel whoami)"

# Check for vercel.json or vercel config in package.json
if [ -f "vercel.json" ]; then
    echo "Found vercel.json"
elif [ -f "package.json" ] && grep -q "vercel" package.json 2>/dev/null; then
    echo "Found Vercel config in package.json"
fi

# Check build output directory
if [ -d "dist" ]; then
    echo "Build output: dist/"
elif [ -d "build" ]; then
    echo "Build output: build/"
elif [ -d ".next" ]; then
    echo "Build output: .next/ (Next.js detected)"
fi

echo ""
read -p "Deploy to production? (y/N): " confirm
if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    echo "Deploying to production..."
    vercel --prod --yes
    echo ""
    echo "Production deploy complete!"
else
    echo "Cancelled."
fi
