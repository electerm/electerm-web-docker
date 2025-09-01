[中文](README_cn.md)

# electerm-web-docker

docker image of [electerm-web](https://github.com/electerm/electerm-web)

## Use

```sh
# change $(pwd)/data to any folder you want to store data
# to use same data as desktop electerm
# for Mac OS modify $(pwd)/electerm-web-data to "/Users/<your-user-name>/Library/Application Support/electerm"
# for Linux OS modify $(pwd)/electerm-web-data to "/home/<your-user-name>/.config/electerm"
# for Windows OS modify $(pwd)/electerm-web-data to "C:\\Users\\<your-user-name>\\AppData\\Roaming\\electerm"

# SERVER_SECRET, SERVER_PASS, ENABLE_AUTH are optional,
# when ENABLE_AUTH enabled, would require login with SERVER_PASS when visit
# SERVER_SECRET is used to encrypt data, if not set, would use default value
# Should change some_server_secret to some complicated secret string

docker run --init -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
# -e "SERVER_SECRET=some_server_secret" \
# -e "SERVER_PASS=password_to_login" \
# -e "ENABLE_AUTH=1" \  
  -p 8082:5577 \
  zxdong262/electerm-web

```

Then visit [http://127.0.0.1:8082](http://127.0.0.1:8082) in browser,

Check [examples/nginx.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx.conf) [examples/nginx-ssl.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx-ssl.conf)  for domain binding nginx conf example.

## Docker Compose example

```docker
version: '3.8'
services:
  electerm-web:
    image: https://docker.xuanyuan.me/zxdong262/electerm-web:latest
    container_name: electerm-web
    volumes:
      - /your/local/folder:/home/electerm/data
    environment:
      - DB_PATH=/home/electerm/data
      - HOST=0.0.0.0
      - SERVER_SECRET=some_server_secret
      - SERVER_PASS=password_to_login
      - ENABLE_AUTH=1
    ports:
      - "8082:5577"
    init: true
```

```sh
# Replace some_server_secret with a strong cryptographic key
# For users in China: Use the specified mirror at https://docker.xuanyuan.me/zxdong262/electerm-web:latest. Default settings apply for users in other regions.
# Mount the host directory /your/local/folder to /home/electerm/data in the container. Configure this path according to your storage requirements, make sure current user have permission in /your/local/folder
# Setting HOST=0.0.0.0 configures the service to listen on all available network interfaces
# Port mapping: Host port 8082 -> Container port 5577, enabling external access to the containerized service
```

## Docker hub url

https://hub.docker.com/repository/docker/zxdong262/electerm-web

## License

MIT
