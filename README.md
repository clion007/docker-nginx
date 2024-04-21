# docker-nginx

## Docker cli
```
docker run
  -d
  --name='Nginx'
  --net='vnet'
  --ip='10.7.8.9'
  -e TZ="Asia/Shanghai"
  -e HOST_OS="Unraid"
  -e HOST_HOSTNAME="ClionAIO"
  -e HOST_CONTAINERNAME="Nginx"
  -e 'PUID'='99'
  -e 'PGID'='100'
  -e 'UMASK'='022'
  -l net.unraid.docker.managed=dockerman
  -l net.unraid.docker.webui='http://10.7.8.9'
  -l net.unraid.docker.icon='https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/nginx-logo.png'
  -v '/mnt/user/appdata/webserver':'/config':'rw' 'registry.cn-chengdu.aliyuncs.com/clion/nginx'
```
