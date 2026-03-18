#!/bin/bash
# emulator-start.sh - Start Firebase local emulator

set -e

echo "=== Firebase Emulator Suite ==="
echo ""

# Check if firebase.json exists
if [ ! -f "firebase.json" ]; then
    echo "Error: firebase.json not found. Run 'firebase init' first."
    exit 1
fi

echo "Starting Firebase emulator..."
echo "UI available at: http://localhost:4000"
echo ""

firebase emulators:start --import=./emulator-data 2>/dev/null || firebase emulators:start
