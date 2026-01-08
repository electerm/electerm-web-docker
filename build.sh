#!/bin/bash

# Set up Docker Buildx
docker buildx create --use --name multi-arch-builder

# Build for multiple architectures
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t zxdong262/electerm-web:latest \
  -f Dockerfile.ubuntu \
  --push \
  . 2>&1 | tee build.log

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Build successful. Proceeding with tagging."

  # Tag the latest release for all architectures
  VERSION=3.3.190
  docker buildx imagetools create \
    --tag zxdong262/electerm-web:$VERSION \
    zxdong262/electerm-web:latest

  echo "Tagged version: $VERSION for all architectures"
else
  echo "Build failed. Skipping tagging."
fi

# Clean up the builder
docker buildx rm multi-arch-builder
