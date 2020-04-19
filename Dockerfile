FROM eishboet/s6-nginx

ENV OWNCLOUD_VERSION="10.4.0"

RUN apt-get install -y \
  php7.3 \
  curl

COPY root/ /

VOLUME /var/www/owncloud/config /data
