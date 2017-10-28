FROM alpine:3.4

MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

RUN apk add --update \
    php7.1-fpm \
    php7.1-mbstring \
    php7.1-apcu \
    php7.1-ctype \
    php7.1-curl \
    php7.1-dom \
    php7.1-gd \
    php7.1-iconv \
    php7.1-imagick \
    php7.1-json \
    php7.1-intl \
    php7.1-mcrypt \
    php7.1-mysql \
    php7.1-opcache \
    php7.1-openssl \
    php7.1-pdo \
    php7.1-pdo_mysql \
    php7.1-mysqli \
    php7.1-xml \
    php7.1-zlib \
    php7.1-phar \
    curl

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

ADD app.ini /etc/php7.1/fpm/conf.d/
ADD app.ini /etc/php7.1/cli/conf.d/

ADD app.pool.conf /etc/php7.1/fpm.d/

CMD ["php-fpm", "-F"]

WORKDIR /var/www/application
EXPOSE 9000

