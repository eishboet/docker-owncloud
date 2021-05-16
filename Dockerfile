FROM eishboet/s6-nginx

ENV OWNCLOUD_VERSION="10.6.0"
ENV PHP_VERSION = "7.4"

RUN apt-get update && apt -y install lsb-release apt-transport-https ca-certificates wget \
  && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
  && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
  && apt-get install -y procps php7.4 php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-zip curl cron \
  && mkdir -p /apps /owncloud_config /updater

ADD crontab /etc/cron.d/owncloud-cron
RUN chmod 0600 /etc/cron.d/owncloud-cron

COPY root/ /

VOLUME /data /apps /updater
