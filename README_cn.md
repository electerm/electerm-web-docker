[English](README.md)

# electerm-web-docker

docker镜像的[electerm-web](https://github.com/electerm/electerm-web)

## 使用

```sh
# 将$(pwd)/electerm-web-data改为你想存储数据的文件夹
# 如果想使用和桌面electerm相同的数据
# 对于Mac OS，将$(pwd)/electerm-web-data改为"/Users/<你的用户名>/Library/Application Support/electerm"
# 对于Linux OS，将$(pwd)/electerm-web-data改为"/home/<你的用户名>/.config/electerm"
# 对于Windows OS，将$(pwd)/electerm-web-data改为"C:\\Users\\<你的用户名>\\AppData\\Roaming\\electerm"

# SERVER_SECRET, SERVER_PASS, ENABLE_AUTH是可选的
# 当ENABLE_AUTH启用时，需要使用SERVER_PASS登录才能访问
# SERVER_SECRET用于加密数据，如果不设置，将使用默认值
# 应将some_server_secret改为复杂的密钥字符串

docker run --init -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
# -e "SERVER_SECRET=some_server_secret" \
# -e "SERVER_PASS=password_to_login" \
# -e "ENABLE_AUTH=1" \  
  -p 8082:5577 \
  zxdong262/electerm-web
```
##Docker Compose
```
version: '3.8'
services:
  electerm-web:
    image: https://docker.xuanyuan.me/zxdong262/electerm-web:latest
    container_name: electerm-web
    volumes:
      - /share/NAS973/electerm-web-data:/home/electerm/data
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
然后在浏览器中访问[http://127.0.0.1:8082](http://127.0.0.1:8082)，

查看[examples/nginx.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx.conf)和[examples/nginx-ssl.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx-ssl.conf)以获取域名绑定nginx配置示例。

## Docker hub链接

https://hub.docker.com/repository/docker/zxdong262/electerm-web

## 许可证

MIT
