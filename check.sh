docker run -it zxdong262/electerm-web sh
docker push zxdong262/electerm-web
docker tag zxdong262/electerm-web:latest zxdong262/electerm-web:2.60.17
docker push zxdong262/electerm-web:2.60.17
docker pull zxdong262/electerm-web:latest