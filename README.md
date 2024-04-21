# clion/nginx
Nginx is an webserver with php support and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev. This is a custom image built with Alpine linux, nginx and logrotate. All softwares are keeped latest version. The config files reside in /config for easy user customization.

## Application Setup
* Add your web files to /config/www for hosting.
* Modify the nginx and site config files under /config as needed
* Protip: This container is best combined with a sql server, e.g. mariadb and a PHP

## Docker cli
```
docker run
  -d
  --name='Nginx'
  --net='vnet'
  --ip='192.168.*.*' #optional
  -e TZ="Asia/Shanghai"
  -e 'PUID'='99'
  -e 'PGID'='100'
  -e 'UMASK'='022'
  -v '/mnt/user/appdata/webserver':'/config':'rw'
  'registry.cn-chengdu.aliyuncs.com/clion/nginx'
```
