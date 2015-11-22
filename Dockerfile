FROM alpine

ENV NGINX_VERSION=1.9.7 NGINX_HOME=/app/nginx

RUN apk upgrade --update && \
  apk add curl gnupg openssl-dev pcre-dev build-base && \
  curl -SLO http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
  curl -SLO http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz.asc && \
  curl -SL http://nginx.org/keys/is.key | gpg --import && \
  curl -SL http://nginx.org/keys/sb.key | gpg --import && \
  curl -SL http://nginx.org/keys/maxim.key | gpg --import && \
  curl -SL http://nginx.org/keys/glebius.key | gpg --import && \
  curl -SL http://nginx.org/keys/mdounin.key | gpg --import && \
  curl -SL http://nginx.org/keys/aalexeev.key | gpg --import && \
  curl -SL http://nginx.org/keys/nginx_signing.key | gpg --import && \
  gpg --verify nginx-${NGINX_VERSION}.tar.gz.asc nginx-${NGINX_VERSION}.tar.gz && \
  tar -xzf nginx-${NGINX_VERSION}.tar.gz && \
  cd nginx-${NGINX_VERSION} && \
  ./configure \
        --prefix=${NGINX_HOME} \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --conf-path=/etc/nginx/nginx.conf \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/sbin/nginx \
        --pid-path=/var/run/nginx.pid && \
  make && \
  make install && \
  mkdir -p /etc/nginx/conf.d && \
  apk del curl gnupg build-base && \
  rm /nginx-${NGINX_VERSION}.tar.gz /nginx-${NGINX_VERSION}.tar.gz.asc && \
  rm -rf /nginx-${NGINX_VERSION} /usr/share/man

EXPOSE 80 8080 443
CMD ["nginx", "-g", "daemon off;"]