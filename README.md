# clion/nginx
Nginx is an webserver with php support and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev. This is a custom image built with Alpine linux, nginx and logrotate. All softwares are keeped latest version. The config files reside in /config for easy user customization.

## Application Setup
* Add your web files to /config/www for hosting.
* Modify the nginx and site config files under /config as needed
* Protip: This container is best combined with a sql server, e.g. mariadb and a PHP

## Modules installed

* nginx-mod-http-brotli
* nginx-mod-http-dav-ext
* nginx-mod-http-echo
* nginx-mod-http-fancyindex
* nginx-mod-http-geoip
* nginx-mod-http-geoip2
* nginx-mod-http-headers-more
* nginx-mod-http-image-filter
* nginx-mod-http-perl
* nginx-mod-http-redis2
* nginx-mod-http-set-misc
* nginx-mod-http-upload-progress
* nginx-mod-http-xslt-filter
* nginx-mod-mail
* nginx-mod-rtmp
* nginx-mod-stream
* nginx-mod-stream-geoip
* nginx-mod-stream-geoip2
* nginx-vim

## Usage
To help you get started creating a container from this image you can use the docker cli.

### Docker cli
```
docker run -d \
  --name='Nginx' \
  --net='bridge' \
  --ip='192.168.*.*' #optional \
  -e TZ="Asia/Shanghai"
  -e 'PUID'='1000'
  -e 'PGID'='1000'
  -e 'UMASK'='022'
  -p 80:80 #optional \
  -p 443:443 #optional \
  -v '/path/to/nginx/config':'/config' \
  --restart unless-stopped \
  registry.cn-chengdu.aliyuncs.com/clion/nginx
```
## Parameters
* -p 80 http port
* -p 443 https port
* -e PUID=1000 for UserID
* -e PGID=1000	for GroupID
* -e TZ=Asia/Shanghai specify a timezone to use in your local area.
* -v /config	Persistent config files

## Umask for running applications
For all of my images I provide the ability to override the default umask settings for services started within the containers using the optional -e UMASK=022 setting. Keep in mind umask is not chmod it subtracts from permissions based on it's value it does not add.

## User / Group Identifiers
When using volumes (-v flags), permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user PUID and group PGID.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.
