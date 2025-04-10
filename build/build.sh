#!/bin/bash

# Simple script to push main branch content to build branch
# This triggers the GitHub Actions workflow for building Docker images

set -e  # Exit on any error

# Switch to main and get latest
git checkout main
git pull origin main

# Delete local build branch if exists
git branch -D build 2> /dev/null || true

# Delete remote build branch if exists
git push origin --delete build 2> /dev/null || true

# Create new build branch from main
git checkout -b build

# Push to origin/build to trigger workflow
git push -f origin build

# Switch back to main
git checkout main

echo "Done! Build branch created and pushed."
echo "GitHub Actions workflow should now be running to build Docker image."