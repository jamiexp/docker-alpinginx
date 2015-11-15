FROM alpine

ENV NGINX_VERSION=1.9.6

RUN apk upgrade --update && \
  apk add curl gnupg openssl-dev pcre-dev zlib-dev build-base && \
  curl -SLO http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
  curl -SLO http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz.asc && \
  curl -SL http://nginx.org/keys/is.key | gpg --import && \
  curl -SL http://nginx.org/keys/sb.key | gpg --import && \
  curl -SL http://nginx.org/keys/maxim.key | gpg --import && \
  curl -SL http://nginx.org/keys/glebius.key | gpg --import && \
  curl -SL http://nginx.org/keys/mdounin.key | gpg --import && \
  curl -SL http://nginx.org/keys/aalexeev.key | gpg --import && \
  curl -SL http://nginx.org/keys/nginx_signing.key | gpg --import && \
  gpg --verify nginx-${NGINX_VERSION}.tar.gz.asc