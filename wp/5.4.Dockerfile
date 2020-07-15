FROM php:7.4-apache

RUN apt update
RUN apt-get install -y --no-install-recommends \
        libzip-dev \
		libfreetype6-dev \
		libjpeg-dev \
		libmagickwand-dev \
		libpng-dev vi nano net-tools
RUN docker-php-ext-install mysqli pdo_mysql bcmath exif gd zip

# Enable apache rewrites and copy custom apache config
RUN a2enmod rewrite
# Needed for cors stuff
RUN a2enmod headers

COPY apache-confs /etc/apache2/

