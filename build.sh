docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t zxdong262/electerm-web -f Dockerfile.ubuntu . --progress=plain 2>&1 | tee build.log
