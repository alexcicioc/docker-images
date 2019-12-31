FROM php:7.1-cli

RUN apt update \
    && apt install -y \
    libpng-dev \
    libgmp-dev \
    libzip-dev \
    libc-client-dev \
    libkrb5-dev \
    libldap2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    --no-install-recommends

RUN echo 'date.timezone = GMT' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'error_reporting = E_ALL \& ~E_WARNING \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'error_log = /proc/1/fd/1' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'log_errors = On' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'display_errors = Off' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'max_execution_time = -1' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'realpath_cache_size = 512k' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'realpath_cache_ttl = 600' >> /usr/local/etc/php/conf.d/docker.ini \
    && echo 'mbstring.func_overload = 0' >> /usr/local/etc/php/conf.d/docker.ini

RUN docker-php-ext-install mysqli \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install gd \
    && docker-php-ext-install gmp \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-install zip \
    && docker-php-ext-install ldap \
    && pecl install xdebug-2.7.0beta1 \
    && pecl install redis \
    && docker-php-ext-enable redis
