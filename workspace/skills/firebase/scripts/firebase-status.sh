#!/bin/bash
# firebase-status.sh - Check Firebase project status

set -e

echo "=== Firebase Project Status ==="
echo ""

# Check CLI version
echo "Firebase CLI:"
firebase --version
echo ""

# Check login status
echo "Login Status:"
firebase login:list 2>/dev/null || echo "Not logged in. Run: firebase login"
echo ""

# List projects
echo "Available Projects:"
firebase projects:list 2>/dev/null | head -20 || echo "No projects found"
echo ""

# Current project
if [ -f ".firebaserc" ]; then
    echo "Current Project (.firebaserc):"
    cat .firebaserc
    echo ""
fi

# Check services
if [ -f "firebase.json" ]; then
    echo "Configured Services (firebase.json):"
    grep -E '"hosting"|"firestore"|"functions"|"storage"|"database"' firebase.json || echo "No services configured"
fi
