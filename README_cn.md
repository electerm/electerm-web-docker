[English](README.md)

<h1 class="aligncenter">
    <a href="https://electerm.org">
        <img src="https://github.com/electerm/electerm-resource/raw/master/static/images/electerm.png", alt="electerm" />
    </a>
</h1>

# electerm-web-docker

docker镜像的[electerm-web](https://github.com/electerm/electerm-web)

[electerm](https://github.com/electerm/electerm) 是一款开源的终端/ssh/sftp/ftp/telnet/serialport/RDP/VNC/Spice 客户端（Linux、macOS、Windows、Android、HarmonyOS、iOS）。本镜像将基于浏览器的 [electerm-web](https://github.com/electerm/electerm-web) 打包，方便通过 Docker 自托管部署。

## 关于 electerm

除主流的 Windows / macOS / Linux / Android 外，electerm 还支持 HarmonyOS，以及较老的系统，如 Ubuntu 18、Windows 7、macOS 10+，以及 UOS、麒麟、龙架构（LoongArch，新旧世界）等国产 Linux 发行版，同时还支持 RISC-V (riscv64) 与 PowerPC 64位小端 (ppc64le) Linux。

## 使用

```sh
# 使用 --user 参数以当前用户运行（避免Linux上的权限问题）
# 将 $(pwd)/electerm-web-data 改为你想存储数据的文件夹

docker run --init \
  -v $(pwd)/electerm-web-data:/home/electerm/data \
  -e "DB_PATH=/home/electerm/data" \
  -e "HOST=0.0.0.0" \
  -p 8082:5577 \
  zxdong262/electerm-web
```

### 启用认证（可选）

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

然后在浏览器中访问[http://127.0.0.1:8082](http://127.0.0.1:8082)。

查看[examples/nginx.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx.conf)和[examples/nginx-ssl.conf](https://github.com/electerm/electerm-web/blob/main/examples/nginx-ssl.conf)以获取域名绑定nginx配置示例。

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

## 相关项目/站点

- [electerm](https://github.com/electerm/electerm)：主桌面应用（基于 Electron）
- [electerm.org](https://electerm.org)：主页、下载、视频等
- [electerm-web](https://github.com/electerm/electerm-web)：运行于浏览器（支持移动设备）的 web app 版本
- [electerm-android](https://github.com/electerm/electerm-android)：安卓端应用
- [electerm-harmony](https://github.com/electerm/electerm-harmony)：鸿蒙端应用
- [electerm-ios](https://github.com/electerm/electerm-ios)：iOS 端应用
- [electerm online](https://cloud.electerm.org)：公共免费在线 electerm 应用
- [electerm AI](https://ai.electerm.org)：面向 electerm 用户的免费 AI
- [theme.electerm.org](https://theme.electerm.org)：主题在线编辑、实时预览与分享
- [electerm demo](https://demo.electerm.org)：在线演示
- [electerm deb repo](https://repos.electerm.org/deb)：Debian 软件源
- [electerm rpm repo](https://repos.electerm.org/rpm)：RPM 软件源
- [electerm-locales](https://github.com/electerm/electerm-locales)：多语言/国际化文件
- [Apple App Store](https://apps.apple.com/cn/app/electerm/id6792971552)
- [华为应用市场](https://appgallery.huawei.com/app/detail?id=org.electerm.electerm)
- [Microsoft Store](https://www.microsoft.com/store/apps/9NCN7272GTFF)
- [Snap Store](https://snapcraft.io/electerm)

## 许可证

MIT
