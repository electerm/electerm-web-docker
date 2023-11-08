# electerm-web-docker

docker image of [electerm-web](https://github.com/electerm/electerm-web)

## Use

```sh
# change $(pwd)/data to any folder you want to store data
# to use same data as desktop electerm
# for Mac OS modify $(pwd)/electerm-web-data to "/Users/<your-user-name>/Library/Application Support/electerm"
# for Linux OS modify $(pwd)/electerm-web-data to "/home/<your-user-name>/.config/electerm"
# for Windows OS modify $(pwd)/electerm-web-data to "C:\\Users\\<your-user-name>\\AppData\\Roaming\\electerm"

# change some_server_secret to some random secret string
docker run --init -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "SERVER_SECRET=some_server_secret" \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -e "SERVER=http://127.0.0.1:8082" \
  -p 8082:5577 \
  zxdong262/electerm-web
```

Then visit [http://127.0.0.1:8082](http://127.0.0.1:8082) in browser.

## License

MIT
