#!/bin/bash
# docker-run.sh - Run container with common options

set -e

IMAGE="${1:-myapp:latest}"
NAME="${2:-myapp}"
PORT="${3:-3000}"

echo "=== Docker Run ==="
echo "Image: $IMAGE"
echo "Name: $NAME"
echo "Port: $PORT"
echo ""

# Stop existing container if running
if docker ps -q -f name="$NAME" | grep -q .; then
    echo "Stopping existing container: $NAME"
    docker stop "$NAME" > /dev/null
    docker rm "$NAME" > /dev/null
fi

# Run container
docker run -d \
    --name "$NAME" \
    -p "${PORT}:${PORT}" \
    --restart unless-stopped \
    -e NODE_ENV=production \
    "$IMAGE"

echo ""
echo "Container started: $NAME"
echo "Logs: docker logs -f $NAME"
