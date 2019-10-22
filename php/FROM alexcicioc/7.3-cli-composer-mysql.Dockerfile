FROM alexcicioc/php:7.3-cli-composer

RUN docker-php-ext-install mysqli pdo_mysql
