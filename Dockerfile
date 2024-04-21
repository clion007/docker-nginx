# syntax=docker/dockerfile:1
FROM alpine

# set version label
LABEL maintainer="Clion Nieh <76857061@qq.com>"

# install packages
RUN set -eux; \
  #install build packages
  apk add --no-cache \
    nginx \
    logrotate \
    apache2-utils \
    nginx-mod-http-brotli \
    nginx-mod-http-dav-ext \
    nginx-mod-http-echo \
    nginx-mod-http-fancyindex \
    nginx-mod-http-geoip \
    nginx-mod-http-geoip2 \
    nginx-mod-http-headers-more \
    nginx-mod-http-image-filter \
    nginx-mod-http-perl \
    nginx-mod-http-redis2 \
    nginx-mod-http-set-misc \
    nginx-mod-http-upload-progress \
    nginx-mod-http-xslt-filter \
    nginx-mod-mail \
    nginx-mod-rtmp \
    nginx-mod-stream \
    nginx-mod-stream-geoip \
    nginx-mod-stream-geoip2 \
    nginx-vim; \
  \
  # Make dir for config
  mkdir -p /config; \
  chown nginx:nginx /config; \
  \
  # configure nginx
  echo '# https://httpoxy.org/
fastcgi_param  HTTP_PROXY         "";
# http://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_split_path_info
fastcgi_param  PATH_INFO          $fastcgi_path_info;
# https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/#connecting-nginx-to-php-fpm
fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name; 
# Send HTTP_HOST as SERVER_NAME. If HTTP_HOST is blank, send the value of server_name from nginx (default is `_`)
fastcgi_param  SERVER_NAME        $host;' >> \
    /etc/nginx/fastcgi_params; \
  rm -f /etc/nginx/conf.d/stream.conf; \
  rm -f /etc/nginx/http.d/default.conf; \
  \
  # fix logrotate
  sed -i "s#/var/log/messages {}.*# #g" \
    /etc/logrotate.conf; \
  sed -i 's#/usr/sbin/logrotate /etc/logrotate.conf#/usr/sbin/logrotate /etc/logrotate.conf -s /config/log/logrotate.status#g' \
    /etc/periodic/daily/logrotate
  
# add local files
COPY  --chmod=755 root/ /

# set entrypoint
ENTRYPOINT ["/init"]

# ports and volumes
EXPOSE 80 443
VOLUME /config

STOPSIGNAL SIGQUIT

CMD ["-g","daemon off;"]
