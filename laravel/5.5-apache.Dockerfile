FROM php:7.2-apache

RUN apt update && apt install -y git unzip libzip-dev libpng-dev
RUN docker-php-ext-install mysqli pdo_mysql pcntl zip gd

COPY apache-confs /etc/apache2/

# Enable apache rewrites and copy custom apache config
RUN a2enmod rewrite
# Needed for cors stuff
RUN a2enmod headers

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/php


