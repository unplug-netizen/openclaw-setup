#!/bin/bash
# docker-cleanup.sh - Clean up unused Docker resources

set -e

echo "=== Docker Cleanup ==="
echo ""

# Show current usage
echo "Current usage:"
docker system df
echo ""

# Stop exited containers
EXITED=$(docker ps -q -f status=exited)
if [ -n "$EXITED" ]; then
    echo "Removing exited containers..."
    docker rm $EXITED
    echo ""
fi

# Remove dangling images
DANGLING=$(docker images -q -f dangling=true)
if [ -n "$DANGLING" ]; then
    echo "Removing dangling images..."
    docker rmi $DANGLING
    echo ""
fi

# Ask before full prune
read -p "Run full system prune? This removes all unused data. (y/N): " confirm
if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    docker system prune -a --volumes -f
fi

echo ""
echo "Cleanup complete!"
echo "New usage:"
docker system df
