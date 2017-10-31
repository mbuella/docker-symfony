FROM alpine:3.4

MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

RUN apk --no-cache add --update nginx

ADD nginx.conf /etc/nginx/
ADD app.conf /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443