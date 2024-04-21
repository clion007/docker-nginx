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
  
  # configure nginx

# add local files
COPY  --chmod=755 root/ /

# set entrypoint
ENTRYPOINT ["/init"]

# ports and volumes
EXPOSE 80 443
VOLUME /config

CMD ["-g","daemon off;"]
