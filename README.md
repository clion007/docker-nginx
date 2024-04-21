# clion/nginx
Nginx is an webserver with php support and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev. This is a custom image built with Alpine linux, nginx and logrotate. All softwares are keeped latest version. The config files reside in /config for easy user customization.

## Application Setup
* Add your web files to /config/www for hosting.
* Modify the nginx and site config files under /config as needed
* Protip: This container is best combined with a sql server, e.g. mariadb and a PHP

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
