# clion/nginx
Nginx is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev.This is a custom image built with Alpine linux, nginx and logrotate. All softwares are keeped latest version.

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
