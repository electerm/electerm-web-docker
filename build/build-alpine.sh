#!/bin/bash

# Build script for Alpine-based Docker image
# This script builds the electerm-web Alpine Docker image with multi-architecture support

set -e  # Exit on any error

# Set up Docker Buildx
docker buildx create --use --name multi-arch-builder-alpine

# Build for multiple architectures
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t zxdong262/electerm-web-alpine:latest \
  -f Dockerfile.alpine \
  --push \
  .. 2>&1 | tee build-alpine.log

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Build successful. Proceeding with tagging."

  # Tag the latest release for all architectures
  VERSION=3.3.75
  docker buildx imagetools create \
    --tag zxdong262/electerm-web-alpine:$VERSION \
    zxdong262/electerm-web-alpine:latest

  echo "Tagged version: $VERSION for all architectures"
else
  echo "Build failed. Skipping tagging."
fi

# Clean up the builder
docker buildx rm multi-arch-builder-alpine

echo "Alpine build completed!"
