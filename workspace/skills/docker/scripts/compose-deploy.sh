#!/bin/bash
# compose-deploy.sh - Deploy with Docker Compose

set -e

ENV="${1:-production}"

echo "=== Docker Compose Deploy ==="
echo "Environment: $ENV"
echo ""

COMPOSE_FILE="docker-compose.yml"
if [ -f "docker-compose.$ENV.yml" ]; then
    COMPOSE_FILE="docker-compose.$ENV.yml"
fi

if [ ! -f "$COMPOSE_FILE" ]; then
    echo "Error: $COMPOSE_FILE not found"
    exit 1
fi

echo "Using: $COMPOSE_FILE"
echo ""

# Pull latest images
echo "Pulling images..."
docker-compose -f "$COMPOSE_FILE" pull

# Build if needed
echo "Building..."
docker-compose -f "$COMPOSE_FILE" build

# Deploy
echo "Deploying..."
docker-compose -f "$COMPOSE_FILE" up -d --remove-orphans

echo ""
echo "Deployed!"
echo "Status:"
docker-compose -f "$COMPOSE_FILE" ps
