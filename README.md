[中文](README_cn.md)

# electerm-web-docker

docker image of [electerm-web](https://github.com/electerm/electerm-web)

## Use

```sh
# Use --user flag to run as current user (avoids permission issues on Linux)
# Change $(pwd)/electerm-web-data to your preferred data folder

docker run --init \
  --user "$(id -u):$(id -g)" \
  -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web
```

### With authentication (optional)

```sh
docker run --init \
  --user "$(id -u):$(id -g)" \
  -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -e "SERVER_SECRET=some_server_secret" \
  -e "SERVER_PASS=password_to_login" \
  -e "ENABLE_AUTH=1" \
  -p 8082:5577 \
  zxdong262/electerm-web
```

### Use same data as desktop electerm

```sh
# macOS
docker run --init --user "$(id -u):$(id -g)" \
  -v "/Users/<your-user-name>/Library/Application Support/electerm":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" -e "HOST=0.0.0.0" \
  -p 8082:5577 zxdong262/electerm-web

# Linux
docker run --init --user "$(id -u):$(id -g)" \
  -v "/home/<your-user-name>/.config/electerm":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" -e "HOST=0.0.0.0" \
  -p 8082:5577 zxdong262/electerm-web
```

Then visit [http://127.0.0.1:8082](http://127.0.0.1:8082) in browser.

Check [examples/nginx.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx.conf) [examples/nginx-ssl.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx-ssl.conf) for domain binding nginx conf example.

## Docker Compose

```yaml
version: '3.8'
services:
  electerm-web:
    image: zxdong262/electerm-web:latest
    container_name: electerm-web
    user: "${UID:-1000}:${GID:-1000}"
    volumes:
      - ./electerm-data:/home/electerm/data
    environment:
      - DB_PATH=/home/electerm/data
      - HOST=0.0.0.0
      # Optional authentication:
      # - SERVER_SECRET=some_server_secret
      # - SERVER_PASS=password_to_login
      # - ENABLE_AUTH=1
    ports:
      - "8082:5577"
    init: true
    restart: unless-stopped
```

```sh
# Run with current user's UID/GID
UID=$(id -u) GID=$(id -g) docker-compose up -d
```

## Docker hub url

https://hub.docker.com/repository/docker/zxdong262/electerm-web

## License

MIT
