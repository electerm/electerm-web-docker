
#!/bin/bash

echo "Starting electerm-web..."
echo "Access URL: http://127.0.0.1:8082"
echo "----------------------------------------"

docker run --init \
  -v "/Users/zxd/dev/electerm-web/data":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web