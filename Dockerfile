FROM eishboet/s6-nginx

ENV OWNCLOUD_VERSION=10.4.0

RUN apt-get install -y php7.3 \

VOLUME /var/www/owncloud/config /data
