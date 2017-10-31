FROM php:7.1-fpm-alpine3.4

MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

#Install extension dependencies
RUN apk --no-cache add \
       libmcrypt-dev \
       icu-dev \
       git \
    && docker-php-ext-configure \
       intl \
    && docker-php-ext-install \
       opcache \
       pdo_mysql \
       mysqli \
       intl \
       mcrypt
    
RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

ADD app.ini /usr/local/etc/php/conf.d
ADD app.pool.conf /usr/local/etc/php-fpm.d
ADD setup.sh /setup.sh

CMD ["php-fpm", "-F"]

WORKDIR /var/www/application

CMD ["/setup.sh"]
ENTRYPOINT ["sh"]

EXPOSE 9000