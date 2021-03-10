FROM eishboet/s6-nginx

ENV OWNCLOUD_VERSION="10.4.0"

RUN apt-get install -y \
  php7.3 \
  curl \
  cron \
  && mkdir -p /apps /owncloud_config /updater

ADD crontab /etc/cron.d/owncloud-cron
RUN chmod 0600 /etc/cron.d/owncloud-cron

COPY root/ /

VOLUME /data /apps /updater
