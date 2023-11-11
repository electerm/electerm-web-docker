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
  -e "SERVER=http://127.0.0.1:8082" \
# -e "SERVER_SECRET=some_server_secret" \
# -e "SERVER_PASS=password_to_login" \
# -e "ENABLE_AUTH=1" \  
  -p 8082:5577 \
  zxdong262/electerm-web
```

Then visit [http://127.0.0.1:8082](http://127.0.0.1:8082) in browser,

***Should only be used in local machine, should not be given access from internet for safety reason.***

## License

MIT
