# docker-nginx

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
