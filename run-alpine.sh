

docker run --init -v "/Users/home/Library/Application Support/electerm":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -e "SERVER=http://127.0.0.1:8082" \
  -p 8082:5577 \
  zxdong262/electerm-web-alpine