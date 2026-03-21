#!/bin/bash
# vercel-status.sh - Check Vercel project status

set -e

echo "=== Vercel Project Status ==="
echo ""

# Check CLI version
echo "Vercel CLI:"
vercel --version 2>/dev/null || echo "Not installed"
echo ""

# Check login status
echo "Login Status:"
vercel whoami 2>/dev/null || echo "Not logged in. Run: vercel login"
echo ""

# Check project config
if [ -f ".vercel/project.json" ]; then
    echo "Project Config:"
    cat .vercel/project.json 2>/dev/null | head -5
    echo ""
fi

# Check vercel.json
if [ -f "vercel.json" ]; then
    echo "vercel.json exists:"
    cat vercel.json | head -20
    echo ""
fi

# List recent deployments
echo "Recent Deployments:"
vercel list 2>/dev/null | head -10 || echo "No deployments found"
