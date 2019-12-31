FROM php:7.1-apache

RUN apt-get update \
    && apt-get install -y \
    graphviz \
    libpng-dev \
    libgmp-dev \
    libzip-dev \
    libc-client-dev \
    libkrb5-dev \
    libldap2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    --no-install-recommends

ADD ./config/apache2 /etc/apache2
ADD ./scripts /usr/local/bin/

RUN configure-php
RUN configure-apache
RUN install-php-extensions

CMD ["start-server"]
