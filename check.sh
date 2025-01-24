docker run -it zxdong262/electerm-web sh
docker push zxdong262/electerm-web
docker tag zxdong262/electerm-web:latest zxdong262/electerm-web:2.60.20
docker push zxdong262/electerm-web:2.60.20
docker pull zxdong262/electerm-web:latest

docker run --init \
  -v "/home/execapp/dev/electerm-web/data":/home/electerm/data \
  -v "/home/execapp/dev/electerm-web/dist":/app/electerm-web/dist \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web