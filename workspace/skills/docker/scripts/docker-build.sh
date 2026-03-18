#!/bin/bash
# docker-build.sh - Build Docker image with caching and tags

set -e

IMAGE_NAME="${1:-myapp}"
TAG="${2:-latest}"
DOCKERFILE="${3:-Dockerfile}"

echo "=== Docker Build ==="
echo "Image: $IMAGE_NAME:$TAG"
echo "Dockerfile: $DOCKERFILE"
echo ""

# Check if Dockerfile exists
if [ ! -f "$DOCKERFILE" ]; then
    echo "Error: $DOCKERFILE not found"
    exit 1
fi

# Build with cache
echo "Building..."
docker build \
    -t "$IMAGE_NAME:$TAG" \
    -t "$IMAGE_NAME:latest" \
    -f "$DOCKERFILE" \
    --cache-from "$IMAGE_NAME:latest" \
    .

echo ""
echo "Built: $IMAGE_NAME:$TAG"
echo "Built: $IMAGE_NAME:latest"
