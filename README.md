[中文](README_cn.md)

<h1 class="aligncenter">
    <a href="https://electerm.org">
        <img src="https://github.com/electerm/electerm-resource/raw/master/static/images/electerm.png", alt="electerm" />
    </a>
</h1>

# electerm-web-docker

docker image of [electerm-web](https://github.com/electerm/electerm-web)

[electerm](https://github.com/electerm/electerm) is an open-sourced terminal/ssh/sftp/ftp/telnet/serialport/RDP/VNC/Spice client (Linux, Mac, Windows, Android, HarmonyOS, iOS). This image packages the browser-based [electerm-web](https://github.com/electerm/electerm-web) for easy self-hosting with Docker.

## About electerm

Besides the mainstream Windows / macOS / Linux / Android platforms, electerm also supports HarmonyOS and older systems such as Ubuntu 18, Windows 7, macOS 10+, as well as domestic Linux distributions like UOS, Kylin, and LoongArch (both old-world and new-world), as well as RISC-V (riscv64) and PowerPC 64-bit little-endian (ppc64le) Linux.

## Use

```sh
# Use --user flag to run as current user (avoids permission issues on Linux)
# Change $(pwd)/electerm-web-data to your preferred data folder

docker run --init \
  -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web
```

### With authentication (optional)

```sh
docker run --init \
  -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -e "SERVER_SECRET=some_server_secret" \
  -e "SERVER_PASS=password_to_login" \
  -e "ENABLE_AUTH=1" \
  -p 8082:5577 \
  zxdong262/electerm-web
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

https://hub.docker.com/r/zxdong262/electerm-web

## Related projects/sites

- [electerm](https://github.com/electerm/electerm): The main desktop app (Electron-based)
- [electerm.org](https://electerm.org): Homepage, downloads, videos, etc
- [electerm-web](https://github.com/electerm/electerm-web): Web app version running in browser (including mobile device)
- [electerm-android](https://github.com/electerm/electerm-android): Android app
- [electerm-harmony](https://github.com/electerm/electerm-harmony): HarmonyOS app
- [electerm-ios](https://github.com/electerm/electerm-ios): iOS app
- [electerm online](https://cloud.electerm.org): Public free online electerm app
- [electerm AI](https://ai.electerm.org): Free AI for electerm users
- [theme.electerm.org](https://theme.electerm.org): Theme live editor, live preview & sharing
- [electerm demo](https://demo.electerm.org): Online demo of electerm
- [electerm deb repo](https://repos.electerm.org/deb): Debian repo of electerm
- [electerm rpm repo](https://repos.electerm.org/rpm): RPM repo of electerm
- [electerm-locales](https://github.com/electerm/electerm-locales): Language/i18n files for electerm
- [Apple App Store](https://apps.apple.com/cn/app/electerm/id6792971552)
- [Huawei AppGallery](https://appgallery.huawei.com/app/detail?id=org.electerm.electerm)
- [Microsoft Store](https://www.microsoft.com/store/apps/9NCN7272GTFF)
- [Snap Store](https://snapcraft.io/electerm)

## License

MIT
