FROM php:7.3-cli

RUN apt update && apt install -y git unzip
RUN docker-php-ext-install pcntl

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
