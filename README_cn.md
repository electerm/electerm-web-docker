[English](README.md)

# electerm-web-docker

docker镜像的[electerm-web](https://github.com/electerm/electerm-web)

## 使用

```sh
# 使用 --user 参数以当前用户运行（避免Linux上的权限问题）
# 将 $(pwd)/electerm-web-data 改为你想存储数据的文件夹

docker run --init \
  --user "$(id -u):$(id -g)" \
  -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web
```

### 启用认证（可选）

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

### 使用和桌面electerm相同的数据

```sh
# macOS
docker run --init --user "$(id -u):$(id -g)" \
  -v "/Users/<你的用户名>/Library/Application Support/electerm":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" -e "HOST=0.0.0.0" \
  -p 8082:5577 zxdong262/electerm-web

# Linux
docker run --init --user "$(id -u):$(id -g)" \
  -v "/home/<你的用户名>/.config/electerm":/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" -e "HOST=0.0.0.0" \
  -p 8082:5577 zxdong262/electerm-web
```

然后在浏览器中访问[http://127.0.0.1:8082](http://127.0.0.1:8082)。

查看[examples/nginx.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx.conf)和[examples/nginx-ssl.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx-ssl.conf)以获取域名绑定nginx配置示例。

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
      # 可选认证:
      # - SERVER_SECRET=some_server_secret
      # - SERVER_PASS=password_to_login
      # - ENABLE_AUTH=1
    ports:
      - "8082:5577"
    init: true
    restart: unless-stopped
```

```sh
# 使用当前用户的 UID/GID 运行
UID=$(id -u) GID=$(id -g) docker-compose up -d
```

## Docker hub链接

https://hub.docker.com/r/zxdong262/electerm-web

## 许可证

MIT
