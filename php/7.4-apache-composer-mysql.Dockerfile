FROM php:7.4-apache

RUN apt update && apt install -y git unzip
RUN docker-php-ext-install mysqli pdo_mysql pcntl

# Enable apache rewrites and copy custom apache config
RUN a2enmod rewrite
# Needed for cors stuff
RUN a2enmod headers

COPY apache-confs /etc/apache2/

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
