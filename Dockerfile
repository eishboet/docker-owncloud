FROM eishboet/s6-nginx

ENV OWNCLOUD_VERSION="10.4.0"

RUN apt-get install -y \
  php7.3 \
  curl \
  && mkdir -p /apps /owncloud_config /updater

COPY root/ /

VOLUME /owncloud_config /data /apps /updater
