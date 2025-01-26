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
##  Docker Compose example
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
    
    
    

# You should change some_server_secret to a complex key string.
# China users use it, and other defaults can be used.    Specifies the mirror used by the service. Https://docker.xuanyuan.me/zxdong262/electerm-web:latest is used here. You can't find it yourself. 
# Mount the/share/nas973/electerm-web-data directory of the host to the /home/electerm/data directory of the container. Remember to set the directory yourself or change it to your own directory.
# Set the value of the environment variable HOST to 0.0.0.0, indicating that the service will listen to all network interfaces.
# Map the 8082 port of the host to the 5577 port of the container. In this way, the outside can access the 5577 port inside the container through the 8082 port of the host.
```

Then visit [http://127.0.0.1:8082](http://127.0.0.1:8082) in browser,

Check [examples/nginx.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx.conf) [examples/nginx-ssl.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx-ssl.conf)  for domain binding nginx conf example.

## Docker hub url

https://hub.docker.com/repository/docker/zxdong262/electerm-web

## License

MIT
