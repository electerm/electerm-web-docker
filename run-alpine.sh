#!/bin/bash

echo "Starting electerm-web (Alpine)..."
echo "Access URL: http://127.0.0.1:8082"
echo "----------------------------------------"

# Automatically use current user's UID/GID to avoid permission issues
# This makes Linux Docker behave like macOS Docker Desktop
# Override with: PUID=1000 PGID=1000 ./run-alpine.sh

PUID=${PUID:-$(id -u)}
PGID=${PGID:-$(id -g)}

docker run --init \
  --user "${PUID}:${PGID}" \
  -v "/Users/home/Library/Application Support/electerm":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -e "SERVER=http://127.0.0.1:8082" \
  -p 8082:5577 \
  zxdong262/electerm-web-alpine