FROM php:7.1-fpm

MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

#Install extension dependencies
RUN apt-get update && \
    apt-get install -y libxml2-dev --no-install-recommends && \
    apt-get install -y libmcrypt-dev \
        libreadline-dev \
        libcurl4-openssl-dev \
        git
    
RUN apt-get update && \
    docker-php-ext-install -j$(nproc) \
    json \
    mbstring \
    opcache \
    pdo \
    pdo_mysql \
    mysqli \
    xml \
    curl \
    && docker-php-ext-install \
    mcrypt
    
RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

ADD app.ini /etc/php7.1/fpm/conf.d/
ADD app.ini /etc/php7.1/cli/conf.d/
ADD app.pool.conf /etc/php7.1/fpm.d/
# ADD ../application/app/config/

CMD ["php-fpm", "-F"]

WORKDIR /var/www/application

# CMD ["./setup.sh"]
# ENTRYPOINT ["sh"]

EXPOSE 9000