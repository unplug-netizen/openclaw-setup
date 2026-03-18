---
name: docker
description: Build, run, and manage Docker containers and images for containerized applications. Use when building Docker images, running containers, managing Docker Compose services, or deploying containerized applications.
---

# Docker

Build, run, and manage Docker containers and images.

## Prerequisites

Docker must be installed and running:
```bash
docker --version
docker ps
```

## Capabilities

- Build Docker images
- Run and manage containers
- Docker Compose orchestration
- Image management (pull, push, tag)
- Container logs and monitoring
- Volume and network management
- Multi-stage builds

## Common Commands

### Images
```bash
# Build image
docker build -t myapp:latest .
docker build -t myapp:latest -f Dockerfile.prod .

# List images
docker images

# Remove image
docker rmi myapp:latest

# Pull/Push
docker pull nginx:alpine
docker push registry/myapp:latest

# Tag
docker tag myapp:latest myapp:v1.0.0
```

### Containers
```bash
# Run container
docker run -d -p 3000:3000 --name myapp myapp:latest
docker run -it --rm ubuntu bash

# List containers
docker ps
docker ps -a

# Stop/Start/Restart
docker stop myapp
docker start myapp
docker restart myapp

# Remove container
docker rm myapp
docker rm -f myapp

# Execute command
docker exec -it myapp bash
docker logs myapp
docker logs -f myapp
```

### Docker Compose
```bash
# Start services
docker-compose up -d
docker-compose up --build

# Stop services
docker-compose down
docker-compose down -v

# View logs
docker-compose logs
docker-compose logs -f app

# Scale services
docker-compose up -d --scale web=3

# Run command in service
docker-compose exec app bash
```

### Cleanup
```bash
# Remove unused containers
docker container prune

# Remove unused images
docker image prune

# Remove unused volumes
docker volume prune

# Remove everything unused
docker system prune -a
```

## Scripts

- `docker-build.sh` - Build with caching and tags
- `docker-run.sh` - Run container with common options
- `docker-cleanup.sh` - Clean up unused resources
- `compose-deploy.sh` - Deploy with Docker Compose

## References

- `references/Dockerfile.md` - Dockerfile best practices
- `references/docker-compose.md` - Compose file reference
