docker run -it zxdong262/electerm-web sh
docker push zxdong262/electerm-web
docker tag zxdong262/electerm-web:latest zxdong262/electerm-web:3.4.35
docker push zxdong262/electerm-web:3.4.35
docker pull zxdong262/electerm-web:latest

docker run --init \
  -v "/home/execapp/dev/electerm-web/data":/home/electerm/data \
  -v "/home/execapp/dev/electerm-web/dist":/app/electerm-web/dist \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t zxdong262/electerm-web:latest \
  -f Dockerfile.ubuntu \
  --output "type=image,push=false" \
  .